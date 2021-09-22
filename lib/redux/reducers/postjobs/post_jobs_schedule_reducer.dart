import 'package:khontext/redux/actions/postjobs/post_job_schedule_actions.dart';
import 'package:khontext/redux/states/postjobs/post_job_schedule_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<PostJobScheduleState> postJobScheduleReducer = combineReducers([
  /// Post job Schedule
  TypedReducer<PostJobScheduleState, PostJobScheduleFetchAction>(postJobScheduleFetch),
  TypedReducer<PostJobScheduleState, PostJobScheduleFetchErrorAction>(postJobScheduleFetchError),
  TypedReducer<PostJobScheduleState, PostJobScheduleFetchSuccessAction>(postJobScheduleFetchSuccess),

  /// Add Update Post job Schedule
  TypedReducer<PostJobScheduleState, AddJobScheduleAction>(addPostJobSchedule),
  TypedReducer<PostJobScheduleState, AddJobScheduleErrorAction>(addPostJobScheduleError),
  TypedReducer<PostJobScheduleState, AddJobScheduleSuccessAction>(addPostJobScheduleSuccess),
]);

/// Post job schedule
PostJobScheduleState postJobScheduleFetch(PostJobScheduleState state, PostJobScheduleFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: PostJobScheduleFetchAction);
}

PostJobScheduleState postJobScheduleFetchError(PostJobScheduleState state, PostJobScheduleFetchErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: PostJobScheduleFetchErrorAction);
}

PostJobScheduleState postJobScheduleFetchSuccess(PostJobScheduleState state, PostJobScheduleFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: PostJobScheduleFetchSuccessAction,
    jobScheduleResponseModel: action.jobScheduleResponseModel,
  );
}

/// Add Post job schedule
PostJobScheduleState addPostJobSchedule(PostJobScheduleState state, AddJobScheduleAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: AddJobScheduleAction);
}

PostJobScheduleState addPostJobScheduleError(PostJobScheduleState state, AddJobScheduleErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: AddJobScheduleErrorAction);
}

PostJobScheduleState addPostJobScheduleSuccess(PostJobScheduleState state, AddJobScheduleSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: AddJobScheduleSuccessAction,
    jobScheduleResponseModel: action.jobScheduleResponseModel,
  );
}
