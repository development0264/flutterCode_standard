import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/onboarding/onboarding_data_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';

class OnBoardingApiCalls {
  const OnBoardingApiCalls();

  /// [getOnBoardingData] will take in the user id and return the [OnBoardingDataResponseModel].
  static Future<OnBoardingDataResponseModel> getOnBoardingData(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getOnBoard + userId);
    OnBoardingDataResponseModel responseModel;
    if (response != null) {
      responseModel = onBoardingDataResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addFileDocument] will take in the [DocumentUploadRequestModel] and will return the [DocumentUploadResponseModel].
  static Future<DocumentUploadResponseModel> addFileDocument(
      DocumentUploadRequestModel jobImageUploadRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.addDocumentFile,
        body: documentUploadRequestModelToJson(jobImageUploadRequestModel));
    DocumentUploadResponseModel responseModel;
    if (response != null) {
      responseModel = documentUploadResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
