import 'package:khontext/redux/actions/forgetpassword/forget_password_actions.dart';
import 'package:khontext/redux/states/forgetpassword/forget_password_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions.
Reducer<ForgetPasswordState> forgetPasswordReducer = combineReducers([
  /// Send forget password Link
  TypedReducer<ForgetPasswordState, ForgetPasswordLinkAction>(sendForgetPasswordLink),
  TypedReducer<ForgetPasswordState, ForgetPasswordClearAction>(clearForgetPassword),
  TypedReducer<ForgetPasswordState, ForgetPasswordLinkErrorAction>(sendForgetPasswordLinkError),
  TypedReducer<ForgetPasswordState, ForgetPasswordLinkSuccessAction>(sendForgetPasswordLinkSuccess),

  /// Reset password
  TypedReducer<ForgetPasswordState, ResetPasswordAction>(resetPassword),
  TypedReducer<ForgetPasswordState, ResetPasswordErrorAction>(resetPasswordError),
  TypedReducer<ForgetPasswordState, ResetPasswordSuccessAction>(resetPasswordSuccess),
]);

/// Send forget password Link
ForgetPasswordState sendForgetPasswordLink(
    ForgetPasswordState state, ForgetPasswordLinkAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ForgetPasswordLinkAction);
}

ForgetPasswordState clearForgetPassword(
    ForgetPasswordState state, ForgetPasswordClearAction action) {
  return state.copyWith(isLoading: false, error: null, currentAction: ForgetPasswordClearAction);
}

ForgetPasswordState sendForgetPasswordLinkError(
    ForgetPasswordState state, ForgetPasswordLinkErrorAction action) {
  return state.copyWith(
      isLoading: false, error: action.error, currentAction: ForgetPasswordLinkErrorAction);
}

ForgetPasswordState sendForgetPasswordLinkSuccess(
    ForgetPasswordState state, ForgetPasswordLinkSuccessAction action) {
  return state.copyWith(
      isLoading: false, error: "", currentAction: ForgetPasswordLinkSuccessAction);
}

/// Reset password
ForgetPasswordState resetPassword(ForgetPasswordState state, ResetPasswordAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: ResetPasswordAction);
}

ForgetPasswordState resetPasswordError(ForgetPasswordState state, ResetPasswordErrorAction action) {
  return state.copyWith(
      isLoading: false, error: action.error, currentAction: ResetPasswordErrorAction);
}

ForgetPasswordState resetPasswordSuccess(
    ForgetPasswordState state, ResetPasswordSuccessAction action) {
  return state.copyWith(isLoading: false, error: "", currentAction: ResetPasswordSuccessAction);
}
