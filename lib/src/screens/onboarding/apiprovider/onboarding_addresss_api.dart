import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/job_services_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/onboarding_address_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/onboarding_address_response_model.dart';

class OnBoardingAddressApiCalls {
  const OnBoardingAddressApiCalls();

  /// [getJobServices] will return the [JobServicesResponseModel].
  static Future<JobServicesResponseModel> getJobServices() async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getOnboardService);
    JobServicesResponseModel responseModel;
    if (response != null) {
      responseModel = jobServicesResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addOnBoardingAddress] will take in the [OnBoardingAddressRequestModel] return
  /// the [OnBoardingAddressResponseModel].
  static Future<OnBoardingAddressResponseModel> addOnBoardingAddress(
      OnBoardingAddressRequestModel onBoardingAddressRequestModel) async {
    var response = await ApiProvider.postAsync(
      ApiEndpoints.getOnboardAddressServices,
      body: onBoardingAddressRequestModelToJson(onBoardingAddressRequestModel),
    );
    OnBoardingAddressResponseModel responseModel;
    if (response != null) {
      responseModel = onBoardingAddressResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
