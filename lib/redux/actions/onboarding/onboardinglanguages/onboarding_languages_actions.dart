import 'package:flutter/material.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/languages_essentials_model.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/onboarding_add_lang_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/onboarding_add_lang_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [OnBoardingLangEssentialsActions] which takes in the queries and gives out the response as
/// either [OnBoardingLangEssentialsSuccessAction] or [OnBoardingLangEssentialsErrorAction].
class OnBoardingLangEssentialsActions {
  final BuildContext context;

  OnBoardingLangEssentialsActions({this.context});
}

class OnBoardingLangEssentialsErrorAction {
  final String error;

  OnBoardingLangEssentialsErrorAction({this.error});
}

class OnBoardingLangEssentialsSuccessAction {
  final LanguageEssentialsModel languageEssentialsModel;

  OnBoardingLangEssentialsSuccessAction({this.languageEssentialsModel});
}

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [OnBoardingAddLangActions] which takes in the queries and gives out the response as
/// either [OnBoardingAddLangSuccessAction] or [OnBoardingAddLangErrorAction].
class OnBoardingAddLangActions {
  final BuildContext context;
  final List<OnBoardingAddLangRequestModel> onBoardingAddLangRequestModel;

  OnBoardingAddLangActions({this.context, this.onBoardingAddLangRequestModel});
}

class OnBoardingAddLangErrorAction {
  final String error;

  OnBoardingAddLangErrorAction({this.error});
}

class OnBoardingAddLangSuccessAction {
  final OnBoardingAddLangResponseModel onBoardingAddLangResponseModel;

  OnBoardingAddLangSuccessAction({this.onBoardingAddLangResponseModel});
}

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [OnBoardingDeleteLangActions] which takes in the queries and gives out the response as
/// either [OnBoardingDeleteLangSuccessAction] or [OnBoardingDeleteLangErrorAction].
class OnBoardingDeleteLangActions {
  final BuildContext context;
  final String languageId;

  OnBoardingDeleteLangActions({this.context, this.languageId});
}

class OnBoardingDeleteLangErrorAction {
  final String error;

  OnBoardingDeleteLangErrorAction({this.error});
}

class OnBoardingDeleteLangSuccessAction {
  final CommonResponseModel commonResponseModel;

  OnBoardingDeleteLangSuccessAction({this.commonResponseModel});
}
