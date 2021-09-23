import 'package:demo/src/models/complete_profile_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class SignInState {
  final bool isLoading;
  final String error;
  final CompleteProfileResponseModel completeProfileResponseModel;

  SignInState({
    @required this.isLoading,
    @required this.error,
    @required this.completeProfileResponseModel,
  });

  factory SignInState.initial() {
    return SignInState(
      isLoading: false,
      completeProfileResponseModel: CompleteProfileResponseModel.initial(),
      error: '',
    );
  }

  SignInState copyWith({
    bool isLoading,
    String error,
    CompleteProfileResponseModel completeProfileResponseModel,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      completeProfileResponseModel: completeProfileResponseModel ?? this.completeProfileResponseModel,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignInState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          completeProfileResponseModel == other.completeProfileResponseModel &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ completeProfileResponseModel.hashCode ^ error.hashCode;
}
