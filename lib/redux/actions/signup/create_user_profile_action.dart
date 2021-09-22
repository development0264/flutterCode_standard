import 'package:flutter/material.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/models/signup/user_profile_response_model.dart';
import 'package:khontext/src/screens/signup/create_account_page.dart';

/// Group of functions which gives the actions for the [CreateAccountPage].
/// This group contains [CreateUserProfileAction] which takes in the queries and gives out the response as
/// either [CreateUserProfileSuccessAction] or [CreateUserProfileErrorAction].
class CreateUserProfileAction {
  final BuildContext context;
  final UserProfileModel userProfileModel;

  CreateUserProfileAction({this.userProfileModel, this.context});
}

class CreateUserProfileErrorAction {
  final String error;

  CreateUserProfileErrorAction({this.error});
}

class CreateUserProfileSuccessAction {
  final UserProfileModel userProfileModel;
  final UserProfileResponseModel userProfileResponseModel;

  CreateUserProfileSuccessAction({this.userProfileModel, this.userProfileResponseModel});
}
