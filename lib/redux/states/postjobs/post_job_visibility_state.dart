import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_states_model.dart';
import 'package:meta/meta.dart';

@immutable
class PostJobVisibilityState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final JobStatesResponseModel jobStatesResponseModel;
  final SpecializationsResponseModel specializationsResponseModel;
  final ProficiencyResponseModel jobProficiencyResponseModel;
  final JobVisibilityResponseModel jobVisibilityResponseModel;

  PostJobVisibilityState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.jobProficiencyResponseModel,
    @required this.specializationsResponseModel,
    @required this.jobStatesResponseModel,
    @required this.jobVisibilityResponseModel,
  });

  factory PostJobVisibilityState.initial() {
    return PostJobVisibilityState(
      isLoading: false,
      error: '',
      currentAction: null,
      jobStatesResponseModel: JobStatesResponseModel.initial(),
      jobProficiencyResponseModel: ProficiencyResponseModel.initial(),
      specializationsResponseModel: SpecializationsResponseModel.initial(),
      jobVisibilityResponseModel: JobVisibilityResponseModel.initial(),
    );
  }

  PostJobVisibilityState copyWith({
    bool isLoading,
    String error,
    dynamic currentAction,
    JobStatesResponseModel jobStatesResponseModel,
    SpecializationsResponseModel specializationsResponseModel,
    ProficiencyResponseModel jobProficiencyResponseModel,
    JobVisibilityResponseModel jobVisibilityResponseModel,
  }) {
    return PostJobVisibilityState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentAction: currentAction ?? this.currentAction,
      jobStatesResponseModel: jobStatesResponseModel ?? this.jobStatesResponseModel,
      jobProficiencyResponseModel: jobProficiencyResponseModel ?? this.jobProficiencyResponseModel,
      specializationsResponseModel: specializationsResponseModel ?? this.specializationsResponseModel,
      jobVisibilityResponseModel: jobVisibilityResponseModel ?? this.jobVisibilityResponseModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostJobVisibilityState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          currentAction == other.currentAction &&
          jobStatesResponseModel == other.jobStatesResponseModel &&
          specializationsResponseModel == other.specializationsResponseModel &&
          jobProficiencyResponseModel == other.jobProficiencyResponseModel &&
          jobVisibilityResponseModel == other.jobVisibilityResponseModel &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      error.hashCode ^
      jobStatesResponseModel.hashCode ^
      specializationsResponseModel.hashCode ^
      jobProficiencyResponseModel.hashCode ^
      jobVisibilityResponseModel.hashCode ^
      currentAction.hashCode;
}
