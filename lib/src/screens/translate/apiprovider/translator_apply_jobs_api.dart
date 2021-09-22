import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_update_apply_job_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_update_apply_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/apply_jobs_list_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

class TranslatorApplyJobsApiCalls {
  /// [getApplyJobsList] will return the [ApplyJobsListResponse].
  static Future<ApplyJobsListResponse> getApplyJobsList(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.applyJobsList + userId);
    ApplyJobsListResponse responseModel;
    if (response != null) {
      responseModel = applyJobsListResponseFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addUpdateApplyJobs] will take in [AddUpdateApplyJobsRequest] and
  /// return the [AddUpdateApplyJobsResponse].
  static Future<AddUpdateApplyJobsResponse> addUpdateApplyJobs(
      AddUpdateApplyJobsRequest addUpdateApplyJobsRequest) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.addUpdateApplyJobs,
        body: addUpdateApplyJobsRequestToJson(addUpdateApplyJobsRequest));
    AddUpdateApplyJobsResponse responseModel;
    if (response != null) {
      responseModel = addUpdateApplyJobsResponseFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [removeApplyJobs] will take in [String] apply job id and
  /// return the [CommonResponseModel].
  static Future<CommonResponseModel> removeApplyJobs(String jobId) async {
    var response = await ApiProvider.deleteAsync(ApiEndpoints.removeApplyJobs + jobId);
    CommonResponseModel responseModel;
    if (response != null) {
      responseModel = commonResponseFromJson(response.body.toString());
    }

    return responseModel;
  }
}
