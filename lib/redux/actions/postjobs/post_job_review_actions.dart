import 'package:flutter/material.dart';
import 'package:khontext/src/models/postjobs/jobreview/job_review_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [PostJobReviewFetchAction] which takes in the queries and gives out the response as
/// either [PostJobReviewFetchSuccessAction] or [PostJobReviewFetchErrorAction].
class PostJobReviewFetchAction {
  final String jobId;

  PostJobReviewFetchAction({this.jobId});
}

class PostJobReviewFetchErrorAction {
  final String error;

  PostJobReviewFetchErrorAction({this.error});
}

class PostJobReviewFetchSuccessAction {
  final JobReviewResponseModel jobReviewResponseModel;

  PostJobReviewFetchSuccessAction({this.jobReviewResponseModel});
}

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [SetJobReviewAction] which takes in the queries and gives out the response as
/// either [SetJobReviewSuccessAction] or [SetJobReviewErrorAction].
class SetJobReviewAction {
  final String jobId;
  final BuildContext context;

  SetJobReviewAction({this.jobId, this.context});
}

class SetJobReviewErrorAction {
  final String error;

  SetJobReviewErrorAction({this.error});
}

class SetJobReviewSuccessAction {
  final CommonResponseModel commonResponseModel;

  SetJobReviewSuccessAction({this.commonResponseModel});
}
