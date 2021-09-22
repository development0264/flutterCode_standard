import 'package:khontext/redux/actions/payments/payments_actions.dart';
import 'package:khontext/redux/states/payments/payments_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions.
Reducer<PaymentState> paymentsReducer = combineReducers([
  /// user address list
  TypedReducer<PaymentState, UserAddressListFetchAction>(userAddressListFetch),
  TypedReducer<PaymentState, UserAddressListErrorAction>(userAddressListFetchError),
  TypedReducer<PaymentState, UserAddressListSuccessAction>(userAddressListFetchSuccess),

  /// Payment method list fetch
  TypedReducer<PaymentState, PaymentMethodListFetchAction>(paymentMethodListFetch),
  TypedReducer<PaymentState, PaymentMethodListErrorAction>(paymentMethodListFetchError),
  TypedReducer<PaymentState, PaymentMethodListSuccessAction>(paymentMethodListFetchSuccess),

  /// Add Payment method
  TypedReducer<PaymentState, AddPaymentMethodAction>(addPaymentMethod),
  TypedReducer<PaymentState, AddPaymentMethodErrorAction>(addPaymentMethodError),
  TypedReducer<PaymentState, AddPaymentMethodSuccessAction>(addPaymentMethodSuccess),

  /// Update Payment method
  TypedReducer<PaymentState, UpdatePaymentMethodAction>(updatePaymentMethod),
  TypedReducer<PaymentState, UpdatePaymentMethodErrorAction>(updatePaymentMethodError),
  TypedReducer<PaymentState, UpdatePaymentMethodSuccessAction>(updatePaymentMethodSuccess),
]);

/// user address list
PaymentState userAddressListFetch(PaymentState state, UserAddressListFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: UserAddressListFetchAction);
}

PaymentState userAddressListFetchError(PaymentState state, UserAddressListErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: UserAddressListErrorAction);
}

PaymentState userAddressListFetchSuccess(PaymentState state, UserAddressListSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: UserAddressListSuccessAction,
    userAddressListResponseModel: action.userAddressListResponseModel,
  );
}

/// Payment method list
PaymentState paymentMethodListFetch(PaymentState state, PaymentMethodListFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: PaymentMethodListFetchAction);
}

PaymentState paymentMethodListFetchError(PaymentState state, PaymentMethodListErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: PaymentMethodListErrorAction);
}

PaymentState paymentMethodListFetchSuccess(PaymentState state, PaymentMethodListSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: PaymentMethodListSuccessAction,
    paymentMethodListModel: action.paymentMethodListModel,
  );
}

/// Add Payment method
PaymentState addPaymentMethod(PaymentState state, AddPaymentMethodAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: AddPaymentMethodAction);
}

PaymentState addPaymentMethodError(PaymentState state, AddPaymentMethodErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: AddPaymentMethodErrorAction);
}

PaymentState addPaymentMethodSuccess(PaymentState state, AddPaymentMethodSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: AddPaymentMethodSuccessAction,
    addPaymentMethodResponseModel: action.paymentMethodResponseModel,
  );
}

/// Update Payment method
PaymentState updatePaymentMethod(PaymentState state, UpdatePaymentMethodAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: UpdatePaymentMethodAction);
}

PaymentState updatePaymentMethodError(PaymentState state, UpdatePaymentMethodErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: UpdatePaymentMethodErrorAction);
}

PaymentState updatePaymentMethodSuccess(PaymentState state, UpdatePaymentMethodSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: UpdatePaymentMethodSuccessAction,
    addPaymentMethodResponseModel: action.paymentMethodResponseModel,
  );
}
