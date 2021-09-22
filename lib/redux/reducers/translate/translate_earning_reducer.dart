import 'package:khontext/redux/actions/translate/translatorearnings/fetch_billing_methods_type.dart';
import 'package:khontext/redux/actions/translate/translatorearnings/fetch_translator_earnings.dart';
import 'package:khontext/redux/actions/translate/translatorearnings/fetch_translator_earnings_history.dart';
import 'package:khontext/redux/states/translate/translate_earnings_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateEarningsState> translateEarningsReducer = combineReducers([
  // Earnings events
  TypedReducer<TranslateEarningsState, TranslateEarningsFetchAction>(earningsFetch),
  TypedReducer<TranslateEarningsState, TranslateEarningsErrorAction>(earningsError),
  TypedReducer<TranslateEarningsState, TranslateEarningsSuccessAction>(earningsSuccess),

  // Earnings billing type
  TypedReducer<TranslateEarningsState, TranslateBillingTypeFetchAction>(billingsTypeFetch),
  TypedReducer<TranslateEarningsState, TranslateBillingTypeErrorAction>(billingsTypeError),
  TypedReducer<TranslateEarningsState, TranslateBillingTypeSuccessAction>(billingsTypeSuccess),

  // Earnings history events
  TypedReducer<TranslateEarningsState, TranslateEarningsHistoryFetchAction>(earningsHistoryFetch),
  TypedReducer<TranslateEarningsState, TranslateEarningsHistoryErrorAction>(earningsHistoryError),
  TypedReducer<TranslateEarningsState, TranslateEarningsHistorySuccessAction>(earningsHistorySuccess),
]);

TranslateEarningsState earningsFetch(TranslateEarningsState state, TranslateEarningsFetchAction action) {
  return state.copyWith(error: null, translateEarningsList: state.translateEarningsList, isLoading: true);
}

TranslateEarningsState earningsError(TranslateEarningsState state, TranslateEarningsErrorAction action) {
  return state.copyWith(error: action.error, isLoading: false, translateEarningsList: state.translateEarningsList);
}

TranslateEarningsState earningsSuccess(TranslateEarningsState state, TranslateEarningsSuccessAction action) {
  return state.copyWith(error: null, translateEarningsList: action.translateEarningsList, isLoading: false);
}

TranslateEarningsState billingsTypeFetch(TranslateEarningsState state, TranslateBillingTypeFetchAction action) {
  return state.copyWith(error: null, billingMethodList: state.billingMethodList, isLoading: true);
}

TranslateEarningsState billingsTypeError(TranslateEarningsState state, TranslateBillingTypeErrorAction action) {
  return state.copyWith(error: action.error, isLoading: false, billingMethodList: state.billingMethodList);
}

TranslateEarningsState billingsTypeSuccess(TranslateEarningsState state, TranslateBillingTypeSuccessAction action) {
  return state.copyWith(error: null, billingMethodList: action.translateBillingTypeList, isLoading: false);
}


TranslateEarningsState earningsHistoryFetch(TranslateEarningsState state, TranslateEarningsHistoryFetchAction action) {
  return state.copyWith(error: null, translateEarningsHistoryList: state.translateEarningsHistoryList, isLoading: true);
}

TranslateEarningsState earningsHistoryError(TranslateEarningsState state, TranslateEarningsHistoryErrorAction action) {
  return state.copyWith(
      error: action.error, isLoading: false, translateEarningsHistoryList: state.translateEarningsHistoryList);
}

TranslateEarningsState earningsHistorySuccess(
    TranslateEarningsState state, TranslateEarningsHistorySuccessAction action) {
  return state.copyWith(
      error: null, translateEarningsHistoryList: action.translateEarningsHistoryList, isLoading: false);
}
