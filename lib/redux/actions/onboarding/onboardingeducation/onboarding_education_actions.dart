import 'package:flutter/material.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/onboarding_education_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/onboarding_education_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [OnBoardingAddEduActions] which takes in the queries and gives out the response as
/// either [OnBoardingAddEduSuccessAction] or [OnBoardingAddEduErrorAction].
class OnBoardingAddEduActions {
  final BuildContext context;
  final List<OnBoardingEducationRequestModel> addEducationRequestModel;
  final List<FileOrDocumentInformationRequest> documentsList;

  OnBoardingAddEduActions({this.context, this.addEducationRequestModel, this.documentsList});
}

class OnBoardingAddEduErrorAction {
  final String error;

  OnBoardingAddEduErrorAction({this.error});
}

class OnBoardingAddEduSuccessAction {
  final OnBoardingEducationResponseModel addEducationResponseModel;

  OnBoardingAddEduSuccessAction({this.addEducationResponseModel});
}

/// Group of functions which gives the actions for the [OnBoarding].
/// This group contains [OnBoardingDeleteEduActions] which takes in the queries and gives out the response as
/// either [OnBoardingDeleteEduSuccessAction] or [OnBoardingDeleteEduErrorAction].
class OnBoardingDeleteEduActions {
  final BuildContext context;
  final String educationId;

  OnBoardingDeleteEduActions({this.context, this.educationId});
}

class OnBoardingDeleteEduErrorAction {
  final String error;

  OnBoardingDeleteEduErrorAction({this.error});
}

class OnBoardingDeleteEduSuccessAction {
  final CommonResponseModel commonResponseModel;

  OnBoardingDeleteEduSuccessAction({this.commonResponseModel});
}
