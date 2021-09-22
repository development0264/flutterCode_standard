import 'package:khontext/redux/actions/signin/sign_in_action.dart';
import 'package:khontext/redux/states/signin/sign_in_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<SignInState> signInReducer = combineReducers([
  // Sign in events
  TypedReducer<SignInState, SignInAction>(signIn),
  TypedReducer<SignInState, SignInErrorAction>(signInError),
  TypedReducer<SignInState, SignInSuccessAction>(signInSuccess),
]);

/// Sign In
SignInState signIn(SignInState state, SignInAction action) {
  return state.copyWith(isLoading: true, error: null);
}

SignInState signInError(SignInState state, SignInErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error);
}

SignInState signInSuccess(SignInState state, SignInSuccessAction action) {
  return state.copyWith(
      isLoading: false, error: null, completeProfileResponseModel: action.completeProfileResponseModel);
}
