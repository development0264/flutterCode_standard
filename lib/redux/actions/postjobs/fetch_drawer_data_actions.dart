import 'package:flutter/cupertino.dart';
import 'package:khontext/src/models/postjobs/post_job_status_model.dart';

/// Group of functions which gives the actions for the [PostJobPage].
/// This group contains [DrawerDataFetchAction] which takes in the queries and gives out the response as
/// either [DrawerDataSuccessAction] or [DrawerDataErrorAction].
class DrawerDataFetchAction {
  final BuildContext context;
 DrawerDataFetchAction({this.context});
}

class DrawerDataErrorAction {
  final String error;

  DrawerDataErrorAction({this.error});
}

class DrawerDataSuccessAction {
  List<PostJobsStatusModel> jobsPostList;

  DrawerDataSuccessAction({this.jobsPostList});
}