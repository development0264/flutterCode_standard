import 'package:khontext/redux/actions/postjobs/accept_jobs_actions.dart';
import 'package:khontext/redux/actions/translate/translatorjobs/apply_job_actions.dart';
import 'package:khontext/redux/states/applyjobs/translate_apply_jobs_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateApplyJobsState> translateApplyJobsReducer = combineReducers([
  // Apply Jobs fetch events
  TypedReducer<TranslateApplyJobsState, ApplyJobsListFetchAction>(applyJobsFetch),
  TypedReducer<TranslateApplyJobsState, ApplyJobsListErrorAction>(applyJobsError),
  TypedReducer<TranslateApplyJobsState, ApplyJobsListSuccessAction>(applyJobsSuccess),

  // Add update Apply Jobs events
  TypedReducer<TranslateApplyJobsState, AddUpdateApplyJobsAction>(addUpdateApplyJobsFetch),
  TypedReducer<TranslateApplyJobsState, AddUpdateApplyJobsErrorAction>(addUpdateApplyJobsError),
  TypedReducer<TranslateApplyJobsState, AddUpdateApplyJobsSuccessAction>(addUpdateApplyJobsSuccess),

  // Remove Apply jobs events
  TypedReducer<TranslateApplyJobsState, DeleteApplyJobsAction>(deleteApplyJobsFavFetch),
  TypedReducer<TranslateApplyJobsState, DeleteApplyJobsErrorAction>(deleteApplyJobsFavError),
  TypedReducer<TranslateApplyJobsState, DeleteApplyJobsSuccessAction>(deleteApplyJobsFavSuccess),

  // Accept jobs fetch
  TypedReducer<TranslateApplyJobsState, JobProposalsFetchAction>(jobProposalsFetch),
  TypedReducer<TranslateApplyJobsState, JobProposalsFetchErrorAction>(jobProposalsFetchError),
  TypedReducer<TranslateApplyJobsState, JobProposalsFetchSuccessAction>(jobProposalsFetchSuccess),
]);

/// Fetch apply jobs list
TranslateApplyJobsState applyJobsFetch(
    TranslateApplyJobsState state, ApplyJobsListFetchAction action) {
  return state.copyWith(
    error: null,
    applyJobsList: state.applyJobsList,
    isLoading: true,
    currentAction: ApplyJobsListFetchAction,
  );
}

TranslateApplyJobsState applyJobsError(
    TranslateApplyJobsState state, ApplyJobsListErrorAction action) {
  return state.copyWith(
    error: action.error,
    isLoading: false,
    applyJobsList: [],
    currentAction: ApplyJobsListErrorAction,
  );
}

TranslateApplyJobsState applyJobsSuccess(
    TranslateApplyJobsState state, ApplyJobsListSuccessAction action) {
  return state.copyWith(
    error: null,
    applyJobsList: action.applyJobsListResponse.data,
    isLoading: false,
    currentAction: ApplyJobsListSuccessAction,
  );
}

/// Apply jobs add/update
TranslateApplyJobsState addUpdateApplyJobsFetch(
    TranslateApplyJobsState state, AddUpdateApplyJobsAction action) {
  return state.copyWith(
    error: null,
    addUpdateApplyJobResponse: null,
    isLoading: true,
    currentAction: AddUpdateApplyJobsAction,
  );
}

TranslateApplyJobsState addUpdateApplyJobsError(
    TranslateApplyJobsState state, AddUpdateApplyJobsErrorAction action) {
  return state.copyWith(
    error: action.error,
    isLoading: false,
    addUpdateApplyJobResponse: null,
    currentAction: AddUpdateApplyJobsErrorAction,
  );
}

TranslateApplyJobsState addUpdateApplyJobsSuccess(
    TranslateApplyJobsState state, AddUpdateApplyJobsSuccessAction action) {
  return state.copyWith(
    error: null,
    addUpdateApplyJobResponse: action.addUpdateApplyJobsResponse,
    isLoading: false,
    currentAction: AddUpdateApplyJobsSuccessAction,
  );
}

/// Apply Jobs remove
TranslateApplyJobsState deleteApplyJobsFavFetch(
    TranslateApplyJobsState state, DeleteApplyJobsAction action) {
  return state.copyWith(
    error: null,
    isLoading: true,
    currentAction: DeleteApplyJobsAction,
  );
}

TranslateApplyJobsState deleteApplyJobsFavError(
    TranslateApplyJobsState state, DeleteApplyJobsErrorAction action) {
  return state.copyWith(
    error: action.error,
    isLoading: false,
    currentAction: DeleteApplyJobsErrorAction,
  );
}

TranslateApplyJobsState deleteApplyJobsFavSuccess(
    TranslateApplyJobsState state, DeleteApplyJobsSuccessAction action) {
  return state.copyWith(
    error: null,
    isLoading: false,
    currentAction: DeleteApplyJobsSuccessAction,
  );
}

/// Accept jobs fetch
TranslateApplyJobsState jobProposalsFetch(
    TranslateApplyJobsState state, JobProposalsFetchAction action) {
  return state.copyWith(
    error: null,
    isLoading: true,
    currentAction: JobProposalsFetchAction,
  );
}

TranslateApplyJobsState jobProposalsFetchError(
    TranslateApplyJobsState state, JobProposalsFetchErrorAction action) {
  return state.copyWith(
    error: action.error,
    isLoading: false,
    currentAction: JobProposalsFetchErrorAction,
  );
}

TranslateApplyJobsState jobProposalsFetchSuccess(
    TranslateApplyJobsState state, JobProposalsFetchSuccessAction action) {
  return state.copyWith(
    error: null,
    isLoading: false,
    currentAction: JobProposalsFetchSuccessAction,
    hireAppliedData: action.hireAppliedResponseModel.data,
  );
}
