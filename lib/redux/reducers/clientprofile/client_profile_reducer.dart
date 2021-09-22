import 'package:khontext/redux/actions/clientprofile/client_profile_action.dart';
import 'package:khontext/redux/states/clientprofile/client_profile_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions.
Reducer<ClientProfileState> clientProfileReducer = combineReducers([
  /// Client profile
  TypedReducer<ClientProfileState, ClientProfileFetchAction>(clientProfileFetch),
  TypedReducer<ClientProfileState, ClientProfileFetchErrorAction>(clientProfileFetchError),
  TypedReducer<ClientProfileState, ClientProfileFetchSuccessAction>(clientProfileFetchSuccess),

  /// Client profile image add
  TypedReducer<ClientProfileState, ClientProfileImageAddAction>(clientProfileImageAdd),
  TypedReducer<ClientProfileState, ClientProfileImageAddErrorAction>(clientProfileImageAddError),
  TypedReducer<ClientProfileState, ClientProfileImageAddSuccessAction>(clientProfileImageAddSuccess),

  /// Client profile update
  TypedReducer<ClientProfileState, ClientProfileUpdateAction>(clientProfileUpdate),
  TypedReducer<ClientProfileState, ClientProfileUpdateErrorAction>(clientProfileUpdateError),
  TypedReducer<ClientProfileState, ClientProfileUpdateSuccessAction>(clientProfileUpdateSuccess),

  /// Client profile image update
  TypedReducer<ClientProfileState, ClientProfileImageUpdateAction>(clientProfileImageUpdate),
  TypedReducer<ClientProfileState, ClientProfileImageUpdateErrorAction>(clientProfileImageUpdateError),
  TypedReducer<ClientProfileState, ClientProfileImageUpdateSuccessAction>(clientProfileImageUpdateSuccess),
]);

/// Client profile : It contains client profile data and client profile image data.
ClientProfileState clientProfileFetch(ClientProfileState state, ClientProfileFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientProfileFetchAction);
}

ClientProfileState clientProfileFetchError(ClientProfileState state, ClientProfileFetchErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientProfileFetchErrorAction);
}

ClientProfileState clientProfileFetchSuccess(ClientProfileState state, ClientProfileFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientProfileFetchSuccessAction,
    clientProfileResponseModel: action.userProfileResponseModel,
    clientProfileImageResponseModel: action.userProfileImageResponseModel,
  );
}

/// Client profile image add
ClientProfileState clientProfileImageAdd(ClientProfileState state, ClientProfileImageAddAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientProfileImageAddAction);
}

ClientProfileState clientProfileImageAddError(ClientProfileState state, ClientProfileImageAddErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientProfileImageAddErrorAction);
}

ClientProfileState clientProfileImageAddSuccess(ClientProfileState state, ClientProfileImageAddSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientProfileImageAddSuccessAction,
    clientProfileImageResponseModel: action.userProfileImageResponseModel,
  );
}

/// Client profile update
ClientProfileState clientProfileUpdate(ClientProfileState state, ClientProfileUpdateAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientProfileUpdateAction);
}

ClientProfileState clientProfileUpdateError(ClientProfileState state, ClientProfileUpdateErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientProfileUpdateErrorAction);
}

ClientProfileState clientProfileUpdateSuccess(ClientProfileState state, ClientProfileUpdateSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientProfileUpdateSuccessAction,
    clientProfileResponseModel: action.userProfileResponseModel,
  );
}

/// Client profile image add
ClientProfileState clientProfileImageUpdate(ClientProfileState state, ClientProfileImageUpdateAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ClientProfileImageUpdateAction);
}

ClientProfileState clientProfileImageUpdateError(ClientProfileState state, ClientProfileImageUpdateErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: ClientProfileImageUpdateErrorAction);
}

ClientProfileState clientProfileImageUpdateSuccess(
    ClientProfileState state, ClientProfileImageUpdateSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    currentAction: ClientProfileImageUpdateSuccessAction,
    clientProfileImageResponseModel: action.userProfileImageResponseModel,
  );
}
