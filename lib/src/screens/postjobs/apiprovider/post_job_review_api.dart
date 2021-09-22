import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/postjobs/jobreview/job_review_response_model.dart';

/// Class which will help calling the apis for the [PostedJobsReview].
class PostJobReviewApiCalls {
  /// [getReview] will return the [JobReviewResponseModel].
  static Future<JobReviewResponseModel> getReview(String jobId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.jobReview + jobId);
    JobReviewResponseModel responseModel;
    if (response != null) {
      responseModel = jobReviewResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
