import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_request_model.dart';

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ClientAddressFetchAction] which takes in the queries and gives out the response as
/// either [ClientAddressFetchSuccessAction] or [ClientAddressFetchErrorAction].
class ClientAddressFetchAction {
  ClientAddressFetchAction();
}

class ClientAddressFetchErrorAction {
  final String error;

  ClientAddressFetchErrorAction({this.error});
}

class ClientAddressFetchSuccessAction {
  final ClientAddressResponseModel userAddressResponseModel;

  ClientAddressFetchSuccessAction({this.userAddressResponseModel});
}

/// This group contains [ClientAddAddressAction] which takes in the queries and gives out the response as
/// either [ClientAddAddressSuccessAction] or [ClientAddAddressErrorAction].
class ClientAddAddressAction {
  final AddressCreateRequestModel addressCreateRequestModel;

  ClientAddAddressAction({this.addressCreateRequestModel});
}

class ClientAddAddressErrorAction {
  final String error;

  ClientAddAddressErrorAction({this.error});
}

class ClientAddAddressSuccessAction {
  final ClientAddressResponseModel userAddressResponseModel;

  ClientAddAddressSuccessAction({this.userAddressResponseModel});
}

/// This group contains [ClientUpdateAddressAction] which takes in the queries and gives out the response as
/// either [ClientUpdateAddressSuccessAction] or [ClientUpdateAddressErrorAction].
class ClientUpdateAddressAction {
  final AddressCreateRequestModel addressCreateRequestModel;

  ClientUpdateAddressAction({this.addressCreateRequestModel});
}

class ClientUpdateAddressErrorAction {
  final String error;

  ClientUpdateAddressErrorAction({this.error});
}

class ClientUpdateAddressSuccessAction {
  final ClientAddressResponseModel userAddressResponseModel;

  ClientUpdateAddressSuccessAction({this.userAddressResponseModel});
}
