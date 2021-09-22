/// Group of functions which gives the actions for the [PostJobPage].
/// This group contains [ChangeTranslatePageAction] which takes in the queries and gives out the response as
/// either [ChangeTranslatePageSuccessAction] or [ChangeTranslatePageErrorAction].
class ChangeTranslatePageAction {
  final int currentPage;

  ChangeTranslatePageAction({this.currentPage});
}

class ChangeTranslatePageErrorAction {
  final String error;

  ChangeTranslatePageErrorAction({this.error});
}

class ChangeTranslatePageSuccessAction {
  final int newPage;

  ChangeTranslatePageSuccessAction({this.newPage});
}
