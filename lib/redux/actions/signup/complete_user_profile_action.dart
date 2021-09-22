import 'package:flutter/material.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/screens/signup/create_account_page.dart';

/// Group of functions which gives the actions for the [CreateAccountPage].
/// This group contains [CompleteUserProfileAction] which takes in the queries and gives out the response as
/// either [CompleteUserProfileSuccessAction] or [CompleteUserProfileErrorAction].
class CompleteUserProfileAction {
  final BuildContext context;
  final CompleteUserProfileModel completeUserProfileModel;

  CompleteUserProfileAction({this.completeUserProfileModel, this.context});
}

class CompleteUserProfileErrorAction {
  final String error;

  CompleteUserProfileErrorAction({this.error});
}

class CompleteUserProfileSuccessAction {
  final CompleteUserProfileModel completeUserProfileModel;
  final CompleteProfileResponseModel completeProfileResponseModel;

  CompleteUserProfileSuccessAction(
      {this.completeUserProfileModel, this.completeProfileResponseModel});
}
