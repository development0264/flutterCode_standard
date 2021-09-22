import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_request_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_states_model.dart';

/// Class which will help calling the apis for the [PostedJobsVisibility].
class PostJobVisibilityApiCalls {
  /// [getStates] will return the [JobStatesResponseModel].
  static Future<JobStatesResponseModel> getStates() async {
    var response = await ApiProvider.getAsync(ApiEndpoints.states);
    JobStatesResponseModel responseModel;
    if (response != null) {
      responseModel = jobStatesResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getSpecializations] will return the [SpecializationsResponseModel].
  static Future<SpecializationsResponseModel> getSpecializations() async {
    var response = await ApiProvider.getAsync(ApiEndpoints.specializations);
    SpecializationsResponseModel responseModel;
    if (response != null) {
      responseModel = specializationsResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getProficiency] will return the [ProficiencyResponseModel].
  static Future<ProficiencyResponseModel> getProficiency() async {
    var response = await ApiProvider.getAsync(ApiEndpoints.proficiencyLevel);
    ProficiencyResponseModel responseModel;
    if (response != null) {
      responseModel = jobProficiencyResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getJobVisibility] will return the [JobVisibilityResponseModel].
  static Future<JobVisibilityResponseModel> getJobVisibility(String jobId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.jobVisibility + jobId);
    JobVisibilityResponseModel responseModel;
    if (response != null) {
      responseModel = jobVisibilityResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addUpdateJobVisibility] will return the [JobVisibilityResponseModel].
  static Future<JobVisibilityResponseModel> addUpdateJobVisibility(
      JobVisibilityRequestModel jobVisibilityRequestModel) async {
    var response = await ApiProvider.postAsync(
      ApiEndpoints.addUpdateJobVisibility,
      body: jobVisibilityRequestModelToJson(jobVisibilityRequestModel),
    );
    JobVisibilityResponseModel responseModel;
    if (response != null) {
      responseModel = jobVisibilityResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
