import 'package:khontext/redux/actions/translate/change_translate_page_actions.dart';
import 'package:khontext/redux/actions/translate/fetch_translate_drawer_actions.dart';
import 'package:khontext/redux/states/translate/translate_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateState> translateReducer = combineReducers([
  // Drawer events
  TypedReducer<TranslateState, TranslateDrawerDataErrorAction>(drawerDataError),
  TypedReducer<TranslateState, TranslateDrawerDataSuccessAction>(drawerDataSuccess),

  // Page position events
  TypedReducer<TranslateState, ChangeTranslatePageErrorAction>(changePageError),
  TypedReducer<TranslateState, ChangeTranslatePageSuccessAction>(changePageSuccess),
]);

TranslateState drawerDataError(TranslateState state, TranslateDrawerDataErrorAction action) {
  return state.copyWith(error: action.error);
}

TranslateState drawerDataSuccess(TranslateState state, TranslateDrawerDataSuccessAction action) {
  return state.copyWith(error: null, translateDrawerList: action.translateDrawerList);
}

TranslateState changePageError(TranslateState state, ChangeTranslatePageErrorAction action) {
  return state.copyWith(error: action.error);
}

TranslateState changePageSuccess(TranslateState state, ChangeTranslatePageSuccessAction action) {
  return state.copyWith(error: null, currentPage: action.newPage);
}
