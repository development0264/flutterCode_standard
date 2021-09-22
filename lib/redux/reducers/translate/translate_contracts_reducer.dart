import 'package:khontext/redux/actions/translate/translatorcontracts/fetch_translator_contracts.dart';
import 'package:khontext/redux/states/translate/translate_contracts_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateContractsState> translateContractsReducer = combineReducers([
  // Contracts events
  TypedReducer<TranslateContractsState, TranslateContractsFetchAction>(contractsFetch),
  TypedReducer<TranslateContractsState, TranslateContractsErrorAction>(contractsError),
  TypedReducer<TranslateContractsState, TranslateContractsSuccessAction>(contractsSuccess),
]);

TranslateContractsState contractsFetch(TranslateContractsState state, TranslateContractsFetchAction action) {
  return state.copyWith(error: null, translateContractsList: state.translateContractsList, isLoading: true);
}

TranslateContractsState contractsError(TranslateContractsState state, TranslateContractsErrorAction action) {
  return state.copyWith(error: action.error, isLoading: false, translateContractsList: state.translateContractsList);
}

TranslateContractsState contractsSuccess(TranslateContractsState state, TranslateContractsSuccessAction action) {
  return state.copyWith(error: null, translateContractsList: action.translateContractsList, isLoading: false);
}
