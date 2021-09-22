import 'package:khontext/redux/actions/clientprofile/change_edit_status_action.dart';
import 'package:khontext/redux/states/clientprofile/client_profile_local_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions.
Reducer<ClientProfileLocalState> clientProfileLocalReducer = combineReducers([
  TypedReducer<ClientProfileLocalState, ChangeEditStatusAction>(changeEditStatus),
  TypedReducer<ClientProfileLocalState, ChangeEditStatusErrorAction>(changeEditStatusError),
  TypedReducer<ClientProfileLocalState, ChangeEditStatusSuccessAction>(changeEditStatusSuccess),
]);

ClientProfileLocalState changeEditStatus(ClientProfileLocalState state, ChangeEditStatusAction action) {
  return state.copyWith(isLoading: true, error: null);
}

ClientProfileLocalState changeEditStatusError(ClientProfileLocalState state, ChangeEditStatusErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error);
}

ClientProfileLocalState changeEditStatusSuccess(ClientProfileLocalState state, ChangeEditStatusSuccessAction action) {
  return state.copyWith(isLoading: false, editStatus: action.editStatus);
}
