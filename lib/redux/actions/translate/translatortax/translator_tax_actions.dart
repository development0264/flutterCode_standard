import 'package:khontext/src/models/translator/translatortax/user_add_request_model.dart';
import 'package:khontext/src/models/translator/translatortax/user_add_response_model.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [ExistingUserAddressFetchAction] which takes in the queries and gives out the response as
/// either [ExistingUserAddressSuccessAction] or [ExistingUserAddressErrorAction].
class ExistingUserAddressFetchAction {
  ExistingUserAddressFetchAction();
}

class ExistingUserAddressErrorAction {
  final String error;

  ExistingUserAddressErrorAction({this.error});
}

class ExistingUserAddressSuccessAction {
  UserAddResponseModel userAddResponseModel;

  ExistingUserAddressSuccessAction({this.userAddResponseModel});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [AddUserAddressAction] which takes in the queries and gives out the response as
/// either [AddUserAddressSuccessAction] or [AddUserAddressErrorAction].
class AddUserAddressAction {
  final AddUserAddressRequestModel addressRequestModel;

  AddUserAddressAction({this.addressRequestModel});
}

class AddUserAddressErrorAction {
  final String error;

  AddUserAddressErrorAction({this.error});
}

class AddUserAddressSuccessAction {
  UserAddResponseModel userAddResponseModel;

  AddUserAddressSuccessAction({this.userAddResponseModel});
}
