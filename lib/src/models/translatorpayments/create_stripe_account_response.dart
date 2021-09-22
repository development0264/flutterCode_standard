import 'dart:convert';

import 'package:meta/meta.dart';

CreateStripeAccountResponseModel createStripeAccountResponseModelFromJson(String str) =>
    CreateStripeAccountResponseModel.fromJson(json.decode(str));

String createStripeAccountResponseModelToJson(CreateStripeAccountResponseModel data) => json.encode(data.toJson());

class CreateStripeAccountResponseModel {
  CreateStripeAccountResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  AccountResponseData data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory CreateStripeAccountResponseModel.fromJson(Map<String, dynamic> json) => CreateStripeAccountResponseModel(
        data: AccountResponseData.fromJson(json["data"]),
        message: json["message"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        isSuccessful: json["isSuccessful"],
      );

  factory CreateStripeAccountResponseModel.initial() {
    return CreateStripeAccountResponseModel(data: null, message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "isSuccessful": isSuccessful,
      };
}

class AccountResponseData {
  AccountResponseData({
    @required this.accountId,
    @required this.verifyAccountLink,
    @required this.externalSource,
    @required this.isAccount,
    @required this.isAccountVerified,
    @required this.isExternalAccountCard,
  });

  String accountId;
  dynamic verifyAccountLink;
  String externalSource;
  bool isAccount;
  bool isAccountVerified;
  bool isExternalAccountCard;

  factory AccountResponseData.fromJson(Map<String, dynamic> json) => AccountResponseData(
        accountId: json["accountId"],
        verifyAccountLink: json["verifyAccountLink"],
        externalSource: json["externalSource"],
        isAccount: json["isAccount"],
        isAccountVerified: json["isAccountVerified"],
        isExternalAccountCard: json["isExternalAccountCard"],
      );

  Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "verifyAccountLink": verifyAccountLink,
        "externalSource": externalSource,
        "isAccount": isAccount,
        "isAccountVerified": isAccountVerified,
        "isExternalAccountCard": isExternalAccountCard,
      };
}
