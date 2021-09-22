/// Group of functions which gives the actions for the [PostJobPage].
/// This group contains [ChangeCurrentPageAction] which takes in the queries and gives out the response as
/// either [ChangeCurrentPageSuccessAction] or [ChangeCurrentPageErrorAction].
class ChangeCurrentPageAction {
  final int currentPage;

  ChangeCurrentPageAction({this.currentPage});
}

class ChangeCurrentPageErrorAction {
  final String error;

  ChangeCurrentPageErrorAction({this.error});
}

class ChangeCurrentPageSuccessAction {
  final int newPage;

  ChangeCurrentPageSuccessAction({this.newPage});
}
