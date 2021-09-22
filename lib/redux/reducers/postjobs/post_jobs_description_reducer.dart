import 'package:khontext/redux/actions/postjobs/post_job_description_actions.dart';
import 'package:khontext/redux/states/postjobs/post_job_description_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<PostJobDescriptionState> postJobsDescriptionReducer = combineReducers([
  // Fetch job services
  TypedReducer<PostJobDescriptionState, JobServicesFetchAction>(jobServicesFetch),
  TypedReducer<PostJobDescriptionState, JobServicesFetchErrorAction>(jobServicesFetchError),
  TypedReducer<PostJobDescriptionState, JobServicesFetchSuccessAction>(jobServicesFetchSuccess),

  // Fetch job description
  TypedReducer<PostJobDescriptionState, JobDescriptionFetchAction>(jobDescriptionFetch),
  TypedReducer<PostJobDescriptionState, JobDescriptionFetchErrorAction>(jobDescriptionFetchError),
  TypedReducer<PostJobDescriptionState, JobDescriptionFetchSuccessAction>(jobDescriptionFetchSuccess),

  // Add/Update job description
  TypedReducer<PostJobDescriptionState, JobDescriptionAddUpdateAction>(jobDescriptionAddUpdate),
  TypedReducer<PostJobDescriptionState, JobDescriptionAddUpdateErrorAction>(jobDescriptionAddUpdateError),
  TypedReducer<PostJobDescriptionState, JobDescriptionAddUpdateSuccessAction>(jobDescriptionAddUpdateSuccess),
]);

/// Job services
PostJobDescriptionState jobServicesFetch(PostJobDescriptionState state, JobServicesFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: JobServicesFetchAction);
}

PostJobDescriptionState jobServicesFetchError(PostJobDescriptionState state, JobServicesFetchErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: JobServicesFetchErrorAction);
}

PostJobDescriptionState jobServicesFetchSuccess(PostJobDescriptionState state, JobServicesFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    jobServicesResponseModel: action.jobServicesResponseModel,
    currentAction: JobServicesFetchSuccessAction,
  );
}

/// Job Description
PostJobDescriptionState jobDescriptionFetch(PostJobDescriptionState state, JobDescriptionFetchAction action) {
  return state.copyWith(
    isLoading: true,
    error: null,
    currentAction: JobDescriptionFetchAction,
  );
}

PostJobDescriptionState jobDescriptionFetchError(PostJobDescriptionState state, JobDescriptionFetchErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: JobDescriptionFetchErrorAction,
  );
}

PostJobDescriptionState jobDescriptionFetchSuccess(
    PostJobDescriptionState state, JobDescriptionFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    postJobDescriptionResponseModel: action.jobDescriptionResponseModel,
    currentAction: JobDescriptionFetchSuccessAction,
  );
}

/// Add/update Job Description
PostJobDescriptionState jobDescriptionAddUpdate(PostJobDescriptionState state, JobDescriptionAddUpdateAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: JobDescriptionAddUpdateAction);
}

PostJobDescriptionState jobDescriptionAddUpdateError(
    PostJobDescriptionState state, JobDescriptionAddUpdateErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: JobDescriptionAddUpdateErrorAction);
}

PostJobDescriptionState jobDescriptionAddUpdateSuccess(
    PostJobDescriptionState state, JobDescriptionAddUpdateSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    postJobDescriptionResponseModel: action.jobDescriptionResponseModel,
    currentAction: JobDescriptionAddUpdateSuccessAction,
  );
}
