import 'package:meta/meta.dart';

@immutable
class ForgetPasswordState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;

  ForgetPasswordState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
  });

  factory ForgetPasswordState.initial() {
    return ForgetPasswordState(
      isLoading: false,
      error: '',
      currentAction: null,
    );
  }

  ForgetPasswordState copyWith({
    bool isLoading,
    String error,
    dynamic currentAction,
  }) {
    return ForgetPasswordState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentAction: currentAction ?? this.currentAction,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForgetPasswordState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          currentAction == other.currentAction &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ currentAction.hashCode;
}
