import 'package:khontext/redux/actions/translatorpayments/translator_payments_actions.dart';
import 'package:khontext/redux/states/translatorpayments/translator_payments_state.dart';
import 'package:khontext/src/models/translatorpayments/create_stripe_account_response.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions.
Reducer<TranslatorPaymentState> translatorPaymentsReducer = combineReducers([
  /// Create Stripe account
  TypedReducer<TranslatorPaymentState, CreateStripeAccountAction>(createStripeAccount),
  TypedReducer<TranslatorPaymentState, CreateStripeAccountErrorAction>(createStripeAccountError),
  TypedReducer<TranslatorPaymentState, CreateStripeAccountSuccessAction>(createStripeAccountSuccess),

  /// Clear translator payment state
  TypedReducer<TranslatorPaymentState, ClearTranslatorPaymentStateAction>(clearTranslatorPaymentState),
  TypedReducer<TranslatorPaymentState, ClearTranslatorPaymentStateErrorAction>(clearTranslatorPaymentStateError),
  TypedReducer<TranslatorPaymentState, ClearTranslatorPaymentStateSuccessAction>(clearTranslatorPaymentStateSuccess),
]);

/// Create Stripe account
TranslatorPaymentState createStripeAccount(TranslatorPaymentState state, CreateStripeAccountAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: CreateStripeAccountAction);
}

TranslatorPaymentState createStripeAccountError(TranslatorPaymentState state, CreateStripeAccountErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: CreateStripeAccountErrorAction);
}

TranslatorPaymentState createStripeAccountSuccess(
    TranslatorPaymentState state, CreateStripeAccountSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: CreateStripeAccountSuccessAction,
    createStripeAccountResponseModel: action.createStripeAccountResponseModel,
  );
}

/// Clear translator payment state
TranslatorPaymentState clearTranslatorPaymentState(
    TranslatorPaymentState state, ClearTranslatorPaymentStateAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClearTranslatorPaymentStateAction);
}

TranslatorPaymentState clearTranslatorPaymentStateError(
    TranslatorPaymentState state, ClearTranslatorPaymentStateErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClearTranslatorPaymentStateErrorAction);
}

TranslatorPaymentState clearTranslatorPaymentStateSuccess(
    TranslatorPaymentState state, ClearTranslatorPaymentStateSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClearTranslatorPaymentStateSuccessAction,
    createStripeAccountResponseModel: CreateStripeAccountResponseModel.initial(),
  );
}
