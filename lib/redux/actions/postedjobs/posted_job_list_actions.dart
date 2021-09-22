import 'package:khontext/src/models/postedjobs/post_jobs_list_request_model.dart';
import 'package:khontext/src/models/postedjobs/post_jobs_list_response_model.dart';

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [PostedJobListFetchAction] which takes in the queries and gives out the response as
/// either [PostedJobListSuccessAction] or [PostedJobListErrorAction].
class PostedJobListFetchAction {
  final PostedJobsRequestModel postedJobsRequestModel;

  PostedJobListFetchAction({this.postedJobsRequestModel});
}

class PostedJobListErrorAction {
  final String error;

  PostedJobListErrorAction({this.error});
}

class PostedJobListSuccessAction {
  final JobsListResponseModel jobReviewResponseModel;

  PostedJobListSuccessAction({this.jobReviewResponseModel});
}
