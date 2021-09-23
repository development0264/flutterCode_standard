import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/reducers/signin/sign_in_reducer.dart';

/// [appReducer] will have all the reducers that exists in the application.
/// This will return the current state of the application. Will be following the [AppMiddleware].
AppState appReducer(AppState state, dynamic action) {
  return AppState(
    signInState: signInReducer(state.signInState, action),
  );
}
