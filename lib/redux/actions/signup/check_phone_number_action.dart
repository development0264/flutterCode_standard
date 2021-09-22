import 'package:flutter/material.dart';
import 'package:khontext/src/models/signup/check_phone_response_model.dart';
import 'package:khontext/src/models/signup/phone_number_request_model.dart';
import 'package:khontext/src/screens/signup/create_account_page.dart';

/// Group of functions which gives the actions for the [CreateAccountPage].
/// This group contains [CheckPhoneNumberAction] which takes in the queries and gives out the response as
/// either [CheckPhoneNumberSuccessAction] or [CheckPhoneNumberErrorAction].
class CheckPhoneNumberAction {
  final String userId;
  final BuildContext context;
  final PhoneNumberRequestModel phoneNumber;

  CheckPhoneNumberAction({this.userId, this.phoneNumber, this.context});
}

class CheckPhoneNumberErrorAction {
  final String error;

  CheckPhoneNumberErrorAction({this.error});
}

class CheckPhoneNumberSuccessAction {
  final CheckPhoneResponseModel checkPhoneResponseModel;

  CheckPhoneNumberSuccessAction({this.checkPhoneResponseModel});
}
