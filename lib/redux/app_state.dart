import 'package:khontext/redux/states/signin/sign_in_state.dart';
import 'package:meta/meta.dart';

/// [AppState] class is the root class which will provide the state of the entire application.
class AppState {
  final SignInState signInState;

  AppState({
    @required this.signInState,
  });

  /// [factory] method which is passed as the initial state of the redux store.
  factory AppState.initial() {
    return AppState(
      signInState: SignInState.initial(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          signInState == other.signInState;

  @override
  int get hashCode =>
      signInState.hashCode;
}
