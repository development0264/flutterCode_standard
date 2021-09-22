import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/translator/translatoridentification/add_translator_identify_request_model.dart';
import 'package:khontext/src/models/translator/translatoridentification/add_translator_identiy_response_model.dart';

class TranslatorIdentificationApiCalls {
  /// [getIdentification] will return the [AddIdentificationResponseModel].
  static Future<AddIdentificationResponseModel> getIdentification(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getIdentificationList + userId);
    AddIdentificationResponseModel responseModel;
    if (response != null) {
      responseModel = addIdentificationResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addIdentification] will return the [AddIdentificationResponseModel].
  static Future<AddIdentificationResponseModel> addIdentification(
      AddIdentificationRequestModel addIdentificationRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.addIdentification,
        body: addIdentificationRequestModelToJson(addIdentificationRequestModel));
    AddIdentificationResponseModel responseModel;
    if (response != null) {
      responseModel = addIdentificationResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
