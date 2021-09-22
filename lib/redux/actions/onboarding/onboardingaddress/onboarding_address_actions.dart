import 'package:flutter/material.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/job_services_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/onboarding_address_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/onboarding_address_response_model.dart';

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [GetJobServicesActions] which takes in the queries and gives out the response as
/// either [GetJobServicesSuccessAction] or [GetJobServicesErrorAction].
class GetJobServicesActions {
  final BuildContext context;

  GetJobServicesActions({this.context});
}

class GetJobServicesErrorAction {
  final String error;

  GetJobServicesErrorAction({this.error});
}

class GetJobServicesSuccessAction {
  final JobServicesResponseModel jobServicesResponseModel;

  GetJobServicesSuccessAction({this.jobServicesResponseModel});
}

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [AddOnBoardingAddressActions] which takes in the queries and gives out the response as
/// either [AddOnBoardingAddressSuccessAction] or [AddOnBoardingAddressErrorAction].
class AddOnBoardingAddressActions {
  final BuildContext context;
  final OnBoardingAddressRequestModel onBoardingAddressRequestModel;

  AddOnBoardingAddressActions({this.context, this.onBoardingAddressRequestModel});
}

class AddOnBoardingAddressErrorAction {
  final String error;

  AddOnBoardingAddressErrorAction({this.error});
}

class AddOnBoardingAddressSuccessAction {
  final OnBoardingAddressResponseModel onBoardingAddressResponseModel;

  AddOnBoardingAddressSuccessAction({this.onBoardingAddressResponseModel});
}
