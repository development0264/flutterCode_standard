import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/translator/translatoreducation/add_update_edu_request_model.dart';
import 'package:khontext/src/models/translator/translatoreducation/add_update_edu_response_model.dart';
import 'package:khontext/src/models/translator/translatoreducation/education_list_response_model.dart';

class TranslatorEducationApiCalls {
  /// [getEducationList] will return the [EducationListResponseModel].
  static Future<EducationListResponseModel> getEducationList(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getEducationList + userId);
    EducationListResponseModel responseModel;
    if (response != null) {
      responseModel = educationListResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addUpdateEducationList] will take in [AddUpdateEducationRequestModel] and
  /// return the [AddUpdateEducationResponseModel].
  static Future<AddUpdateEducationResponseModel> addUpdateEducationList(
      AddUpdateEducationRequestModel addUpdateEducationRequestModel) async {
    var response = await ApiProvider.postAsync(
      ApiEndpoints.addUpdateEducationList,
      body: addUpdateEducationRequestModelToJson(addUpdateEducationRequestModel),
    );
    AddUpdateEducationResponseModel responseModel;
    if (response != null) {
      responseModel = addUpdateEducationResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
