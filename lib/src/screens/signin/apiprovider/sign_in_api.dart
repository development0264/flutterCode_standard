import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/signin/sign_in_request_model.dart';
import 'package:khontext/src/models/signin/verify_identity_request_model.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

class SignInApiCalls {
  const SignInApiCalls();

  /// [signInUser] will take in the [SignInRequestModel] and will return the [CompleteProfileResponseModel].
  static Future<CompleteProfileResponseModel> signInUser(
      SignInRequestModel signInRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.signInUser,
        body: signInRequestModelToJson(signInRequestModel));
    CompleteProfileResponseModel responseModel;
    if (response != null) {
      responseModel = completeProfileResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [sendVerificationCode] will take in the [String] user id and will return
  /// the [CommonResponseModel].
  static Future<CommonResponseModel> sendVerificationCode(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.sendVerificationCode + userId);
    CommonResponseModel responseModel;
    if (response != null) {
      responseModel = commonResponseFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [verifyIdentity] will take in the [VerifyIdentityRequestModel] and will return
  /// the [CompleteProfileResponseModel].
  static Future<CompleteProfileResponseModel> verifyIdentity(
      VerifyIdentityRequestModel verifyIdentityRequestModel) async {
    var response = await ApiProvider.postAsync(
      ApiEndpoints.verifyIdentification,
      body: verifyIdentityRequestModelToJson(verifyIdentityRequestModel),
    );
    CompleteProfileResponseModel responseModel;
    if (response != null) {
      responseModel = completeProfileResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
