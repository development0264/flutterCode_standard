import 'package:flutter/material.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/payments/add_payment_method_request.dart';
import 'package:khontext/src/models/payments/add_payment_method_response.dart';
import 'package:khontext/src/models/payments/delete_payment_method_request.dart';
import 'package:khontext/src/models/payments/delete_payment_method_response.dart';
import 'package:khontext/src/models/payments/payment_method_list_model.dart';
import 'package:khontext/src/models/payments/update_payment_method_request.dart';
import 'package:khontext/src/models/payments/user_address_list_model.dart';
import 'package:khontext/utils/enums.dart';

/// Group of functions which gives the actions for the [Payments].
/// This group contains [UserAddressListFetchAction] which takes in the queries and gives out the response as
/// either [UserAddressListSuccessAction] or [UserAddressListErrorAction].
class UserAddressListFetchAction {
  UserAddressListFetchAction();
}

class UserAddressListErrorAction {
  final String error;

  UserAddressListErrorAction({@required this.error});
}

class UserAddressListSuccessAction {
  final UserAddressListResponseModel userAddressListResponseModel;

  UserAddressListSuccessAction({@required this.userAddressListResponseModel});
}

/// Group of functions which gives the actions for the [Payments].
/// This group contains [PaymentMethodListFetchAction] which takes in the queries and gives out the response as
/// either [PaymentMethodListSuccessAction] or [PaymentMethodListErrorAction].
class PaymentMethodListFetchAction {
  PaymentMethodListFetchAction();
}

class PaymentMethodListErrorAction {
  final String error;

  PaymentMethodListErrorAction({@required this.error});
}

class PaymentMethodListSuccessAction {
  final PaymentMethodListModel paymentMethodListModel;

  PaymentMethodListSuccessAction({@required this.paymentMethodListModel});
}

/// Group of functions which gives the actions for the [Payments].
/// This group contains [AddPaymentMethodAction] which takes in the queries and gives out the response as
/// either [AddPaymentMethodSuccessAction] or [AddPaymentMethodErrorAction].
class AddPaymentMethodAction {
  final USERTYPE userType;
  final ClientAddressData addressData;
  final CreatePaymentMethodRequestModel createPaymentMethodRequestModel;

  AddPaymentMethodAction(
      {@required this.userType, @required this.addressData, @required this.createPaymentMethodRequestModel});
}

class AddPaymentMethodErrorAction {
  final String error;

  AddPaymentMethodErrorAction({@required this.error});
}

class AddPaymentMethodSuccessAction {
  final AddPaymentMethodResponseModel paymentMethodResponseModel;

  AddPaymentMethodSuccessAction({@required this.paymentMethodResponseModel});
}

/// Group of functions which gives the actions for the [Payments].
/// This group contains [UpdatePaymentMethodAction] which takes in the queries and gives out the response as
/// either [UpdatePaymentMethodSuccessAction] or [UpdatePaymentMethodErrorAction].
class UpdatePaymentMethodAction {
  final USERTYPE userType;
  final UpdatePaymentMethodRequestModel updatePaymentMethodRequestModel;

  UpdatePaymentMethodAction({@required this.userType, @required this.updatePaymentMethodRequestModel});
}

class UpdatePaymentMethodErrorAction {
  final String error;

  UpdatePaymentMethodErrorAction({@required this.error});
}

class UpdatePaymentMethodSuccessAction {
  final AddPaymentMethodResponseModel paymentMethodResponseModel;

  UpdatePaymentMethodSuccessAction({@required this.paymentMethodResponseModel});
}

/// Group of functions which gives the actions for the [Payments].
/// This group contains [DeletePaymentMethodAction] which takes in the queries and gives out the response as
/// either [DeletePaymentMethodSuccessAction] or [DeletePaymentMethodErrorAction].
class DeletePaymentMethodAction {
  final USERTYPE userType;
  final DeletePaymentMethodRequestModel deletePaymentMethodRequestModel;

  DeletePaymentMethodAction({@required this.userType, @required this.deletePaymentMethodRequestModel});
}

class DeletePaymentMethodErrorAction {
  final String error;

  DeletePaymentMethodErrorAction({@required this.error});
}

class DeletePaymentMethodSuccessAction {
  final DeletePaymentMethodResponseModel deletePaymentMethodResponseModel;

  DeletePaymentMethodSuccessAction({@required this.deletePaymentMethodResponseModel});
}
