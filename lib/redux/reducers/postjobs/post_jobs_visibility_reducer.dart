import 'package:khontext/redux/actions/postjobs/post_job_visibility_actions.dart';
import 'package:khontext/redux/states/postjobs/post_job_visibility_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<PostJobVisibilityState> postJobVisibilityReducer = combineReducers([
  /// Post job visibility essentials
  TypedReducer<PostJobVisibilityState, JobVisibilityEssentialsAction>(postJobVisibilityEssentialsFetch),
  TypedReducer<PostJobVisibilityState, JobVisibilityEssentialsErrorAction>(postJobVisibilityEssentialsFetchError),
  TypedReducer<PostJobVisibilityState, JobVisibilityEssentialsSuccessAction>(postJobVisibilityEssentialsFetchSuccess),

  /// Post job visibility data
  TypedReducer<PostJobVisibilityState, JobVisibilityFetchAction>(postJobVisibilityFetch),
  TypedReducer<PostJobVisibilityState, JobVisibilityFetchErrorAction>(postJobVisibilityFetchError),
  TypedReducer<PostJobVisibilityState, JobVisibilityFetchSuccessAction>(postJobVisibilityFetchSuccess),

  /// Post job visibility add/update
  TypedReducer<PostJobVisibilityState, AddJobVisibilityAction>(addUpdatePostJobVisibility),
  TypedReducer<PostJobVisibilityState, AddJobVisibilityErrorAction>(addUpdatePostJobVisibilityError),
  TypedReducer<PostJobVisibilityState, AddJobVisibilitySuccessAction>(addUpdatePostJobVisibilitySuccess),
]);

/// Post job visibility essentials
PostJobVisibilityState postJobVisibilityEssentialsFetch(
    PostJobVisibilityState state, JobVisibilityEssentialsAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: JobVisibilityEssentialsAction);
}

PostJobVisibilityState postJobVisibilityEssentialsFetchError(
    PostJobVisibilityState state, JobVisibilityEssentialsErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: JobVisibilityEssentialsErrorAction);
}

PostJobVisibilityState postJobVisibilityEssentialsFetchSuccess(
    PostJobVisibilityState state, JobVisibilityEssentialsSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    jobStatesResponseModel: action.jobStatesResponseModel,
    jobProficiencyResponseModel: action.jobProficiencyResponseModel,
    specializationsResponseModel: action.specializationsResponseModel,
    currentAction: JobVisibilityEssentialsSuccessAction,
  );
}

/// Post job visibility data
PostJobVisibilityState postJobVisibilityFetch(PostJobVisibilityState state, JobVisibilityFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: JobVisibilityFetchAction);
}

PostJobVisibilityState postJobVisibilityFetchError(PostJobVisibilityState state, JobVisibilityFetchErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: JobVisibilityFetchErrorAction);
}

PostJobVisibilityState postJobVisibilityFetchSuccess(
    PostJobVisibilityState state, JobVisibilityFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    jobVisibilityResponseModel: action.jobVisibilityResponseModel,
    currentAction: JobVisibilityFetchSuccessAction,
  );
}

/// Post job visibility add/update
PostJobVisibilityState addUpdatePostJobVisibility(PostJobVisibilityState state, AddJobVisibilityAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: AddJobVisibilityAction);
}

PostJobVisibilityState addUpdatePostJobVisibilityError(
    PostJobVisibilityState state, AddJobVisibilityErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: AddJobVisibilityErrorAction);
}

PostJobVisibilityState addUpdatePostJobVisibilitySuccess(
    PostJobVisibilityState state, AddJobVisibilitySuccessAction action) {
  return state.copyWith(
    isLoading: false,
    jobVisibilityResponseModel: action.jobVisibilityResponseModel,
    currentAction: AddJobVisibilitySuccessAction,
  );
}
