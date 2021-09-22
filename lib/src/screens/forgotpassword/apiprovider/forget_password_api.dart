import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/forgetpassword/forget_password_request_model.dart';
import 'package:khontext/src/models/forgetpassword/reset_password_request_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

class ForgetPasswordApiCalls {
  const ForgetPasswordApiCalls();

  /// [sendForgetPasswordLink] will take in the [ForgetPasswordRequestModel] and will
  /// return the [CompleteProfileResponseModel].
  static Future<CommonResponseModel> sendForgetPasswordLink(
      ForgetPasswordRequestModel forgetPasswordRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.forgetPassword,
        body: forgetPasswordRequestModelToJson(forgetPasswordRequestModel));
    CommonResponseModel responseModel;
    if (response != null) {
      responseModel = commonResponseFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [resetPasswordApi] will take in the [ForgetPasswordRequestModel] and will
  /// return the [CompleteProfileResponseModel].
  static Future<CommonResponseModel> resetPasswordApi(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.resetPassword,
        body: resetPasswordRequestModelToJson(resetPasswordRequestModel));
    CommonResponseModel responseModel;
    if (response != null) {
      responseModel = commonResponseFromJson(response.body.toString());
    }

    return responseModel;
  }
}
