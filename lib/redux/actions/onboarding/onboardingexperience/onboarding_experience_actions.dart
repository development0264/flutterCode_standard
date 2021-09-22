import 'package:flutter/material.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/employment_type_response.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/onboarding_experience_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/onboarding_experience_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

/// Group of functions which gives the actions for the [TranslatorPage].
/// This group contains [OnBoardingEmploymentTypesFetchAction] which takes in the queries and gives out the response as
/// either [OnBoardingEmploymentTypesSuccessAction] or [OnBoardingEmploymentTypesErrorAction].
class OnBoardingEmploymentTypesFetchAction {
  final BuildContext context;

  OnBoardingEmploymentTypesFetchAction({this.context});
}

class OnBoardingEmploymentTypesErrorAction {
  final String error;

  OnBoardingEmploymentTypesErrorAction({this.error});
}

class OnBoardingEmploymentTypesSuccessAction {
  EmploymentTypeResponseModel employmentTypeResponseModel;

  OnBoardingEmploymentTypesSuccessAction({this.employmentTypeResponseModel});
}

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [OnBoardingAddExpActions] which takes in the queries and gives out the response as
/// either [OnBoardingAddExpSuccessAction] or [OnBoardingAddExpErrorAction].
class OnBoardingAddExpActions {
  final BuildContext context;
  final OnBoardingExperienceRequestModel onBoardingExperienceRequestModel;
  final List<FileOrDocumentInformationRequest> documentsList;

  OnBoardingAddExpActions(
      {this.context, this.onBoardingExperienceRequestModel, this.documentsList});
}

class OnBoardingAddExpErrorAction {
  final String error;

  OnBoardingAddExpErrorAction({this.error});
}

class OnBoardingAddExpSuccessAction {
  final OnBoardingExperienceResponseModel onBoardingExperienceResponseModel;

  OnBoardingAddExpSuccessAction({this.onBoardingExperienceResponseModel});
}

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [OnBoardingDeleteExpActions] which takes in the queries and gives out the response as
/// either [OnBoardingDeleteExpSuccessAction] or [OnBoardingDeleteExpErrorAction].
class OnBoardingDeleteExpActions {
  final BuildContext context;
  final String experienceId;

  OnBoardingDeleteExpActions({this.context, this.experienceId});
}

class OnBoardingDeleteExpErrorAction {
  final String error;

  OnBoardingDeleteExpErrorAction({this.error});
}

class OnBoardingDeleteExpSuccessAction {
  final CommonResponseModel commonResponseModel;

  OnBoardingDeleteExpSuccessAction({this.commonResponseModel});
}
