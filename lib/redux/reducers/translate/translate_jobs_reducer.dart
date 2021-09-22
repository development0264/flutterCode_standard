import 'package:khontext/redux/actions/translate/translatorjobs/translator_jobs_actions.dart';
import 'package:khontext/redux/states/translate/translate_jobs_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateJobsState> translateJobsReducer = combineReducers([
  // Jobs events
  TypedReducer<TranslateJobsState, TranslateJobsFetchAction>(jobsFetch),
  TypedReducer<TranslateJobsState, TranslateJobsErrorAction>(jobsError),
  TypedReducer<TranslateJobsState, TranslateJobsSuccessAction>(jobsSuccess),

  // Fav jobs events
  TypedReducer<TranslateJobsState, FavoriteJobsFetchAction>(jobsFavFetch),
  TypedReducer<TranslateJobsState, FavoriteJobsErrorAction>(jobsFavError),
  TypedReducer<TranslateJobsState, FavoriteJobsSuccessAction>(jobsFavSuccess),
]);

TranslateJobsState jobsFetch(TranslateJobsState state, TranslateJobsFetchAction action) {
  return state.copyWith(error: null, translateJobsList: state.translateJobsList, isLoading: true);
}

TranslateJobsState jobsError(TranslateJobsState state, TranslateJobsErrorAction action) {
  return state.copyWith(
      error: action.error, isLoading: false, translateJobsList: state.translateJobsList);
}

TranslateJobsState jobsSuccess(TranslateJobsState state, TranslateJobsSuccessAction action) {
  return state.copyWith(
    error: null,
    translateJobsList: action.translatorJobsResponse.data.records,
    isLoading: false,
  );
}

TranslateJobsState jobsFavFetch(TranslateJobsState state, FavoriteJobsFetchAction action) {
  return state.copyWith(error: null, translateJobsList: state.translateJobsList, isLoading: true);
}

TranslateJobsState jobsFavError(TranslateJobsState state, FavoriteJobsErrorAction action) {
  return state.copyWith(
      error: action.error, isLoading: false, translateJobsList: state.translateJobsList);
}

TranslateJobsState jobsFavSuccess(TranslateJobsState state, FavoriteJobsSuccessAction action) {
  return state.copyWith(
    error: null,
    favoriteResponse: action.translatorFavJobsResponse.data.favoriteJobsResponses,
    isLoading: false,
  );
}
