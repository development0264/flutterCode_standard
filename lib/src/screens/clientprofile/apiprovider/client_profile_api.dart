import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_request_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_image_request_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_request_model.dart';
import 'package:khontext/src/models/clientprofile/client_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_image_request_model.dart';
import 'package:khontext/src/models/clientprofile/client_profile_model.dart';
import 'package:khontext/src/models/clientprofile/client_profile_request_model.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/models/signup/user_profile_response_model.dart';

class ClientProfileApiCalls {
  const ClientProfileApiCalls();

  /// [getClientProfile] will be a [GET] api and will return the [ClientProfileResponseModel].
  static Future<ClientProfileResponseModel> getClientProfile(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.clientProfile + userId);
    ClientProfileResponseModel responseModel;
    if (response != null) {
      responseModel = clientProfileResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [updateClientProfile] will take in the [UserProfileModel] and will return the [UserProfileResponseModel].
  static Future<ClientProfileResponseModel> updateClientProfile(
      String userId, ClientProfileUpdateRequestModel userProfile) async {
    var response = await ApiProvider
        .postAsync(ApiEndpoints.clientProfileUpdate + userId, body: clientProfileUpdateRequestModelToJson(userProfile));
    ClientProfileResponseModel responseModel;
    if (response != null) {
      responseModel = clientProfileResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getClientProfileImage] will be a [GET] api and will return the [ClientProfileImageResponseModel].
  static Future<ClientProfileImageResponseModel> getClientProfileImage(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.clientProfileImage + userId);
    ClientProfileImageResponseModel responseModel;
    if (response != null) {
      responseModel = clientProfileImageResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addClientProfileImage] will be a [POST] api and will return the [ClientProfileImageResponseModel].
  static Future<ClientProfileImageResponseModel> addClientProfileImage(String userId,
      {ClientProfileImageRequestModel clientProfileImageRequestModel}) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.clientProfileImageAdd + userId,
        body: clientProfileImageRequestModelToJson(clientProfileImageRequestModel));
    ClientProfileImageResponseModel responseModel;
    if (response != null) {
      responseModel = clientProfileImageResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [updateClientProfileImage] will be a [POST] api and will return the [ClientProfileImageResponseModel].
  static Future<ClientProfileImageResponseModel> updateClientProfileImage(String userId,
      {ClientProfileImageRequestModel clientProfileImageRequestModel}) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.clientProfileImageUpdate + userId,
        body: clientProfileImageRequestModelToJson(clientProfileImageRequestModel));
    ClientProfileImageResponseModel responseModel;
    if (response != null) {
      responseModel = clientProfileImageResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getClientAddress] will be a [GET] api and will return the [ClientAddressResponseModel].
  static Future<ClientAddressResponseModel> getClientAddress(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.clientAddress + userId);
    ClientAddressResponseModel responseModel;
    if (response != null) {
      responseModel = clientAddressResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addClientAddress] will be a [POST] api and will return the [ClientAddressResponseModel].
  static Future<ClientAddressResponseModel> addClientAddress(String userId,
      {AddressCreateRequestModel addressCreateRequestModel}) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.clientAddAddress + userId,
        body: addressCreateRequestModelToJson(addressCreateRequestModel));
    ClientAddressResponseModel responseModel;
    if (response != null) {
      responseModel = clientAddressResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [updateClientAddress] will be a [POST] api and will return the [ClientAddressResponseModel].
  static Future<ClientAddressResponseModel> updateClientAddress(String addressId,
      {AddressCreateRequestModel addressCreateRequestModel}) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.clientUpdateAddress + addressId,
        body: addressCreateRequestModelToJson(addressCreateRequestModel));
    ClientAddressResponseModel responseModel;
    if (response != null) {
      responseModel = clientAddressResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getClientCompany] will be a [GET] api and will return the [ClientCompanyResponseModel].
  static Future<ClientCompanyResponseModel> getClientCompany(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.clientCompany + userId);
    ClientCompanyResponseModel responseModel;
    if (response != null) {
      responseModel = clientCompanyResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addClientCompany] will be a [POST] api and will return the [ClientCompanyResponseModel].
  static Future<ClientCompanyResponseModel> addClientCompany(String userId,
      {ClientCompanyRequestModel clientCompanyRequestModel}) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.clientAddCompany + userId,
        body: clientCompanyRequestModelToJson(clientCompanyRequestModel));
    ClientCompanyResponseModel responseModel;
    if (response != null) {
      responseModel = clientCompanyResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [updateClientCompany] will be a [POST] api and will return the [ClientCompanyResponseModel].
  static Future<ClientCompanyResponseModel> updateClientCompany(String userId,
      {ClientCompanyRequestModel clientCompanyRequestModel}) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.clientUpdateCompany + userId,
        body: clientCompanyRequestModelToJson(clientCompanyRequestModel));
    ClientCompanyResponseModel responseModel;
    if (response != null) {
      responseModel = clientCompanyResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getClientCompanyImage] will be a [GET] api and will return the [ClientCompanyImageResponseModel].
  static Future<ClientCompanyImageResponseModel> getClientCompanyImage(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.clientCompanyImage + userId);
    ClientCompanyImageResponseModel responseModel;
    if (response != null) {
      responseModel = clientCompanyImageResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addClientCompanyImage] will be a [POST] api and will return the [ClientCompanyImageResponseModel].
  static Future<ClientCompanyImageResponseModel> addClientCompanyImage(String userId,
      {ClientCompanyImageRequestModel clientCompanyImageRequestModel}) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.clientCompanyImageAdd + userId,
        body: clientCompanyImageRequestModelToJson(clientCompanyImageRequestModel));
    ClientCompanyImageResponseModel responseModel;
    if (response != null) {
      responseModel = clientCompanyImageResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [updateClientCompanyImage] will be a [POST] api and will return the [ClientCompanyImageResponseModel].
  static Future<ClientCompanyImageResponseModel> updateClientCompanyImage(String userId,
      {ClientCompanyImageRequestModel clientCompanyImageRequestModel}) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.clientCompanyImageUpdate + userId,
        body: clientCompanyImageRequestModelToJson(clientCompanyImageRequestModel));
    ClientCompanyImageResponseModel responseModel;
    if (response != null) {
      responseModel = clientCompanyImageResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
