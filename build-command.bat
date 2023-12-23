@ECHO OFF
PAUSE>nul|set/p =Press "Enter" to run command "flutter clean"
start cmd /c flutter clean
ECHO:
PAUSE>nul|set/p =Press "Enter" to run command "flutter pub get"
start cmd /c flutter pub get
ECHO:
PAUSE>nul|set/p =Press "Enter" to run command "flutter build web --web-renderer canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=/canvaskit/"
start cmd /c flutter build web --web-renderer canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=/canvaskit/
ECHO: