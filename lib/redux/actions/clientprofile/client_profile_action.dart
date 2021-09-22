import 'package:khontext/src/models/clientprofile/client_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_image_request_model.dart';
import 'package:khontext/src/models/clientprofile/client_profile_model.dart';
import 'package:khontext/src/models/clientprofile/client_profile_request_model.dart';

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ClientProfileFetchAction] which takes in the queries and gives out the response as
/// either [ClientProfileFetchSuccessAction] or [ClientProfileFetchErrorAction].
class ClientProfileFetchAction {
  ClientProfileFetchAction();
}

class ClientProfileFetchErrorAction {
  final String error;

  ClientProfileFetchErrorAction({this.error});
}

class ClientProfileFetchSuccessAction {
  final ClientProfileResponseModel userProfileResponseModel;
  final ClientProfileImageResponseModel userProfileImageResponseModel;

  ClientProfileFetchSuccessAction({
    this.userProfileResponseModel,
    this.userProfileImageResponseModel,
  });
}

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ClientProfileImageAddAction] which takes in the queries and gives out the response as
/// either [ClientProfileImageAddSuccessAction] or [ClientProfileImageAddErrorAction].
class ClientProfileImageAddAction {
  final ClientProfileImageRequestModel clientProfileImageRequestModel;

  ClientProfileImageAddAction({this.clientProfileImageRequestModel});
}

class ClientProfileImageAddErrorAction {
  final String error;

  ClientProfileImageAddErrorAction({this.error});
}

class ClientProfileImageAddSuccessAction {
  final ClientProfileImageResponseModel userProfileImageResponseModel;

  ClientProfileImageAddSuccessAction({this.userProfileImageResponseModel});
}

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ClientProfileUpdateAction] which takes in the queries and gives out the response as
/// either [ClientProfileUpdateSuccessAction] or [ClientProfileUpdateErrorAction].
class ClientProfileUpdateAction {
  final ClientProfileUpdateRequestModel clientProfileUpdateRequestModel;

  ClientProfileUpdateAction({this.clientProfileUpdateRequestModel});
}

class ClientProfileUpdateErrorAction {
  final String error;

  ClientProfileUpdateErrorAction({this.error});
}

class ClientProfileUpdateSuccessAction {
  final ClientProfileResponseModel userProfileResponseModel;

  ClientProfileUpdateSuccessAction({this.userProfileResponseModel});
}

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ClientProfileImageUpdateAction] which takes in the queries and gives out the response as
/// either [ClientProfileImageUpdateSuccessAction] or [ClientProfileImageUpdateErrorAction].
class ClientProfileImageUpdateAction {
  final ClientProfileImageRequestModel clientProfileImageRequestModel;

  ClientProfileImageUpdateAction({this.clientProfileImageRequestModel});
}

class ClientProfileImageUpdateErrorAction {
  final String error;

  ClientProfileImageUpdateErrorAction({this.error});
}

class ClientProfileImageUpdateSuccessAction {
  final ClientProfileImageResponseModel userProfileImageResponseModel;

  ClientProfileImageUpdateSuccessAction({this.userProfileImageResponseModel});
}
