import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/postedjobs/post_jobs_list_request_model.dart';
import 'package:khontext/src/models/postedjobs/post_jobs_list_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

/// Class which will help calling the apis for the [PostedJobsList].
class PostedJobApiCalls {
  /// [getJobsList] will return the [JobsListResponseModel].
  static Future<JobsListResponseModel> getJobsList(
      PostedJobsRequestModel translatorJobsRequest) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.jobsList,
        body: postedJobsRequestModelToJson(translatorJobsRequest));
    JobsListResponseModel responseModel;
    if (response != null) {
      responseModel = jobsListResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [setReviewJob] will return the [CommonResponseModel].
  static Future<CommonResponseModel> setReviewJob(String jobId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.isJobReview + jobId);
    CommonResponseModel responseModel;
    if (response != null) {
      responseModel = commonResponseFromJson(response.body.toString());
    }

    return responseModel;
  }
}
