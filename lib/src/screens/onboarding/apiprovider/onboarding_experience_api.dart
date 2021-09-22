import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/employment_type_response.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/onboarding_experience_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/onboarding_experience_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

class OnBoardingExperienceApiCalls {
  const OnBoardingExperienceApiCalls();

  /// [getEmploymentTypes] will return the [EmploymentTypeResponseModel].
  static Future<EmploymentTypeResponseModel> getEmploymentTypes() async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getEmploymentTypes);
    EmploymentTypeResponseModel responseModel;
    if (response != null) {
      responseModel = employmentTypeResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addOnBoardingExperienceApi] will take in the [OnBoardingExperienceRequestModel] return
  /// the [OnBoardingExperienceResponseModel].
  static Future<OnBoardingExperienceResponseModel> addOnBoardingExperienceApi(
      OnBoardingExperienceRequestModel onBoardingEducationRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.addUpdateOnBoardingExperience,
        body: onBoardingExperienceRequestModelToJson(onBoardingEducationRequestModel));
    OnBoardingExperienceResponseModel responseModel;
    if (response != null) {
      responseModel = onBoardingExperienceResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [deleteOnBoardingExperience] will take in the [String] language id and return
  /// the [CommonResponseModel].
  static Future<CommonResponseModel> deleteOnBoardingExperience(String experienceId) async {
    var response =
        await ApiProvider.deleteAsync(ApiEndpoints.deleteOnBoardingExperience + experienceId);
    CommonResponseModel responseModel;
    if (response != null) {
      responseModel = commonResponseFromJson(response.body.toString());
    }

    return responseModel;
  }
}
