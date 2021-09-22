import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/onboarding_education_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/onboarding_education_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

class OnBoardingEducationApiCalls {
  const OnBoardingEducationApiCalls();

  /// [addOnBoardingEducationApi] will take in the [OnBoardingEducationRequestModel] return
  /// the [OnBoardingEducationResponseModel].
  static Future<OnBoardingEducationResponseModel> addOnBoardingEducationApi(
      List<OnBoardingEducationRequestModel> onBoardingEducationRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.addUpdateOnBoardingEducation,
        body: onBoardingEducationRequestModelToJson(onBoardingEducationRequestModel));
    OnBoardingEducationResponseModel responseModel;
    if (response != null) {
      responseModel = onBoardingEducationResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [deleteOnBoardingEducation] will take in the [String] language id and return
  /// the [CommonResponseModel].
  static Future<CommonResponseModel> deleteOnBoardingEducation(String educationId) async {
    var response =
        await ApiProvider.deleteAsync(ApiEndpoints.deleteOnBoardingEducation + educationId);
    CommonResponseModel responseModel;
    if (response != null) {
      responseModel = commonResponseFromJson(response.body.toString());
    }

    return responseModel;
  }
}
