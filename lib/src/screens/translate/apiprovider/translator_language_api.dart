import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/translator/translatorlanguage/add_update_language_request.dart';
import 'package:khontext/src/models/translator/translatorlanguage/add_update_language_response.dart';
import 'package:khontext/src/models/translator/translatorlanguage/delete_language_response_model.dart';
import 'package:khontext/src/models/translator/translatorlanguage/language_list_response.dart';

class TranslatorLanguageApiCalls {
  /// [getLanguageList] will return the [TranslatorLanguageListResponse].
  static Future<TranslatorLanguageListResponse> getLanguageList(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getLanguageList + userId);
    TranslatorLanguageListResponse responseModel;
    if (response != null) {
      responseModel = translatorLanguageListResponseFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addUpdateLanguageList] will take in [AddUpdateLanguageRequest] and
  /// return the [AddUpdateLanguageResponse].
  static Future<AddUpdateLanguageResponse> addUpdateLanguageList(
      AddUpdateLanguageRequest addUpdateLanguageRequest) async {
    var response = await ApiProvider.postAsync(
      ApiEndpoints.addLanguage,
      body: addUpdateLanguageRequestToJson(addUpdateLanguageRequest),
    );
    AddUpdateLanguageResponse responseModel;
    if (response != null) {
      responseModel = addUpdateLanguageResponseFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [deleteLanguage] will take in [String] language id and
  /// return the [DeleteLanguageResponseModel].
  static Future<DeleteLanguageResponseModel> deleteLanguage(String languageId) async {
    var response = await ApiProvider.deleteAsync(ApiEndpoints.deleteLanguage + languageId);
    DeleteLanguageResponseModel responseModel;
    if (response != null) {
      responseModel = deleteLanguageResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
