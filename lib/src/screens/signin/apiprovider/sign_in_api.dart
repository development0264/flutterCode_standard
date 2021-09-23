import 'package:demo/api/api_endpoints.dart';
import 'package:demo/api/base_api_provider.dart';
import 'package:demo/src/models/signin/sign_in_request_model.dart';
import 'package:demo/src/models/complete_profile_response_model.dart';

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
}
