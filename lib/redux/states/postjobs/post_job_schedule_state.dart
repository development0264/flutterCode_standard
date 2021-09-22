import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class PostJobScheduleState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final JobScheduleResponseModel jobScheduleResponseModel;

  PostJobScheduleState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.jobScheduleResponseModel,
  });

  factory PostJobScheduleState.initial() {
    return PostJobScheduleState(
      isLoading: false,
      error: '',
      currentAction: null,
      jobScheduleResponseModel: null,
    );
  }

  PostJobScheduleState copyWith({
    bool isLoading,
    String error,
    dynamic currentAction,
    JobScheduleResponseModel jobScheduleResponseModel,
  }) {
    return PostJobScheduleState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentAction: currentAction ?? this.currentAction,
      jobScheduleResponseModel: jobScheduleResponseModel ?? this.jobScheduleResponseModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostJobScheduleState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          currentAction == other.currentAction &&
          jobScheduleResponseModel == other.jobScheduleResponseModel &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ currentAction.hashCode ^ jobScheduleResponseModel.hashCode;
}
