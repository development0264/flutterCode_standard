import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/translator/translatorexperience/add_update_exp_request_model.dart';
import 'package:khontext/src/models/translator/translatorexperience/add_update_exp_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/employment_type_response.dart';
import 'package:khontext/src/models/translator/translatorexperience/experience_list_response_model.dart';

class TranslatorExperienceApiCalls {
  /// [getEmploymentTypes] will return the [EmploymentTypeResponseModel].
  static Future<EmploymentTypeResponseModel> getEmploymentTypes() async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getEmploymentTypes);
    EmploymentTypeResponseModel responseModel;
    if (response != null) {
      responseModel = employmentTypeResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getExperienceList] will return the [ExperienceListResponseModel].
  static Future<ExperienceListResponseModel> getExperienceList(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getExperienceList + userId);
    ExperienceListResponseModel responseModel;
    if (response != null) {
      responseModel = experienceListResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addUpdateExperienceList] will take in [AddUpdateExperienceRequestModel] and
  /// return the [AddUpdateExperienceResponseModel].
  static Future<AddUpdateExperienceResponseModel> addUpdateExperienceList(
      AddUpdateExperienceRequestModel addUpdateExperienceRequestModel) async {
    var response = await ApiProvider.postAsync(
      ApiEndpoints.addUpdateExperienceList,
      body: addUpdateExperienceRequestModelToJson(addUpdateExperienceRequestModel),
    );
    AddUpdateExperienceResponseModel responseModel;
    if (response != null) {
      responseModel = addUpdateExperienceResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
