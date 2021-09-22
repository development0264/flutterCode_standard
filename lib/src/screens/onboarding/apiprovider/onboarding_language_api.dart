import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/onboarding_add_lang_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/onboarding_add_lang_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

class OnBoardingLanguageApiCalls {
  const OnBoardingLanguageApiCalls();

  /// [addOnBoardingLanguageApi] will take in the [OnBoardingAddLangRequestModel] return
  /// the [OnBoardingAddLangResponseModel].
  static Future<OnBoardingAddLangResponseModel> addOnBoardingLanguageApi(
      List<OnBoardingAddLangRequestModel> onBoardingAddLangRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.addUpdateOnBoardingLanguage,
        body: onBoardingAddLangRequestModelToJson(onBoardingAddLangRequestModel));
    OnBoardingAddLangResponseModel responseModel;
    if (response != null) {
      responseModel = onBoardingAddLangResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [deleteOnBoardingLanguage] will take in the [String] language id and return
  /// the [CommonResponseModel].
  static Future<CommonResponseModel> deleteOnBoardingLanguage(String languageId) async {
    var response =
        await ApiProvider.deleteAsync(ApiEndpoints.deleteOnBoardingLanguage + languageId);
    CommonResponseModel responseModel;
    if (response != null) {
      responseModel = commonResponseFromJson(response.body.toString());
    }

    return responseModel;
  }
}
