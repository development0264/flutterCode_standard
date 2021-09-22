import 'package:khontext/src/models/onboarding/onboarding_data_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/job_services_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/employment_type_response.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/languages_essentials_model.dart';
import 'package:meta/meta.dart';

//ignore: must_be_immutable
class OnBoardingState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final JobServicesResponseModel jobServicesResponseModel;
  OnBoardingDataResponseModel onBoardingDataResponseModel;
  final LanguageEssentialsModel languageEssentialsModel;
  EmploymentTypeResponseModel employmentTypeResponseModel;

  OnBoardingState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.jobServicesResponseModel,
    @required this.onBoardingDataResponseModel,
    @required this.languageEssentialsModel,
    @required this.employmentTypeResponseModel,
  });

  factory OnBoardingState.initial() {
    return OnBoardingState(
      isLoading: false,
      currentAction: null,
      jobServicesResponseModel: JobServicesResponseModel.initial(),
      onBoardingDataResponseModel: OnBoardingDataResponseModel.initial(),
      languageEssentialsModel: LanguageEssentialsModel.initial(),
      employmentTypeResponseModel: EmploymentTypeResponseModel.initial(),
      error: '',
    );
  }

  OnBoardingState copyWith({
    bool isLoading,
    String error,
    dynamic currentAction,
    JobServicesResponseModel jobServicesResponseModel,
    OnBoardingDataResponseModel onBoardingDataResponseModel,
    LanguageEssentialsModel languageEssentialsModel,
    EmploymentTypeResponseModel employmentTypeResponseModel,
  }) {
    return OnBoardingState(
      isLoading: isLoading ?? this.isLoading,
      currentAction: currentAction ?? this.currentAction,
      jobServicesResponseModel: jobServicesResponseModel ?? this.jobServicesResponseModel,
      onBoardingDataResponseModel: onBoardingDataResponseModel ?? this.onBoardingDataResponseModel,
      languageEssentialsModel: languageEssentialsModel ?? this.languageEssentialsModel,
      employmentTypeResponseModel: employmentTypeResponseModel ?? this.employmentTypeResponseModel,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnBoardingState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          currentAction == other.currentAction &&
          jobServicesResponseModel == other.jobServicesResponseModel &&
          onBoardingDataResponseModel == other.onBoardingDataResponseModel &&
          languageEssentialsModel == other.languageEssentialsModel &&
          employmentTypeResponseModel == other.employmentTypeResponseModel &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      currentAction.hashCode ^
      jobServicesResponseModel.hashCode ^
      onBoardingDataResponseModel.hashCode ^
      languageEssentialsModel.hashCode ^
      employmentTypeResponseModel.hashCode ^
      error.hashCode;
}
