import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_request_model.dart';

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [PostJobLocalityFetchAction] which takes in the queries and gives out the response as
/// either [PostJobLocalityFetchSuccessAction] or [PostJobLocalityFetchErrorAction].
class PostJobLocalityFetchAction {
  final String jobId;
  PostJobLocalityFetchAction({this.jobId});
}

class PostJobLocalityFetchErrorAction {
  final String error;

  PostJobLocalityFetchErrorAction({this.error});
}

class PostJobLocalityFetchSuccessAction {
  final ClientAddressResponseModel userAddressResponseModel;

  PostJobLocalityFetchSuccessAction({this.userAddressResponseModel});
}

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [PostJobLocalityAddAction] which takes in the queries and gives out the response as
/// either [PostJobLocalityAddSuccessAction] or [PostJobLocalityAddErrorAction].
class PostJobLocalityAddAction {
  final String jobId;
  final AddressCreateRequestModel addressCreateRequestModel;

  PostJobLocalityAddAction({this.addressCreateRequestModel, this.jobId});
}

class PostJobLocalityAddErrorAction {
  final String error;

  PostJobLocalityAddErrorAction({this.error});
}

class PostJobLocalityAddSuccessAction {
  final ClientAddressResponseModel userAddressResponseModel;

  PostJobLocalityAddSuccessAction({this.userAddressResponseModel});
}

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [PostJobLocalityUpdateAction] which takes in the queries and gives out the response as
/// either [PostJobLocalityUpdateSuccessAction] or [PostJobLocalityUpdateErrorAction].
class PostJobLocalityUpdateAction {
  final AddressCreateRequestModel addressCreateRequestModel;

  PostJobLocalityUpdateAction({this.addressCreateRequestModel});
}

class PostJobLocalityUpdateErrorAction {
  final String error;

  PostJobLocalityUpdateErrorAction({this.error});
}

class PostJobLocalityUpdateSuccessAction {
  final ClientAddressResponseModel userAddressResponseModel;

  PostJobLocalityUpdateSuccessAction({this.userAddressResponseModel});
}
