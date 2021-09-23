import 'package:flutter/material.dart';
import 'package:khontext/src/models/signin/sign_in_request_model.dart';
import 'package:khontext/src/models/complete_profile_response_model.dart';

/// Group of functions which gives the actions for the [SignInPage].
/// This group contains [SignInAction] which takes in the queries and gives out the response as
/// either [SignInSuccessAction] or [SignInErrorAction].
class SignInAction {
  final BuildContext context;
  final SignInRequestModel signInRequestModel;

  SignInAction({this.context, this.signInRequestModel});
}

class SignInErrorAction {
  final String error;

  SignInErrorAction({this.error});
}

class SignInSuccessAction {
  final CompleteProfileResponseModel completeProfileResponseModel;

  SignInSuccessAction({this.completeProfileResponseModel});
}
