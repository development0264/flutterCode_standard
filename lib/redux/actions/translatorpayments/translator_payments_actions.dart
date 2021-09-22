import 'package:flutter/material.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/translatorpayments/create_stripe_account_request.dart';
import 'package:khontext/src/models/translatorpayments/create_stripe_account_response.dart';

/// Group of functions which gives the actions for the [Translator-Payments].
/// This group contains [CreateStripeAccountAction] which takes in the queries and gives out the response as
/// either [CreateStripeAccountSuccessAction] or [CreateStripeAccountErrorAction].
class CreateStripeAccountAction {
  final ClientAddressData addressData;
  final CreateStripeAccountRequestModel createStripeAccountRequestModel;

  CreateStripeAccountAction({@required this.addressData, @required this.createStripeAccountRequestModel});
}

class CreateStripeAccountErrorAction {
  final String error;

  CreateStripeAccountErrorAction({@required this.error});
}

class CreateStripeAccountSuccessAction {
  final CreateStripeAccountResponseModel createStripeAccountResponseModel;

  CreateStripeAccountSuccessAction({@required this.createStripeAccountResponseModel});
}

/// Group of functions which gives the actions for the [Translator-Payments].
/// This group contains [ClearTranslatorPaymentStateAction] which takes in the queries and gives out the response as
/// either [ClearTranslatorPaymentStateSuccessAction] or [ClearTranslatorPaymentStateErrorAction].
class ClearTranslatorPaymentStateAction {
  ClearTranslatorPaymentStateAction();
}

class ClearTranslatorPaymentStateErrorAction {
  final String error;

  ClearTranslatorPaymentStateErrorAction({@required this.error});
}

class ClearTranslatorPaymentStateSuccessAction {
  ClearTranslatorPaymentStateSuccessAction();
}