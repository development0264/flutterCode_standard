import 'package:flutter/material.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/models/signup/verify_phone_response_model.dart';
import 'package:khontext/src/screens/signup/create_account_page.dart';

/// Group of functions which gives the actions for the [CreateAccountPage].
/// This group contains [VerifyPhoneAction] which takes in the queries and gives out the response as
/// either [VerifyPhoneSuccessAction] or [VerifyPhoneErrorAction].
class VerifyPhoneAction {
  final BuildContext context;
  final VerifyPhoneModel verifyPhoneModel;

  VerifyPhoneAction({this.verifyPhoneModel, this.context});
}

class VerifyPhoneErrorAction {
  final String error;

  VerifyPhoneErrorAction({this.error});
}

class VerifyPhoneSuccessAction {
  final VerifyPhoneModel verifyPhoneModel;
  final VerifyPhoneResponseModel verifyPhoneResponseModel;

  VerifyPhoneSuccessAction({this.verifyPhoneModel, this.verifyPhoneResponseModel});
}
