import 'dart:convert';

import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:meta/meta.dart';

AddPaymentMethodResponseModel addPaymentMethodResponseModelFromJson(String str) =>
    AddPaymentMethodResponseModel.fromJson(json.decode(str));

String addPaymentMethodResponseModelToJson(AddPaymentMethodResponseModel data) =>
    json.encode(data.toJson());

class AddPaymentMethodResponseModel {
  AddPaymentMethodResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  AddPaymentData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory AddPaymentMethodResponseModel.fromJson(Map<String, dynamic> json) =>
      AddPaymentMethodResponseModel(
        data: AddPaymentData.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory AddPaymentMethodResponseModel.initial() {
    return AddPaymentMethodResponseModel(data: null, message: '', errors: '', isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class AddPaymentData {
  AddPaymentData({
    @required this.userId,
    @required this.sourceType,
    @required this.paymentMethodId,
    @required this.sourceId,
    @required this.brandName,
    @required this.expireMonth,
    @required this.expireYear,
    @required this.cardAddress,
    @required this.last4Digit,
    @required this.accountHolderName,
    @required this.customerId,
    @required this.accountId,
    @required this.bankAccountStatus,
    @required this.isDefault,
  });

  String userId;
  String sourceType;
  String paymentMethodId;
  String sourceId;
  String brandName;
  int expireMonth;
  int expireYear;
  ClientAddressData cardAddress;
  String last4Digit;
  String accountHolderName;
  String customerId;
  dynamic accountId;
  dynamic bankAccountStatus;
  bool isDefault;

  factory AddPaymentData.fromJson(Map<String, dynamic> json) => AddPaymentData(
        userId: json["userId"],
        sourceType: json["sourceType"],
        paymentMethodId: json["paymentMethodId"],
        sourceId: json["sourceId"],
        brandName: json["brandName"],
        expireMonth: json["expireMonth"],
        expireYear: json["expireYear"],
        cardAddress: json["cardAddress"] != null
            ? ClientAddressData.fromJson(json["cardAddress"])
            : ClientAddressData.initial(),
        last4Digit: json["last4Digit"],
        accountHolderName: json["accountHolderName"],
        customerId: json["customerId"],
        accountId: json["accountId"],
        bankAccountStatus: json["bankAccountStatus"],
        isDefault: json["isDefault"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "sourceType": sourceType,
        "paymentMethodId": paymentMethodId,
        "sourceId": sourceId,
        "brandName": brandName,
        "expireMonth": expireMonth,
        "expireYear": expireYear,
        "cardAddress": cardAddress.toJson(),
        "last4Digit": last4Digit,
        "accountHolderName": accountHolderName,
        "customerId": customerId,
        "accountId": accountId,
        "bankAccountStatus": bankAccountStatus,
        "isDefault": isDefault,
      };
}
