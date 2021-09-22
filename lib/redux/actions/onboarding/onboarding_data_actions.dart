import 'package:flutter/material.dart';
import 'package:khontext/src/models/onboarding/onboarding_data_response_model.dart';

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [OnBoardingDataActions] which takes in the queries and gives out the response as
/// either [OnBoardingDataSuccessAction] or [OnBoardingDataErrorAction].
class OnBoardingDataActions {
  final BuildContext context;
  final String nextRoute;

  OnBoardingDataActions({this.context, this.nextRoute});
}

class OnBoardingDataErrorAction {
  final String error;

  OnBoardingDataErrorAction({this.error});
}

class OnBoardingDataSuccessAction {
  final OnBoardingDataResponseModel onBoardingDataResponseModel;

  OnBoardingDataSuccessAction({this.onBoardingDataResponseModel});
}

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [OnBoardingClearActions] which takes in the queries and gives out the response as
/// either [OnBoardingClearSuccessAction] or [OnBoardingClearErrorAction].
class OnBoardingClearActions {
  OnBoardingClearActions();
}

class OnBoardingClearErrorAction {
  final String error;

  OnBoardingClearErrorAction({this.error});
}

class OnBoardingClearSuccessAction {
  OnBoardingClearSuccessAction();
}
