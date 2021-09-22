import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/posted_jobs_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/job_languages_request_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/job_languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';

/// Class which will help calling the apis for the [PostedJobsLanguage].
class PostJobLanguagesApiCalls {
  /// [getLanguages] will return the [LanguagesResponseModel].
  static Future<LanguagesResponseModel> getLanguages() async {
    var response = await ApiProvider.getAsync(ApiEndpoints.languages);
    LanguagesResponseModel responseModel;
    if (response != null) {
      responseModel = languagesResponseModelFromJson(response.body.toString());
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

  /// [getJobLanguages] will return the [JobLanguagesResponseModel].
  static Future<JobLanguagesResponseModel> getJobLanguages(String jobId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.jobsLanguages + jobId);
    JobLanguagesResponseModel responseModel;
    if (response != null) {
      responseModel = jobLanguagesResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addUpdateJobLanguages] will take in the [JobLanguagesRequestModel] return the [JobLanguagesResponseModel].
  static Future<JobLanguagesResponseModel> addUpdateJobLanguages(
      JobLanguagesRequestModel jobLanguagesRequestModel) async {
    var response = await ApiProvider
        .postAsync(ApiEndpoints.addUpdateJobsLanguages, body: jobLanguagesRequestModelToJson(jobLanguagesRequestModel));
    JobLanguagesResponseModel responseModel;
    if (response != null) {
      responseModel = jobLanguagesResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
