import 'package:khontext/redux/actions/clientprofile/client_address_action.dart';
import 'package:khontext/redux/states/clientprofile/client_address_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions.
Reducer<ClientAddressState> clientAddressReducer = combineReducers([
  /// Client Address
  TypedReducer<ClientAddressState, ClientAddressFetchAction>(clientAddressFetch),
  TypedReducer<ClientAddressState, ClientAddressFetchErrorAction>(clientAddressFetchError),
  TypedReducer<ClientAddressState, ClientAddressFetchSuccessAction>(clientAddressFetchSuccess),

  /// Client Add Address
  TypedReducer<ClientAddressState, ClientAddAddressAction>(clientAddAddress),
  TypedReducer<ClientAddressState, ClientAddAddressErrorAction>(clientAddAddressError),
  TypedReducer<ClientAddressState, ClientAddAddressSuccessAction>(clientAddAddressSuccess),

  /// Client Update Address
  TypedReducer<ClientAddressState, ClientUpdateAddressAction>(clientUpdateAddress),
  TypedReducer<ClientAddressState, ClientUpdateAddressErrorAction>(clientUpdateAddressError),
  TypedReducer<ClientAddressState, ClientUpdateAddressSuccessAction>(clientUpdateAddressSuccess),
]);

/// Client Address
ClientAddressState clientAddressFetch(ClientAddressState state, ClientAddressFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientAddressFetchAction);
}

ClientAddressState clientAddressFetchError(ClientAddressState state, ClientAddressFetchErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientAddressFetchErrorAction);
}

ClientAddressState clientAddressFetchSuccess(ClientAddressState state, ClientAddressFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientAddressFetchSuccessAction,
    clientAddressResponseModel: action.userAddressResponseModel,
    error: "",
  );
}

/// Client Add Address
ClientAddressState clientAddAddress(ClientAddressState state, ClientAddAddressAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientAddAddressAction);
}

ClientAddressState clientAddAddressError(ClientAddressState state, ClientAddAddressErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientAddAddressErrorAction);
}

ClientAddressState clientAddAddressSuccess(ClientAddressState state, ClientAddAddressSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientAddAddressSuccessAction,
    clientAddressResponseModel: action.userAddressResponseModel,
  );
}

/// Client Update Address
ClientAddressState clientUpdateAddress(ClientAddressState state, ClientUpdateAddressAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientUpdateAddressAction);
}

ClientAddressState clientUpdateAddressError(ClientAddressState state, ClientUpdateAddressErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientUpdateAddressErrorAction);
}

ClientAddressState clientUpdateAddressSuccess(ClientAddressState state, ClientUpdateAddressSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientUpdateAddressSuccessAction,
    clientAddressResponseModel: action.userAddressResponseModel,
  );
}
