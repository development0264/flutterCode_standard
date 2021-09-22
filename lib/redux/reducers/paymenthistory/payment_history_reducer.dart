import 'package:khontext/redux/actions/paymenthistory/payment_history_actions.dart';
import 'package:khontext/redux/states/paymenthistory/payment_history_state.dart';
import 'package:khontext/src/models/payment_history_model.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like [paymentHistoryFetch],
/// [paymentHistorySuccess] and [paymentHistoryError].
Reducer<PaymentHistoryState> paymentHistoryReducer = combineReducers([
  TypedReducer<PaymentHistoryState, PaymentHistoryFetchAction>(paymentHistoryFetch),
  TypedReducer<PaymentHistoryState, PaymentHistorySuccessAction>(paymentHistorySuccess),
  TypedReducer<PaymentHistoryState, PaymentHistoryErrorAction>(paymentHistoryError),
]);

PaymentHistoryState paymentHistoryFetch(PaymentHistoryState state, PaymentHistoryFetchAction action) {
  return state.copyWith(
    isLoading: true,
    error: null,
    currentLastId: action.startingAfter,
    limit: action.limit,
  );
}

PaymentHistoryState paymentHistorySuccess(PaymentHistoryState state, PaymentHistorySuccessAction action) {
  if (action.paymentHistoryModel != null) {
    state.paymentHistoryModel.hasMore = action.paymentHistoryModel.hasMore;
    state.paymentHistoryModel.url = action.paymentHistoryModel.url;
    state.paymentHistoryModel.data.addAll(action.paymentHistoryModel.data);
    state.paymentHistoryModel.error = action.paymentHistoryModel.error;
  }
  return state.copyWith(
    isLoading: false,
    data: state.paymentHistoryModel,
    error: null,
  );
}

PaymentHistoryState paymentHistoryError(PaymentHistoryState state, PaymentHistoryErrorAction action) {
  return state.copyWith(
    isLoading: false,
    data: PaymentHistoryModel.initial(),
    error: action.error,
  );
}
