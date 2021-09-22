import 'package:khontext/redux/actions/postjobs/post_job_language_actions.dart';
import 'package:khontext/redux/states/postjobs/post_job_languages_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<PostJobLanguageState> postJobsLanguageReducer = combineReducers([
  // Fetch job language essentials
  TypedReducer<PostJobLanguageState, LanguagesEssentialsFetchAction>(jobLanguageEssentialsFetch),
  TypedReducer<PostJobLanguageState, LanguagesEssentialsFetchErrorAction>(jobLanguageEssentialsFetchError),
  TypedReducer<PostJobLanguageState, LanguagesEssentialsFetchSuccessAction>(jobLanguageEssentialsFetchSuccess),

  // Fetch job language data
  TypedReducer<PostJobLanguageState, JobLanguagesFetchAction>(jobLanguageDataFetch),
  TypedReducer<PostJobLanguageState, JobLanguagesFetchErrorAction>(jobLanguageDataFetchError),
  TypedReducer<PostJobLanguageState, JobLanguagesFetchSuccessAction>(jobLanguageDataFetchSuccess),

  // add/update job language data
  TypedReducer<PostJobLanguageState, AddUpdateJobLanguagesAction>(addUpdateJobLanguage),
  TypedReducer<PostJobLanguageState, AddUpdateJobLanguagesErrorAction>(addUpdateJobLanguageError),
  TypedReducer<PostJobLanguageState, AddUpdateJobLanguagesSuccessAction>(addUpdateJobLanguageSuccess),
]);

/// Job language essentials
PostJobLanguageState jobLanguageEssentialsFetch(PostJobLanguageState state, LanguagesEssentialsFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: LanguagesEssentialsFetchAction);
}

PostJobLanguageState jobLanguageEssentialsFetchError(
    PostJobLanguageState state, LanguagesEssentialsFetchErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: LanguagesEssentialsFetchErrorAction);
}

PostJobLanguageState jobLanguageEssentialsFetchSuccess(
    PostJobLanguageState state, LanguagesEssentialsFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    languagesResponseModel: action.languagesResponseModel,
    specializationsResponseModel: action.specializationsResponseModel,
    currentAction: LanguagesEssentialsFetchSuccessAction,
  );
}

/// Job language fetch
PostJobLanguageState jobLanguageDataFetch(PostJobLanguageState state, JobLanguagesFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: JobLanguagesFetchAction);
}

PostJobLanguageState jobLanguageDataFetchError(PostJobLanguageState state, JobLanguagesFetchErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: JobLanguagesFetchErrorAction);
}

PostJobLanguageState jobLanguageDataFetchSuccess(PostJobLanguageState state, JobLanguagesFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    jobLanguagesResponseModel: action.jobLanguagesResponseModel,
    currentAction: JobLanguagesFetchSuccessAction,
  );
}

/// Add/update Job language
PostJobLanguageState addUpdateJobLanguage(PostJobLanguageState state, AddUpdateJobLanguagesAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: AddUpdateJobLanguagesAction);
}

PostJobLanguageState addUpdateJobLanguageError(PostJobLanguageState state, AddUpdateJobLanguagesErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: AddUpdateJobLanguagesErrorAction);
}

PostJobLanguageState addUpdateJobLanguageSuccess(PostJobLanguageState state, AddUpdateJobLanguagesSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    jobLanguagesResponseModel: action.jobLanguagesResponseModel,
    currentAction: AddUpdateJobLanguagesSuccessAction,
  );
}