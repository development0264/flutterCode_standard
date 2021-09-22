import 'package:khontext/src/models/clientprofile/client_company_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_image_request_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_request_model.dart';

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ClientCompanyFetchAction] which takes in the queries and gives out the response as
/// either [ClientCompanyFetchSuccessAction] or [ClientCompanyFetchErrorAction].
class ClientCompanyFetchAction {
  ClientCompanyFetchAction();
}

class ClientCompanyFetchErrorAction {
  final String error;

  ClientCompanyFetchErrorAction({this.error});
}

class ClientCompanyFetchSuccessAction {
  final ClientCompanyResponseModel clientCompanyResponseModel;
  final ClientCompanyImageResponseModel clientCompanyProfileImageResponseModel;

  ClientCompanyFetchSuccessAction({this.clientCompanyResponseModel, this.clientCompanyProfileImageResponseModel});
}

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ClientCompanyAddAction] which takes in the queries and gives out the response as
/// either [ClientCompanyAddSuccessAction] or [ClientCompanyAddErrorAction].
class ClientCompanyAddAction {
  final ClientCompanyRequestModel clientCompanyRequestModel;

  ClientCompanyAddAction({this.clientCompanyRequestModel});
}

class ClientCompanyAddErrorAction {
  final String error;

  ClientCompanyAddErrorAction({this.error});
}

class ClientCompanyAddSuccessAction {
  final ClientCompanyResponseModel clientCompanyResponseModel;

  ClientCompanyAddSuccessAction({this.clientCompanyResponseModel});
}

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ClientCompanyAddImageAction] which takes in the queries and gives out the response as
/// either [ClientCompanyAddImageSuccessAction] or [ClientCompanyAddImageErrorAction].
class ClientCompanyAddImageAction {
  final ClientCompanyImageRequestModel clientCompanyImageRequestModel;

  ClientCompanyAddImageAction({this.clientCompanyImageRequestModel});
}

class ClientCompanyAddImageErrorAction {
  final String error;

  ClientCompanyAddImageErrorAction({this.error});
}

class ClientCompanyAddImageSuccessAction {
  final ClientCompanyImageResponseModel clientCompanyImageResponseModel;

  ClientCompanyAddImageSuccessAction({this.clientCompanyImageResponseModel});
}

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ClientCompanyUpdateAction] which takes in the queries and gives out the response as
/// either [ClientCompanyUpdateSuccessAction] or [ClientCompanyUpdateErrorAction].
class ClientCompanyUpdateAction {
  final ClientCompanyRequestModel clientCompanyRequestModel;

  ClientCompanyUpdateAction({this.clientCompanyRequestModel});
}

class ClientCompanyUpdateErrorAction {
  final String error;

  ClientCompanyUpdateErrorAction({this.error});
}

class ClientCompanyUpdateSuccessAction {
  final ClientCompanyResponseModel clientCompanyResponseModel;

  ClientCompanyUpdateSuccessAction({this.clientCompanyResponseModel});
}

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ClientCompanyUpdateImageAction] which takes in the queries and gives out the response as
/// either [ClientCompanyUpdateImageSuccessAction] or [ClientCompanyUpdateImageErrorAction].
class ClientCompanyUpdateImageAction {
  final ClientCompanyImageRequestModel clientCompanyImageRequestModel;

  ClientCompanyUpdateImageAction({this.clientCompanyImageRequestModel});
}

class ClientCompanyUpdateImageErrorAction {
  final String error;

  ClientCompanyUpdateImageErrorAction({this.error});
}

class ClientCompanyUpdateImageSuccessAction {
  final ClientCompanyImageResponseModel clientCompanyImageResponseModel;

  ClientCompanyUpdateImageSuccessAction({this.clientCompanyImageResponseModel});
}