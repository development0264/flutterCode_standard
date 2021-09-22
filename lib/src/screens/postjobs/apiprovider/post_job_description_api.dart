import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_request_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_services_response_model.dart';

/// Class which will help calling the apis for the [PostedJobsDescription].
class PostJobDescriptionApiCalls {
  /// [getJobServices] will return the [PostJobServicesResponseModel].
  static Future<PostJobServicesResponseModel> getJobServices() async {
    var response = await ApiProvider.getAsync(ApiEndpoints.jobServices);
    PostJobServicesResponseModel responseModel;
    if (response != null) {
      responseModel = jobServicesResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getJobDescription] will take in the [String] job id and will return the [JobDescriptionResponseModel].
  static Future<JobDescriptionResponseModel> getJobDescription(String jobId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.jobDescription + jobId);
    JobDescriptionResponseModel responseModel;
    if (response != null) {
      responseModel = jobDescriptionResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addUpdateJobDescription] will take in the [JobDescriptionRequestModel] and will return the [JobDescriptionResponseModel].
  static Future<JobDescriptionResponseModel> addUpdateJobDescription(
      JobDescriptionRequestModel jobDescriptionRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.addUpdateDescription,
        body: jobDescriptionRequestModelToJson(jobDescriptionRequestModel));
    JobDescriptionResponseModel responseModel;
    if (response != null) {
      responseModel = jobDescriptionResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
