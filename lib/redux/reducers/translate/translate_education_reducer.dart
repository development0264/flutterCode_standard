import 'package:khontext/redux/actions/translate/translatoreducation/translator_education_actions.dart';
import 'package:khontext/redux/states/translate/translate_education_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateEducationState> translateEducationReducer = combineReducers([
  // Education events
  TypedReducer<TranslateEducationState, TranslateEducationFetchAction>(educationFetch),
  TypedReducer<TranslateEducationState, TranslateEducationErrorAction>(educationError),
  TypedReducer<TranslateEducationState, TranslateEducationSuccessAction>(educationSuccess),

  // Add Education
  TypedReducer<TranslateEducationState, AddUpdateEducationAction>(addEducationFetch),
  TypedReducer<TranslateEducationState, AddEducationSuccessAction>(addEducationSuccess),
  TypedReducer<TranslateEducationState, AddEducationErrorAction>(addEducationError),
]);

TranslateEducationState educationFetch(TranslateEducationState state, TranslateEducationFetchAction action) {
  return state.copyWith(error: null, isLoading: true);
}

TranslateEducationState educationError(TranslateEducationState state, TranslateEducationErrorAction action) {
  return state.copyWith(error: action.error, isLoading: false);
}

TranslateEducationState educationSuccess(TranslateEducationState state, TranslateEducationSuccessAction action) {
  return state.copyWith(error: null, translateEducationList: action.translateEducationModel, isLoading: false);
}

TranslateEducationState addEducationFetch(TranslateEducationState state, AddUpdateEducationAction action) {
  return state.copyWith(error: null, translateEducationList: state.translateEducationList, isLoading: true);
}

TranslateEducationState addEducationSuccess(TranslateEducationState state, AddEducationSuccessAction action) {
  return state.copyWith(error: null, isLoading: false);
}

TranslateEducationState addEducationError(TranslateEducationState state, AddEducationErrorAction action) {
  return state.copyWith(error: action.error, translateEducationList: state.translateEducationList, isLoading: false);
}
