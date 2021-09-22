import 'package:khontext/src/models/postjobs/post_job_status_model.dart';

/// Group of functions which gives the actions for the [PostJobPage].
/// This group contains [MoveForwardAction] which takes in the queries and gives out the response as
/// either [MoveForwardSuccessAction] or [MoveForwardErrorAction].
class MoveForwardAction {
  final dynamic data;

  MoveForwardAction({this.data});
}

class MoveForwardErrorAction {
  final String error;

  MoveForwardErrorAction({this.error});
}

class MoveForwardSuccessAction {
  List<PostJobsStatusModel> jobsPostList;

  MoveForwardSuccessAction({this.jobsPostList});
}
