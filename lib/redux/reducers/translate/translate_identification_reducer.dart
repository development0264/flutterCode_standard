import 'package:khontext/redux/actions/translate/translatoridentification/translator_identification_actions.dart';
import 'package:khontext/redux/states/translate/translate_identification_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateIdentificationState> translateIdentificationReducer = combineReducers([
  // Identification List
  TypedReducer<TranslateIdentificationState, TranslateIdentificationFetchAction>(
      identificationFetch),
  TypedReducer<TranslateIdentificationState, TranslateIdentificationErrorAction>(
      identificationError),
  TypedReducer<TranslateIdentificationState, TranslateIdentificationSuccessAction>(
      identificationSuccess),

  // Add Identification
  TypedReducer<TranslateIdentificationState, AddTranslateIdentificationAction>(addIdentification),
  TypedReducer<TranslateIdentificationState, AddTranslateIdentificationErrorAction>(
      addIdentificationError),
  TypedReducer<TranslateIdentificationState, AddTranslateIdentificationSuccessAction>(
      addIdentificationSuccess),
]);

/// Fetch identification
TranslateIdentificationState identificationFetch(
    TranslateIdentificationState state, TranslateIdentificationFetchAction action) {
  return state.copyWith(
    error: null,
    addIdentificationResponseModel: state.addIdentificationResponseModel,
    isLoading: true,
    currentAction: TranslateIdentificationFetchAction,
  );
}

TranslateIdentificationState identificationError(
    TranslateIdentificationState state, TranslateIdentificationErrorAction action) {
  return state.copyWith(
      error: action.error, isLoading: false, currentAction: TranslateIdentificationErrorAction);
}

TranslateIdentificationState identificationSuccess(
    TranslateIdentificationState state, TranslateIdentificationSuccessAction action) {
  return state.copyWith(
    error: null,
    addIdentificationResponseModel: action.addIdentificationResponseModel,
    isLoading: false,
    currentAction: TranslateIdentificationSuccessAction,
  );
}

/// Add identification
TranslateIdentificationState addIdentification(
    TranslateIdentificationState state, AddTranslateIdentificationAction action) {
  return state.copyWith(
    error: null,
    addIdentificationResponseModel: state.addIdentificationResponseModel,
    isLoading: true,
    currentAction: AddTranslateIdentificationAction,
  );
}

TranslateIdentificationState addIdentificationError(
    TranslateIdentificationState state, AddTranslateIdentificationErrorAction action) {
  return state.copyWith(
    error: action.error,
    isLoading: false,
    addIdentificationResponseModel: state.addIdentificationResponseModel,
    currentAction: AddTranslateIdentificationErrorAction,
  );
}

TranslateIdentificationState addIdentificationSuccess(
    TranslateIdentificationState state, AddTranslateIdentificationSuccessAction action) {
  return state.copyWith(
    error: null,
    addIdentificationResponseModel: action.addIdentificationResponseModel,
    isLoading: false,
    currentAction: AddTranslateIdentificationSuccessAction,
  );
}
