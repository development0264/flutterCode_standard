import 'package:khontext/redux/actions/signin/verify_identity_actions.dart';
import 'package:khontext/redux/states/signin/verify_identity_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<VerifyIdentityState> verifyIdentityReducer = combineReducers([
  // Send verification code
  TypedReducer<VerifyIdentityState, SendIdentificationCodeAction>(sendVerificationCode),
  TypedReducer<VerifyIdentityState, SendIdentificationCodeErrorAction>(sendVerificationCodeError),
  TypedReducer<VerifyIdentityState, SendIdentificationCodeSuccessAction>(
      sendVerificationCodeSuccess),

  // Verify identity
  TypedReducer<VerifyIdentityState, VerifyIdentityAction>(verifyIdentity),
  TypedReducer<VerifyIdentityState, VerifyIdentityErrorAction>(verifyIdentityError),
  TypedReducer<VerifyIdentityState, VerifyIdentitySuccessAction>(verifyIdentitySuccess),
]);

/// Send verification code
VerifyIdentityState sendVerificationCode(
    VerifyIdentityState state, SendIdentificationCodeAction action) {
  return state.copyWith(isLoading: true, error: null);
}

VerifyIdentityState sendVerificationCodeError(
    VerifyIdentityState state, SendIdentificationCodeErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error);
}

VerifyIdentityState sendVerificationCodeSuccess(
    VerifyIdentityState state, SendIdentificationCodeSuccessAction action) {
  return state.copyWith(isLoading: false, error: null);
}

/// Verify identity
VerifyIdentityState verifyIdentity(VerifyIdentityState state, VerifyIdentityAction action) {
  return state.copyWith(isLoading: true, error: null);
}

VerifyIdentityState verifyIdentityError(
    VerifyIdentityState state, VerifyIdentityErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error);
}

VerifyIdentityState verifyIdentitySuccess(
    VerifyIdentityState state, VerifyIdentitySuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: null,
    completeProfileResponseModel: action.completeProfileResponseModel,
  );
}
