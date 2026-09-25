<#
.SYNOPSIS
  Update, version and deploy the site to Cloudflare Pages.

.EXAMPLE
  .\deploy.ps1                  # 2.0.0 -> 2.0.1, commit, tag, push, deploy
  .\deploy.ps1 -Bump minor      # 2.0.0 -> 2.1.0
  .\deploy.ps1 -Version 3.0.0   # set an exact version
  .\deploy.ps1 -BuildCv         # also rebuild the CV PDFs first
  .\deploy.ps1 -NoBump          # deploy the current version again
  .\deploy.ps1 -NoDeploy        # version and push only
#>
[CmdletBinding()]
param(
  [ValidateSet('patch', 'minor', 'major')]
  [string]$Bump = 'patch',
  [string]$Version,
  [switch]$NoBump,
  [switch]$BuildCv,
  [switch]$NoDeploy,
  [string]$Project = 'b1101-portfolio',
  [string]$Branch = 'main'
)

$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

function Step($text) { Write-Host "`n> $text" -ForegroundColor Yellow }
# Run a command and stop if it fails. Kept as a plain function so flags like --ff-only pass straight through.
function Run {
  $exe, $rest = $args
  & $exe @rest
  if ($LASTEXITCODE -ne 0) { throw "$($args -join ' ') failed (exit $LASTEXITCODE)" }
}

# ---------- checks ----------
foreach ($tool in 'git', 'node') {
  if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) { throw "$tool is not installed or not on PATH." }
}
$wrangler = @(if (Get-Command wrangler -ErrorAction SilentlyContinue) { 'wrangler' } else { 'npx'; 'wrangler' })

$current = (git rev-parse --abbrev-ref HEAD).Trim()
if ($current -ne $Branch) { throw "You're on '$current'. Switch to '$Branch' first." }

# ---------- update ----------
Step "Pulling the latest $Branch"
Run git pull --ff-only origin $Branch

if ($BuildCv) {
  Step 'Rebuilding the CV PDFs'
  Run node cv/build.mjs
}

# ---------- version ----------
$old = (Get-Content VERSION -Raw).Trim()
$new = $old
if (-not $NoBump) {
  if ($Version) {
    if ($Version -notmatch '^\d+\.\d+\.\d+$') { throw "Version must look like 2.1.0, got '$Version'." }
    $new = $Version
  } else {
    $p = $old.Split('.') | ForEach-Object { [int]$_ }
    switch ($Bump) {
      'major' { $new = "$($p[0] + 1).0.0" }
      'minor' { $new = "$($p[0]).$($p[1] + 1).0" }
      'patch' { $new = "$($p[0]).$($p[1]).$($p[2] + 1)" }
    }
  }
  if (git tag --list "v$new") { throw "Tag v$new already exists." }

  Step "Version $old -> $new"
  Run node tools/version.mjs $new
}

# ---------- commit, tag, push ----------
$changes = git status --porcelain
if ($changes) {
  Write-Host ($changes -join "`n")
  Step "Committing as v$new"
  Run git add -A
  Run git commit -m "v$new"
}
if (-not (git tag --list "v$new")) {
  Run git tag -a "v$new" -m "v$new"
}
Step 'Pushing to GitHub'
Run git push origin $Branch
Run git push origin "v$new"

if ($NoDeploy) { Write-Host "`nDone. v$new is pushed, not deployed." -ForegroundColor Green; return }

# ---------- deploy ----------
# Only the files the site needs go up; sources like cv/build.mjs stay out.
Step 'Collecting the site files'
$dist = Join-Path $PSScriptRoot '.dist'
if (Test-Path $dist) { Remove-Item $dist -Recurse -Force }
New-Item -ItemType Directory $dist | Out-Null
$files = @('index.html', 'google91d02b3e4046cb2c.html', '_headers')
$dirs = @('css', 'js', 'img', 'assets', 'cv/pdf')
foreach ($f in $files) { if (Test-Path $f) { Copy-Item $f $dist } }
foreach ($d in $dirs) {
  $target = Join-Path $dist $d
  New-Item -ItemType Directory (Split-Path $target) -Force | Out-Null
  Copy-Item $d $target -Recurse
}
Get-ChildItem $dist -Recurse -Filter '.*' -File | Remove-Item -Force

Step "Deploying to Cloudflare Pages ($Project)"
$hash = (git rev-parse HEAD).Trim()
try {
  Run @wrangler pages deploy $dist --project-name $Project --branch $Branch --commit-hash $hash --commit-message "v$new"
} finally {
  Remove-Item $dist -Recurse -Force
}
Write-Host "`nDone. v$new is live." -ForegroundColor Green
