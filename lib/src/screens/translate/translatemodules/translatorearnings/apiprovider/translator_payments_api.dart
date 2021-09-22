import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/payments/add_payment_method_request.dart';
import 'package:khontext/src/models/payments/add_payment_method_response.dart';
import 'package:khontext/src/models/translator/translatorearnings/bank_account_source_request.dart';
import 'package:khontext/src/models/translator/translatorearnings/bank_account_source_response.dart';
import 'package:khontext/src/models/translator/translatorearnings/plaid_token_generate_model.dart';
import 'package:khontext/src/models/translatorpayments/create_stripe_account_request.dart';
import 'package:khontext/src/models/translatorpayments/create_stripe_account_response.dart';

class TranslatorPaymentApiCalls {
  /// [createStripeAccount] will take in the [CreateStripeAccountRequestModel] and will
  /// return the [CreateStripeAccountResponseModel].
  static Future<CreateStripeAccountResponseModel> createStripeAccount(
      CreateStripeAccountRequestModel createStripeAccountRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.createStripeAccount,
        body: createStripeAccountRequestModelToJson(createStripeAccountRequestModel));
    CreateStripeAccountResponseModel responseModel;
    if (response != null) {
      responseModel = createStripeAccountResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [createTranslatorPaymentMethod] will take in the [CreatePaymentMethodRequestModel] and will
  /// return the [AddPaymentMethodResponseModel].
  static Future<AddPaymentMethodResponseModel> createTranslatorPaymentMethod(
      CreatePaymentMethodRequestModel createCustomerPaymentMethodRequestModel) async {
    var response = await ApiProvider.postAsync(
      ApiEndpoints.createCustomerPaymentMethod,
      body: createCustomerPaymentMethodRequestModelToJson(createCustomerPaymentMethodRequestModel),
    );
    AddPaymentMethodResponseModel responseModel;
    if (response != null) {
      responseModel = addPaymentMethodResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getPlaidToken] will return the [PlaidTokenGenerateModel].
  static Future<PlaidTokenGenerateModel> getPlaidToken() async {
    var response = await ApiProvider.getAsync(ApiEndpoints.generatePlaidToken);
    PlaidTokenGenerateModel responseModel;
    if (response != null) {
      responseModel = plaidTokenGenerateModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getBankSource] will take in the [BankAccountSourceRequest] and will
  /// return the [BankAccountSourceResponse].
  static Future<BankAccountSourceResponse> getBankSource(
      BankAccountSourceRequest bankAccountSourceRequest) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.getBankAccountSource,
        body: bankAccountSourceRequestToJson(bankAccountSourceRequest));
    BankAccountSourceResponse responseModel;
    if (response != null) {
      responseModel = bankAccountSourceResponseFromJson(response.body.toString());
    }

    return responseModel;
  }
}
