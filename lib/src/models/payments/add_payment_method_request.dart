import 'package:meta/meta.dart';
import 'dart:convert';

CreatePaymentMethodRequestModel createCustomerPaymentMethodRequestModelFromJson(String str) => CreatePaymentMethodRequestModel.fromJson(json.decode(str));

String createCustomerPaymentMethodRequestModelToJson(CreatePaymentMethodRequestModel data) => json.encode(data.toJson());

class CreatePaymentMethodRequestModel {
  CreatePaymentMethodRequestModel({
    @required this.userId,
    @required this.sourceToken,
    @required this.type,
    @required this.addressId,
  });

  String userId;
  String sourceToken;
  String type;
  String addressId;

  factory CreatePaymentMethodRequestModel.fromJson(Map<String, dynamic> json) => CreatePaymentMethodRequestModel(
    userId: json["userId"],
    sourceToken: json["sourceToken"],
    type: json["type"],
    addressId: json["addressId"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "sourceToken": sourceToken,
    "type": type,
    "addressId": addressId,
  };
}
