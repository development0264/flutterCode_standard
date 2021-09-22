import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_request_model.dart';
import 'package:khontext/src/models/location_by_place_model.dart';
import 'package:khontext/src/models/posted_jobs_model.dart';
import 'package:khontext/src/models/postjobs/joblocality/post_job_location_model.dart';

/// Class which will help calling the apis for the [PostedJobsLocation].
class PostJobLocationApiCalls {
  /// [getLocations] will take in the [query] and will return the [PostJobLocationModel].
  static Future<PostJobLocationModel> getLocations(String query) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.placeApi + '$query&key=${ApiEndpoints.placeApiKey}');
    final PostJobLocationModel convertedList = postJobLocationModelFromJson(response.body.toString());
    return convertedList;
  }

  /// [getLocationByPlace] will take in the [placeId] and will return the [LocationByPlaceModel].
  static Future<LocationByPlaceModel> getLocationByPlace(String placeId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.placeIdApi + '$placeId&key=${ApiEndpoints.placeApiKey}');
    final LocationByPlaceModel convertedModel = locationByPlaceModelFromJson(response.body.toString());
    return convertedModel;
  }

  /// [getPostJobsAddress] will be a [GET] api and will return the [ClientAddressResponseModel].
  static Future<ClientAddressResponseModel> getPostJobsAddress(String jobId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.postJobAddress + jobId);
    ClientAddressResponseModel responseModel;
    if (response != null) {
      responseModel = clientAddressResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addPostJobAddress] will be a [POST] api and will return the [ClientAddressResponseModel].
  static Future<ClientAddressResponseModel> addPostJobAddress(String jobId,
      {AddressCreateRequestModel addressCreateRequestModel}) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.postJobAddAddress + jobId,
        body: addressCreateRequestModelToJson(addressCreateRequestModel));
    ClientAddressResponseModel responseModel;
    if (response != null) {
      responseModel = clientAddressResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [updatePostJobAddress] will be a [POST] api and will return the [ClientAddressResponseModel].
  static Future<ClientAddressResponseModel> updatePostJobAddress(String addressId,
      {AddressCreateRequestModel addressCreateRequestModel}) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.postJobUpdateAddress + addressId,
        body: addressCreateRequestModelToJson(addressCreateRequestModel));
    ClientAddressResponseModel responseModel;
    if (response != null) {
      responseModel = clientAddressResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
