import 'package:khontext/src/models/postjobs/joblanguages/job_languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class PostJobLanguageState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final JobLanguagesResponseModel jobLanguagesResponseModel;
  final LanguagesResponseModel languagesResponseModel;
  final SpecializationsResponseModel specializationsResponseModel;

  PostJobLanguageState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.jobLanguagesResponseModel,
    @required this.languagesResponseModel,
    @required this.specializationsResponseModel,
  });

  factory PostJobLanguageState.initial() {
    return PostJobLanguageState(
      isLoading: false,
      error: '',
      currentAction: null,
      jobLanguagesResponseModel: JobLanguagesResponseModel.initial(),
      languagesResponseModel: LanguagesResponseModel.initial(),
      specializationsResponseModel: SpecializationsResponseModel.initial(),
    );
  }

  PostJobLanguageState copyWith({
    bool isLoading,
    String error,
    dynamic currentAction,
    JobLanguagesResponseModel jobLanguagesResponseModel,
    LanguagesResponseModel languagesResponseModel,
    SpecializationsResponseModel specializationsResponseModel,
  }) {
    return PostJobLanguageState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentAction: currentAction ?? this.currentAction,
      jobLanguagesResponseModel: jobLanguagesResponseModel ?? this.jobLanguagesResponseModel,
      languagesResponseModel: languagesResponseModel ?? this.languagesResponseModel,
      specializationsResponseModel: specializationsResponseModel ?? this.specializationsResponseModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostJobLanguageState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          jobLanguagesResponseModel == other.jobLanguagesResponseModel &&
          languagesResponseModel == other.languagesResponseModel &&
          specializationsResponseModel == other.specializationsResponseModel &&
          currentAction == other.currentAction &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      error.hashCode ^
      jobLanguagesResponseModel.hashCode ^
      languagesResponseModel.hashCode ^
      specializationsResponseModel.hashCode ^
      currentAction.hashCode;
}
