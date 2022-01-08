enum ToastState {
  info,
  success,
  error,
}

enum PageId {
  profile,
  classify,
  inProgress,
  dashboard,
  addCow,
  cows,
  cowProfile,
  reminder,
  ratedCows,
  subscriptions,
  detailsInfo,
}

enum AddCowPageId {
  importFromFile,
  addCow,
  completeCowProfile,
  addImage,
  previewInformation,
}

enum AddCowFromPageId {
  dashboard,
  cowList,
  cowProfile,
}

enum StepStatus {
  done,
  inProgress,
  next,
}

enum ProfilePageId {
  main,
  edit,
}

enum FileExtensions {
  png,
  jpg,
  jpeg,
  gif,
  pdf,
  doc,
  docx,
  txt,
  xls,
  xlsx,
}

enum CowsListFromPageId {
  dashboard,
  profile,
}

enum CowsCategoryId {
  allCows,
  // folder,
  archive,
}

enum OrderBy {
  birth,
  id,
  rate,
  status,
}

enum CheckBoxState {
  none,
  some,
  all,
}

enum TextCounterId {
  none,
  name,
  description,
}

enum DismissState {
  none,
  dismissStart,
  dismissEnd,
}

enum ClassificationPageId {
  startClassification,
  repClassification,
  selectCows,
  selectPlan,
  preview,
  billingReview,
}

enum ClassificationMode {
  userSelect,
  rep,
}

enum ClassificationFromPage {
  dashboard,
  profile,
  cowsList,
  cowProfile,
  cowProfileDetails,
  reminder,
  addCow,
  ratedCows,
  inProgress,
  cowsInProgress,
  detailsInfo,
}

enum InProgressFromPage {
  dashboard,
  profile,
  cowsList,
  cowProfile,
  cowProfileDetails,
  reminder,
  addCow,
  ratedCows,
  classify,
}

enum InProgressPageId {
  main,
  cowsInList,
}

enum ClassifyStatus {
  preOrder,
  successPayment,
  failPayment,
  cancel,
  done,
}

enum CowProfileFromPageId {
  classify,
  cowList,
  ratedCows,
}

enum CowProfilePageId {
  main,
  edit,
}

enum AnimalStatus {
  normal,
  deleted,
  readyToReqeuest,
}

enum DeleteMode {
  folder,
  cows,
  cow,
  classification,
  classifyCow,
  reminder,
}

enum RatedCowsFromPageId {
  dashboard,
  profile,
}
enum ReminderFromPageId {
  dashboard,
  profile,
}

enum ForgetPasswordPageId {
  enterEmail,
  emailSent,
  newPass,
}

enum DetailsInfoFromPageId {
  classification,
  cowProfile,
}

enum Membership {
  addToBill,
  payNow,
}

enum ClassificationNext {
  showMembershipPopup,
  requestClassify,
  getBillingInfo,
  none,
}

enum Direction {
  desc,
  asc,
}

enum MeasurementUnit {
  standard,
  american,
}

enum FarmReportPages {
  herd,
  farm,
  breed,
}

enum LactionMode {
  none,
  first,
  all,
}

enum ReportTab {
  overall,
  traits,
}

enum ChartTab {
  score,
  deviation,
  trend,
}
enum HerdDeviation {
  idealScore,
  farmAverage,
  breedAverage,
}

enum FarmDeviation {
  idealScore,
  breedAverage,
}

enum BreedDeviation {
  idealScore,
}

enum FarmYear {
  oneYear,
  twoYear,
  threeYear,
  fourYear,
  fiveYear,
  more,
}

enum PeriodType {
  none,
  monthly,
  yearly,
}
