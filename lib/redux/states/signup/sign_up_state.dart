import 'package:khontext/src/models/signup/check_phone_response_model.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/src/models/signup/send_phone_code_response_model.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/models/signup/user_profile_response_model.dart';
import 'package:khontext/src/models/signup/verify_email_response_model.dart';
import 'package:khontext/src/models/signup/verify_phone_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class SignUpState {
  final bool isLoading;
  final String error;
  final UserProfileResponseModel userProfileResponseModel;
  final VerifyEmailResponseModel verifyEmailResponseModel;
  final CheckPhoneResponseModel checkPhoneResponseModel;
  final PhoneCodeResponseModel phoneCodeResponseModel;
  final VerifyPhoneResponseModel verifyPhoneResponseModel;
  final CompleteProfileResponseModel completeProfileResponseModel;
  final dynamic currentAction;

  SignUpState({
    @required this.isLoading,
    @required this.error,
    @required this.userProfileResponseModel,
    @required this.verifyEmailResponseModel,
    @required this.checkPhoneResponseModel,
    @required this.phoneCodeResponseModel,
    @required this.verifyPhoneResponseModel,
    @required this.completeProfileResponseModel,
    @required this.currentAction,
  });

  factory SignUpState.initial() {
    return SignUpState(
      isLoading: false,
      userProfileResponseModel: UserProfileResponseModel.initial(),
      verifyEmailResponseModel: VerifyEmailResponseModel.initial(),
      checkPhoneResponseModel: CheckPhoneResponseModel.initial(),
      phoneCodeResponseModel: PhoneCodeResponseModel.initial(),
      verifyPhoneResponseModel: VerifyPhoneResponseModel.initial(),
      completeProfileResponseModel: CompleteProfileResponseModel.initial(),
      currentAction: null,
      error: '',
    );
  }

  SignUpState copyWith({
    bool isLoading,
    String error,
    UserProfileResponseModel userProfileResponseModel,
    VerifyEmailResponseModel verifyEmailResponseModel,
    CheckPhoneResponseModel checkPhoneResponseModel,
    PhoneCodeResponseModel phoneCodeResponseModel,
    VerifyPhoneResponseModel verifyPhoneResponseModel,
    CompleteProfileResponseModel completeProfileResponseModel,
    CompleteUserProfileModel otherDetailsModel,
    dynamic currentAction,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      userProfileResponseModel: userProfileResponseModel ?? this.userProfileResponseModel,
      verifyEmailResponseModel: verifyEmailResponseModel ?? this.verifyEmailResponseModel,
      checkPhoneResponseModel: checkPhoneResponseModel ?? this.checkPhoneResponseModel,
      phoneCodeResponseModel: phoneCodeResponseModel ?? this.phoneCodeResponseModel,
      verifyPhoneResponseModel: verifyPhoneResponseModel ?? this.verifyPhoneResponseModel,
      completeProfileResponseModel: completeProfileResponseModel ?? this.completeProfileResponseModel,
      currentAction: currentAction ?? this.currentAction,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignUpState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          userProfileResponseModel == other.userProfileResponseModel &&
          verifyEmailResponseModel == other.verifyEmailResponseModel &&
          checkPhoneResponseModel == other.checkPhoneResponseModel &&
          phoneCodeResponseModel == other.phoneCodeResponseModel &&
          verifyPhoneResponseModel == other.verifyPhoneResponseModel &&
          completeProfileResponseModel == other.completeProfileResponseModel &&
          currentAction == other.currentAction &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      userProfileResponseModel.hashCode ^
      verifyEmailResponseModel.hashCode ^
      checkPhoneResponseModel.hashCode ^
      phoneCodeResponseModel.hashCode ^
      verifyPhoneResponseModel.hashCode ^
      completeProfileResponseModel.hashCode ^
      currentAction.hashCode ^
      error.hashCode;
}
