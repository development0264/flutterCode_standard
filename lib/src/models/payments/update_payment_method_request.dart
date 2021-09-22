import 'package:meta/meta.dart';
import 'dart:convert';

UpdatePaymentMethodRequestModel updatePaymentMethodRequestModelFromJson(String str) => UpdatePaymentMethodRequestModel.fromJson(json.decode(str));

String updatePaymentMethodRequestModelToJson(UpdatePaymentMethodRequestModel data) => json.encode(data.toJson());

class UpdatePaymentMethodRequestModel {
  UpdatePaymentMethodRequestModel({
    @required this.userId,
    @required this.cardId,
    @required this.cardholderName,
    @required this.addressId,
    @required this.expireMonth,
    @required this.expireYear,
    @required this.type,
    this.bankAccountId,
    this.accountHolderName,
    this.accountHolderType,
  });

  String userId;
  String cardId;
  String cardholderName;
  String addressId;
  int expireMonth;
  int expireYear;
  String type;
  String bankAccountId;
  String accountHolderName;
  String accountHolderType;

  factory UpdatePaymentMethodRequestModel.fromJson(Map<String, dynamic> json) => UpdatePaymentMethodRequestModel(
    userId: json["userId"],
    cardId: json["cardId"],
    cardholderName: json["cardholderName"],
    addressId: json["addressId"],
    expireMonth: json["expireMonth"],
    expireYear: json["expireYear"],
    type: json["type"],
    bankAccountId: json["bankAccountId"],
    accountHolderName: json["accountHolderName"],
    accountHolderType: json["accountHolderType"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "cardId": cardId,
    "cardholderName": cardholderName,
    "addressId": addressId,
    "expireMonth": expireMonth,
    "expireYear": expireYear,
    "type": type,
    "bankAccountId": bankAccountId,
    "accountHolderName": accountHolderName,
    "accountHolderType": accountHolderType,
  };
}
