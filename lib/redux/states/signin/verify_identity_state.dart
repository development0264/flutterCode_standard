import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class VerifyIdentityState {
  final bool isLoading;
  final String error;
  final CompleteProfileResponseModel completeProfileResponseModel;

  VerifyIdentityState({
    @required this.isLoading,
    @required this.error,
    @required this.completeProfileResponseModel,
  });

  factory VerifyIdentityState.initial() {
    return VerifyIdentityState(
      isLoading: false,
      completeProfileResponseModel: CompleteProfileResponseModel.initial(),
      error: '',
    );
  }

  VerifyIdentityState copyWith({
    bool isLoading,
    String error,
    CompleteProfileResponseModel completeProfileResponseModel,
  }) {
    return VerifyIdentityState(
      isLoading: isLoading ?? this.isLoading,
      completeProfileResponseModel: completeProfileResponseModel ?? this.completeProfileResponseModel,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is VerifyIdentityState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              completeProfileResponseModel == other.completeProfileResponseModel &&
              error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ completeProfileResponseModel.hashCode ^ error.hashCode;
}
