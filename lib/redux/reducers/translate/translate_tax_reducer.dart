import 'package:khontext/redux/actions/translate/translatortax/translator_tax_actions.dart';
import 'package:khontext/redux/states/translate/translate_tax_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateTaxState> translateTaxReducer = combineReducers([
  // Tax Residence Fetch
  TypedReducer<TranslateTaxState, ExistingUserAddressFetchAction>(translateResidenceFetch),
  TypedReducer<TranslateTaxState, ExistingUserAddressErrorAction>(translateResidenceError),
  TypedReducer<TranslateTaxState, ExistingUserAddressSuccessAction>(translateResidenceSuccess),
]);

/// Fetch tax residence
TranslateTaxState translateResidenceFetch(
    TranslateTaxState state, ExistingUserAddressFetchAction action) {
  return state.copyWith(error: null, isLoading: true);
}

TranslateTaxState translateResidenceError(
    TranslateTaxState state, ExistingUserAddressErrorAction action) {
  return state.copyWith(error: action.error, isLoading: false);
}

TranslateTaxState translateResidenceSuccess(
    TranslateTaxState state, ExistingUserAddressSuccessAction action) {
  return state.copyWith(
      error: null, translatorTaxModel: action.userAddResponseModel, isLoading: false);
}
