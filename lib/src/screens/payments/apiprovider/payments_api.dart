import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/payments/add_payment_method_request.dart';
import 'package:khontext/src/models/payments/add_payment_method_response.dart';
import 'package:khontext/src/models/payments/delete_payment_method_request.dart';
import 'package:khontext/src/models/payments/delete_payment_method_response.dart';
import 'package:khontext/src/models/payments/payment_method_list_model.dart';
import 'package:khontext/src/models/payments/update_payment_method_request.dart';
import 'package:khontext/src/models/payments/user_address_list_model.dart';
import 'package:khontext/utils/enums.dart';

class PaymentsApiCalls {
  const PaymentsApiCalls();

  /// [getUsersAddressList] will take in the [String] userid and will return the [UserAddressListResponseModel]
  static Future<UserAddressListResponseModel> getUsersAddressList(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getUserAddressList + userId);
    UserAddressListResponseModel responseModel;
    if (response != null) {
      responseModel = userAddressListResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [createCustomerPaymentMethod] will take in the [CreatePaymentMethodRequestModel] and will
  /// return the [AddPaymentMethodResponseModel].
  static Future<AddPaymentMethodResponseModel> createCustomerPaymentMethod(
      USERTYPE usertype, CreatePaymentMethodRequestModel createCustomerPaymentMethodRequestModel) async {
    var response = await ApiProvider.postAsync(
      usertype == USERTYPE.CLIENT
          ? ApiEndpoints.createCustomerPaymentMethod
          : ApiEndpoints.createTranslatorPaymentMethod,
      body: createCustomerPaymentMethodRequestModelToJson(createCustomerPaymentMethodRequestModel),
    );
    AddPaymentMethodResponseModel responseModel;
    if (response != null) {
      responseModel = addPaymentMethodResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getPaymentMethodList] will take in the [String] userid and will return the [UserAddressListResponseModel]
  static Future<PaymentMethodListModel> getPaymentMethodList(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getPaymentMethodList + userId);
    PaymentMethodListModel responseModel;
    if (response != null) {
      responseModel = paymentMethodListModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [updateCustomerPaymentMethod] will take in the [UpdatePaymentMethodRequestModel] and will
  /// return the [AddPaymentMethodResponseModel].
  static Future<AddPaymentMethodResponseModel> updateCustomerPaymentMethod(
      USERTYPE usertype, UpdatePaymentMethodRequestModel updatePaymentMethodRequestModel) async {
    var response = await ApiProvider.postAsync(
      usertype == USERTYPE.CLIENT
          ? ApiEndpoints.updateCustomerPaymentMethod
          : ApiEndpoints.updateTranslatorPaymentMethod,
      body: updatePaymentMethodRequestModelToJson(updatePaymentMethodRequestModel),
    );
    AddPaymentMethodResponseModel responseModel;
    if (response != null) {
      responseModel = addPaymentMethodResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [deleteCustomerPaymentMethod] will take in the [DeletePaymentMethodRequestModel] and will
  /// return the [AddPaymentMethodResponseModel].
  static Future<DeletePaymentMethodResponseModel> deleteCustomerPaymentMethod(
      USERTYPE usertype, DeletePaymentMethodRequestModel deletePaymentMethodRequestModel) async {
    var response = await ApiProvider.postAsync(
      usertype == USERTYPE.CLIENT
          ? ApiEndpoints.deleteCustomerPaymentMethod
          : ApiEndpoints.deleteTranslatorPaymentMethod,
      body: deletePaymentMethodRequestModelToJson(deletePaymentMethodRequestModel),
    );
    DeletePaymentMethodResponseModel responseModel;
    if (response != null) {
      responseModel = deletePaymentMethodResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
