import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/signup/check_phone_response_model.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/src/models/signup/mail_request_model.dart';
import 'package:khontext/src/models/signup/phone_number_request_model.dart';
import 'package:khontext/src/models/signup/send_phone_code_response_model.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/models/signup/user_profile_response_model.dart';
import 'package:khontext/src/models/signup/verify_email_response_model.dart';
import 'package:khontext/src/models/signup/verify_phone_response_model.dart';
import 'package:khontext/src/screens/signup/create_account_page.dart';

/// Class which will help calling the apis for the [CreateAccountPage].
class SignUpApiCalls {
  const SignUpApiCalls();

  /// [createUserProfile] will take in the [UserProfileModel] and will return the [UserProfileResponseModel].
  static Future<UserProfileResponseModel> createUserProfile(UserProfileModel userProfile) async {
    var response = await ApiProvider
        .postAsync(ApiEndpoints.createUserProfile, body: userProfileModelToJson(userProfile));
    UserProfileResponseModel responseModel;
    if (response != null) {
      responseModel = userProfileResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [sendEmailVerificationCode] will take in the [SendVerificationPhoneModel] and will return
  /// the [VerifyEmailResponseModel].
  static Future<VerifyEmailResponseModel> sendEmailVerificationCode(
      SendVerifyMailRequestModel sendVerifyMailRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.sendEmailVerification,
        body: sendVerifyMailRequestModelToJson(sendVerifyMailRequestModel));
    VerifyEmailResponseModel responseModel;
    if (response != null) {
      responseModel = verifyEmailResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [verifyEmail] will take in the [VerifyEmailModel] and will return the [VerifyEmailResponseModel].
  static Future<VerifyEmailResponseModel> verifyEmail(VerifyEmailModel verifyEmailModel) async {
    var response = await ApiProvider
        .postAsync(ApiEndpoints.verifyEmail, body: verifyEmailModelToJson(verifyEmailModel));
    VerifyEmailResponseModel responseModel;
    if (response != null) {
      responseModel = verifyEmailResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [checkPhoneNumber] will take in the [String] phone number and will return the [CheckPhoneResponseModel].
  static Future<CheckPhoneResponseModel> checkPhoneNumber(
      PhoneNumberRequestModel phoneNumber) async {
    var response = await ApiProvider
        .postAsync(ApiEndpoints.checkPhoneNumber, body: phoneNumberRequestModelToJson(phoneNumber));
    CheckPhoneResponseModel responseModel;
    if (response != null) {
      responseModel = checkPhoneResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [sendPhoneVerification] will take in the [SendVerificationPhoneModel] and will return the [PhoneCodeResponseModel].
  static Future<PhoneCodeResponseModel> sendPhoneVerification(
      SendVerificationPhoneModel sendVerificationPhoneModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.sendPhoneVerification,
        body: sendVerificationPhoneModelToJson(sendVerificationPhoneModel));
    PhoneCodeResponseModel responseModel;
    if (response != null) {
      responseModel = phoneCodeResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [verifyPhone] will take in the [VerifyPhoneModel] and will return the [VerifyPhoneResponseModel].
  static Future<VerifyPhoneResponseModel> verifyPhone(VerifyPhoneModel verifyPhoneModel) async {
    var response = await ApiProvider
        .postAsync(ApiEndpoints.verifyPhone, body: verifyPhoneModelToJson(verifyPhoneModel));
    VerifyPhoneResponseModel responseModel;
    if (response != null) {
      responseModel = verifyPhoneResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [completeProfile] will take in the [CompleteUserProfileModel] and will return the [CompleteProfileResponseModel].
  static Future<CompleteProfileResponseModel> completeProfile(
      CompleteUserProfileModel completeUserProfileModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.completeUserProfile,
        body: completeUserProfileModelToJson(completeUserProfileModel));
    CompleteProfileResponseModel responseModel;
    if (response != null) {
      responseModel = completeProfileResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
