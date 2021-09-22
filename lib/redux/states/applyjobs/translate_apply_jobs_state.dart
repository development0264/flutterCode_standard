import 'package:khontext/src/models/postjobs/acceptjobs/hire_applied_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_update_apply_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/apply_jobs_list_response.dart';
import 'package:meta/meta.dart';

@immutable
class TranslateApplyJobsState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final List<ApplyJobsData> applyJobsList;
  final AddUpdateApplyJobsResponse addUpdateResponse;
  final HireAppliedData hireAppliedData;

  TranslateApplyJobsState({
    @required this.isLoading,
    @required this.error,
    @required this.applyJobsList,
    @required this.addUpdateResponse,
    @required this.currentAction,
    @required this.hireAppliedData,
  });

  factory TranslateApplyJobsState.initial() {
    return TranslateApplyJobsState(
      isLoading: false,
      applyJobsList: [],
      addUpdateResponse: AddUpdateApplyJobsResponse.initial(),
      hireAppliedData: HireAppliedData.initial(),
      currentAction: null,
      error: '',
    );
  }

  TranslateApplyJobsState copyWith({
    bool isLoading,
    List<ApplyJobsData> applyJobsList,
    dynamic currentAction,
    AddUpdateApplyJobsResponse addUpdateApplyJobResponse,
    HireAppliedData hireAppliedData,
    String error,
  }) {
    return TranslateApplyJobsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      applyJobsList: applyJobsList ?? this.applyJobsList,
      currentAction: currentAction ?? this.currentAction,
      addUpdateResponse: addUpdateApplyJobResponse ?? this.addUpdateResponse,
      hireAppliedData: hireAppliedData ?? this.hireAppliedData,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateApplyJobsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          applyJobsList == other.applyJobsList &&
          currentAction == other.currentAction &&
          addUpdateResponse == other.addUpdateResponse &&
          hireAppliedData == other.hireAppliedData &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      error.hashCode ^
      applyJobsList.hashCode ^
      addUpdateResponse.hashCode ^
      hireAppliedData.hashCode ^
      currentAction.hashCode;
}
