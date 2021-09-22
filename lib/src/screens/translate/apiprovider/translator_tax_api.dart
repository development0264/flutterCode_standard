import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/translator/translatortax/user_add_request_model.dart';
import 'package:khontext/src/models/translator/translatortax/user_add_response_model.dart';

class TranslatorTaxApiCalls {
  /// [getExistingUserAdd] will return the [UserAddResponseModel].
  static Future<UserAddResponseModel> getExistingUserAdd(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getExistingUserAddress + userId);
    UserAddResponseModel responseModel;
    if (response != null) {
      responseModel = userAddResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addUpdateUserAddress] will take in [AddUserAddressRequestModel] and
  /// return the [AddUpdateLanguageResponse].
  static Future<UserAddResponseModel> addUpdateUserAddress(
      AddUserAddressRequestModel addressRequestModel) async {
    var response = await ApiProvider.postAsync(
      ApiEndpoints.addUserAddress,
      body: addUserAddressRequestModelToJson(addressRequestModel),
    );
    UserAddResponseModel responseModel;
    if (response != null) {
      responseModel = userAddResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
