import 'package:khontext/src/models/onboarding/onboardingexperience/employment_type_response.dart';
import 'package:khontext/src/models/translator/translatorexperience/experience_list_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class TranslateExperienceState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final ExperienceListResponseModel experienceListResponseModel;
  final EmploymentTypeResponseModel employmentTypeResponseModel;

  TranslateExperienceState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.experienceListResponseModel,
    @required this.employmentTypeResponseModel,
  });

  factory TranslateExperienceState.initial() {
    return TranslateExperienceState(
      isLoading: false,
      experienceListResponseModel: ExperienceListResponseModel.initial(),
      error: '',
      currentAction: null,
      employmentTypeResponseModel: EmploymentTypeResponseModel.initial(),
    );
  }

  TranslateExperienceState copyWith({
    bool isLoading,
    dynamic currentAction,
    ExperienceListResponseModel experienceListResponseModel,
    EmploymentTypeResponseModel employmentTypeResponseModel,
    String error,
  }) {
    return TranslateExperienceState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentAction: currentAction ?? this.currentAction,
      experienceListResponseModel: experienceListResponseModel ?? this.experienceListResponseModel,
      employmentTypeResponseModel: employmentTypeResponseModel ?? this.employmentTypeResponseModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateExperienceState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          experienceListResponseModel == other.experienceListResponseModel &&
          employmentTypeResponseModel == other.employmentTypeResponseModel &&
          currentAction == other.currentAction &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      error.hashCode ^
      experienceListResponseModel.hashCode ^
      employmentTypeResponseModel.hashCode ^
      currentAction.hashCode;
}
