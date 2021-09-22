import 'package:flutter/material.dart';
import 'package:khontext/src/models/signup/mail_request_model.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/models/signup/verify_email_response_model.dart';
import 'package:khontext/src/screens/signup/create_account_page.dart';

/// Group of functions which gives the actions for the [CreateAccountPage].
/// This group contains [SendVerifyEmailAction] which takes in the queries and gives out the response as
/// either [SendVerifyEmailSuccessAction] or [SendVerifyEmailErrorAction].
class SendVerifyEmailAction {
  final BuildContext context;
  final SendVerifyMailRequestModel sendVerifyMailRequestModel;

  SendVerifyEmailAction({this.context, this.sendVerifyMailRequestModel});
}

class SendVerifyEmailErrorAction {
  final String error;

  SendVerifyEmailErrorAction({this.error});
}

class SendVerifyEmailSuccessAction {
  final VerifyEmailResponseModel verifyEmailResponseModel;

  SendVerifyEmailSuccessAction({this.verifyEmailResponseModel});
}

/// Group of functions which gives the actions for the [CreateAccountPage].
/// This group contains [VerifyEmailAction] which takes in the queries and gives out the response as
/// either [VerifyEmailSuccessAction] or [VerifyEmailErrorAction].
class VerifyEmailAction {
  final BuildContext context;
  final VerifyEmailModel verifyEmailModel;

  VerifyEmailAction({this.context, this.verifyEmailModel});
}

class VerifyEmailErrorAction {
  final String error;

  VerifyEmailErrorAction({this.error});
}

class VerifyEmailSuccessAction {
  final VerifyEmailModel verifyEmailModel;
  final VerifyEmailResponseModel verifyEmailResponseModel;

  VerifyEmailSuccessAction({this.verifyEmailModel, this.verifyEmailResponseModel});
}
