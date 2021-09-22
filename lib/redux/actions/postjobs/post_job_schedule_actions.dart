import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_request_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [PostJobScheduleFetchAction] which takes in the queries and gives out the response as
/// either [PostJobScheduleFetchSuccessAction] or [PostJobScheduleFetchErrorAction].
class PostJobScheduleFetchAction {
  final String jobId;

  PostJobScheduleFetchAction({this.jobId});
}

class PostJobScheduleFetchErrorAction {
  final String error;

  PostJobScheduleFetchErrorAction({this.error});
}

class PostJobScheduleFetchSuccessAction {
  final JobScheduleResponseModel jobScheduleResponseModel;

  PostJobScheduleFetchSuccessAction({this.jobScheduleResponseModel});
}

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [AddJobScheduleAction] which takes in the queries and gives out the response as
/// either [AddJobScheduleSuccessAction] or [AddJobScheduleErrorAction].
class AddJobScheduleAction {
  final JobScheduleRequestModel jobScheduleRequestModel;

  AddJobScheduleAction({this.jobScheduleRequestModel});
}

class AddJobScheduleErrorAction {
  final String error;

  AddJobScheduleErrorAction({this.error});
}

class AddJobScheduleSuccessAction {
  final JobScheduleResponseModel jobScheduleResponseModel;

  AddJobScheduleSuccessAction({this.jobScheduleResponseModel});
}
