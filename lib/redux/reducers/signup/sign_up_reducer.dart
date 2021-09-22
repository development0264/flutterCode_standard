import 'package:khontext/redux/actions/signup/check_phone_number_action.dart';
import 'package:khontext/redux/actions/signup/complete_user_profile_action.dart';
import 'package:khontext/redux/actions/signup/create_user_profile_action.dart';
import 'package:khontext/redux/actions/signup/send_phone_verification_action.dart';
import 'package:khontext/redux/actions/signup/verify_email_action.dart';
import 'package:khontext/redux/actions/signup/verify_phone_action.dart';
import 'package:khontext/redux/states/signup/sign_up_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<SignUpState> signUpReducer = combineReducers([
  // Create user profile
  TypedReducer<SignUpState, CreateUserProfileAction>(createUserProfile),
  TypedReducer<SignUpState, CreateUserProfileErrorAction>(createUserProfileError),
  TypedReducer<SignUpState, CreateUserProfileSuccessAction>(createUserProfileSuccess),

  // Verify email
  TypedReducer<SignUpState, VerifyEmailAction>(verifyEmail),
  TypedReducer<SignUpState, VerifyEmailErrorAction>(verifyEmailError),
  TypedReducer<SignUpState, VerifyEmailSuccessAction>(verifyEmailSuccess),

  // Check phone number
  TypedReducer<SignUpState, CheckPhoneNumberAction>(checkPhoneNumber),
  TypedReducer<SignUpState, CheckPhoneNumberErrorAction>(checkPhoneNumberError),
  TypedReducer<SignUpState, CheckPhoneNumberSuccessAction>(checkPhoneNumberSuccess),

  // Send phone verification
  TypedReducer<SignUpState, SendPhoneVerificationAction>(sendPhoneVerification),
  TypedReducer<SignUpState, SendPhoneVerificationErrorAction>(sendPhoneVerificationError),
  TypedReducer<SignUpState, SendPhoneVerificationSuccessAction>(sendPhoneVerificationSuccess),

  // Verify phone
  TypedReducer<SignUpState, VerifyPhoneAction>(verifyPhone),
  TypedReducer<SignUpState, VerifyPhoneErrorAction>(verifyPhoneError),
  TypedReducer<SignUpState, VerifyPhoneSuccessAction>(verifyPhoneSuccess),

  // Complete profile
  TypedReducer<SignUpState, CompleteUserProfileAction>(completeProfile),
  TypedReducer<SignUpState, CompleteUserProfileErrorAction>(completeProfileError),
  TypedReducer<SignUpState, CompleteUserProfileSuccessAction>(completeProfileSuccess),
]);

/// Create user profile
SignUpState createUserProfile(SignUpState state, CreateUserProfileAction action) {
  return state.copyWith(
    isLoading: true,
    error: null,
    currentAction: CreateUserProfileAction,
  );
}

SignUpState createUserProfileError(SignUpState state, CreateUserProfileErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: CreateUserProfileErrorAction,
  );
}

SignUpState createUserProfileSuccess(SignUpState state, CreateUserProfileSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: null,
    userProfileResponseModel: action.userProfileResponseModel,
    currentAction: CreateUserProfileSuccessAction,
  );
}

/// Verify email
SignUpState verifyEmail(SignUpState state, VerifyEmailAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: VerifyEmailAction);
}

SignUpState verifyEmailError(SignUpState state, VerifyEmailErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: VerifyEmailErrorAction);
}

SignUpState verifyEmailSuccess(SignUpState state, VerifyEmailSuccessAction action) {
  return state.copyWith(
      isLoading: false,
      error: null,
      verifyEmailResponseModel: action.verifyEmailResponseModel,
      currentAction: VerifyEmailSuccessAction);
}

/// Check phone number
SignUpState checkPhoneNumber(SignUpState state, CheckPhoneNumberAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: CheckPhoneNumberAction);
}

SignUpState checkPhoneNumberError(SignUpState state, CheckPhoneNumberErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: CheckPhoneNumberErrorAction);
}

SignUpState checkPhoneNumberSuccess(SignUpState state, CheckPhoneNumberSuccessAction action) {
  return state.copyWith(
      isLoading: false,
      error: null,
      checkPhoneResponseModel: action.checkPhoneResponseModel,
      currentAction: CheckPhoneNumberSuccessAction);
}

/// Send phone verification
SignUpState sendPhoneVerification(SignUpState state, SendPhoneVerificationAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: SendPhoneVerificationAction);
}

SignUpState sendPhoneVerificationError(SignUpState state, SendPhoneVerificationErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: SendPhoneVerificationErrorAction);
}

SignUpState sendPhoneVerificationSuccess(SignUpState state, SendPhoneVerificationSuccessAction action) {
  return state.copyWith(
      isLoading: false,
      error: null,
      phoneCodeResponseModel: action.phoneCodeResponseModel,
      currentAction: SendPhoneVerificationSuccessAction);
}

/// Verify Phone
SignUpState verifyPhone(SignUpState state, VerifyPhoneAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: VerifyPhoneAction);
}

SignUpState verifyPhoneError(SignUpState state, VerifyPhoneErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: VerifyPhoneErrorAction);
}

SignUpState verifyPhoneSuccess(SignUpState state, VerifyPhoneSuccessAction action) {
  return state.copyWith(
      isLoading: false,
      error: null,
      verifyPhoneResponseModel: action.verifyPhoneResponseModel,
      currentAction: VerifyPhoneSuccessAction);
}

/// Complete profile
SignUpState completeProfile(SignUpState state, CompleteUserProfileAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: CompleteUserProfileAction);
}

SignUpState completeProfileError(SignUpState state, CompleteUserProfileErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: CompleteUserProfileErrorAction);
}

SignUpState completeProfileSuccess(SignUpState state, CompleteUserProfileSuccessAction action) {
  return state.copyWith(
      isLoading: false,
      error: null,
      completeProfileResponseModel: action.completeProfileResponseModel,
      currentAction: CompleteUserProfileSuccessAction);
}
