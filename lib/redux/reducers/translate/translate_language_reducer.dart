import 'package:khontext/redux/actions/translate/translatorlanguage/translator_language_actions.dart';
import 'package:khontext/redux/states/translate/translate_language_state.dart';
import 'package:khontext/src/models/translator/translatorlanguage/language_list_response.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateLanguageState> translateLanguageReducer = combineReducers([
  // Language list
  TypedReducer<TranslateLanguageState, TranslateLanguageFetchAction>(translateLanguageListFetch),
  TypedReducer<TranslateLanguageState, TranslateLanguageErrorAction>(translateLanguageListError),
  TypedReducer<TranslateLanguageState, TranslateLanguageSuccessAction>(
      translateLanguageListSuccess),
]);

/// Translator language list
TranslateLanguageState translateLanguageListFetch(
    TranslateLanguageState state, TranslateLanguageFetchAction action) {
  return state.copyWith(
      error: null,
      translatorLanguageListResponse: TranslatorLanguageListResponse.initial(),
      isLoading: true);
}

TranslateLanguageState translateLanguageListError(
    TranslateLanguageState state, TranslateLanguageErrorAction action) {
  return state.copyWith(
      error: action.error,
      isLoading: false,
      translatorLanguageListResponse: state.translatorLanguageListResponse);
}

TranslateLanguageState translateLanguageListSuccess(
    TranslateLanguageState state, TranslateLanguageSuccessAction action) {
  return state.copyWith(
      error: null,
      translatorLanguageListResponse: action.translatorLanguageListResponse,
      isLoading: false);
}
