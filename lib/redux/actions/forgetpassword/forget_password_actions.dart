import 'package:flutter/material.dart';
import 'package:khontext/src/models/forgetpassword/forget_password_request_model.dart';
import 'package:khontext/src/models/forgetpassword/reset_password_request_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

/// Group of functions which gives the actions for the [ForgetPasswordPage].
/// This group contains [ForgetPasswordLinkAction] which takes in the queries and gives out the response as
/// either [ForgetPasswordLinkSuccessAction] or [ForgetPasswordLinkErrorAction].
class ForgetPasswordLinkAction {
  final BuildContext context;
  final ForgetPasswordRequestModel forgetPasswordRequestModel;

  ForgetPasswordLinkAction({@required this.context, this.forgetPasswordRequestModel});
}

class ForgetPasswordClearAction {
  ForgetPasswordClearAction();
}

class ForgetPasswordLinkErrorAction {
  final String error;

  ForgetPasswordLinkErrorAction({this.error});
}

class ForgetPasswordLinkSuccessAction {
  final CommonResponseModel commonResponseModel;

  ForgetPasswordLinkSuccessAction({this.commonResponseModel});
}

/// Group of functions which gives the actions for the [ResetPasswordPage].
/// This group contains [ResetPasswordAction] which takes in the queries and gives out the response as
/// either [ResetPasswordSuccessAction] or [ResetPasswordErrorAction].
class ResetPasswordAction {
  final BuildContext context;
  final ResetPasswordRequestModel resetPasswordRequestModel;

  ResetPasswordAction({@required this.context, this.resetPasswordRequestModel});
}

class ResetPasswordErrorAction {
  final String error;

  ResetPasswordErrorAction({this.error});
}

class ResetPasswordSuccessAction {
  final CommonResponseModel commonResponseModel;

  ResetPasswordSuccessAction({this.commonResponseModel});
}
