import 'package:flutter/material.dart';
import 'package:khontext/src/models/signup/send_phone_code_response_model.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/screens/signup/create_account_page.dart';

/// Group of functions which gives the actions for the [CreateAccountPage].
/// This group contains [SendPhoneVerificationAction] which takes in the queries and gives out the response as
/// either [SendPhoneVerificationSuccessAction] or [SendPhoneVerificationErrorAction].
class SendPhoneVerificationAction {
  final BuildContext context;
  final bool isResend;
  final SendVerificationPhoneModel sendVerificationPhoneModel;

  SendPhoneVerificationAction({
    this.sendVerificationPhoneModel,
    this.context,
    @required this.isResend,
  });
}

class SendPhoneVerificationErrorAction {
  final String error;

  SendPhoneVerificationErrorAction({this.error});
}

class SendPhoneVerificationSuccessAction {
  final SendVerificationPhoneModel sendVerificationPhoneModel;
  final PhoneCodeResponseModel phoneCodeResponseModel;

  SendPhoneVerificationSuccessAction(
      {this.sendVerificationPhoneModel, this.phoneCodeResponseModel});
}
