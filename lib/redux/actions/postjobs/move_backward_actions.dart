import 'package:khontext/src/models/posted_jobs_model.dart';

/// Group of functions which gives the actions for the [PostJobPage].
/// This group contains [MoveBackwardAction] which takes in the queries and gives out the response as
/// either [MoveBackwardSuccessAction] or [MoveBackwardErrorAction].
class MoveBackwardAction {
  final dynamic data;

  MoveBackwardAction({this.data});
}

class MoveBackwardErrorAction {
  final String error;

  MoveBackwardErrorAction({this.error});
}

class MoveBackwardSuccessAction {
  PostedJobsModel model;

  MoveBackwardSuccessAction({this.model});
}
