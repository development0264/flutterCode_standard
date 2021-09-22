import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_fav_job_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_fav_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_fav_jobs_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_fav_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_jobs_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_jobs_response.dart';

class TranslatorJobsApiCalls {
  /// [fetchTranslatorJobs] will take in the [TranslatorJobsRequest] return
  /// the [TranslatorJobsResponse].
  static Future<TranslatorJobsResponse> fetchTranslatorJobs(
      TranslatorJobsRequest translatorJobsRequest) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.searchJobs,
        body: translatorJobsRequestToJson(translatorJobsRequest));
    TranslatorJobsResponse responseModel;
    if (response != null) {
      responseModel = translatorJobsResponseFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [fetchTranslatorFavoriteJobs] will take in the [TranslatorFavJobsRequest] return
  /// the [TranslatorFavJobsResponse].
  static Future<TranslatorFavJobsResponse> fetchTranslatorFavoriteJobs(
      TranslatorFavJobsRequest translatorFavJobsRequest) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.favoriteJobs,
        body: translatorFavJobsRequestToJson(translatorFavJobsRequest));
    TranslatorFavJobsResponse responseModel;
    if (response != null) {
      responseModel = translatorFavJobsResponseFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addTranslatorFavoriteJobs] will take in the [AddFavJobRequest] return
  /// the [AddFavJobResponse].
  static Future<AddFavJobResponse> addTranslatorFavoriteJobs(
      AddFavJobRequest addFavJobRequest) async {
    var response = await ApiProvider
        .postAsync(ApiEndpoints.addFavoriteJob, body: addFavJobRequestToJson(addFavJobRequest));
    AddFavJobResponse responseModel;
    if (response != null) {
      responseModel = addFavJobResponseFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [deleteTranslatorFavoriteJobs] will take in the [String] JobId return
  /// the [CommonResponseModel].
  static Future<CommonResponseModel> deleteTranslatorFavoriteJobs(String jobId) async {
    var response = await ApiProvider.deleteAsync(ApiEndpoints.removeFavoriteJob + jobId);
    CommonResponseModel responseModel;
    if (response != null) {
      responseModel = commonResponseFromJson(response.body.toString());
    }

    return responseModel;
  }
}
