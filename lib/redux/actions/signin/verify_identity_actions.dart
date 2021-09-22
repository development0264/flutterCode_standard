import 'package:flutter/material.dart';
import 'package:khontext/src/models/signin/verify_identity_request_model.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

/// Group of functions which gives the actions for the [VerifyIdentityPage].
/// This group contains [SendIdentificationCodeAction] which takes in the queries and gives out the response as
/// either [SendIdentificationCodeSuccessAction] or [SendIdentificationCodeErrorAction].
class SendIdentificationCodeAction {
  final BuildContext context;
  final String userId;

  SendIdentificationCodeAction({this.context, this.userId});
}

class SendIdentificationCodeErrorAction {
  final String error;

  SendIdentificationCodeErrorAction({this.error});
}

class SendIdentificationCodeSuccessAction {
  final CommonResponseModel commonResponseModel;

  SendIdentificationCodeSuccessAction({this.commonResponseModel});
}

/// Group of functions which gives the actions for the [VerifyIdentityPage].
/// This group contains [VerifyIdentityAction] which takes in the queries and gives out the response as
/// either [SendIdentificationCodeSuccessAction] or [SendIdentificationCodeErrorAction].
class VerifyIdentityAction {
  final BuildContext context;
  final VerifyIdentityRequestModel verifyIdentityRequestModel;

  VerifyIdentityAction({this.context, this.verifyIdentityRequestModel});
}

class VerifyIdentityErrorAction {
  final String error;

  VerifyIdentityErrorAction({this.error});
}

class VerifyIdentitySuccessAction {
  final CompleteProfileResponseModel completeProfileResponseModel;

  VerifyIdentitySuccessAction({this.completeProfileResponseModel});
}
