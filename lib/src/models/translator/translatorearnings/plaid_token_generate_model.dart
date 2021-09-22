import 'package:meta/meta.dart';
import 'dart:convert';

PlaidTokenGenerateModel plaidTokenGenerateModelFromJson(String str) => PlaidTokenGenerateModel.fromJson(json.decode(str));

String plaidTokenGenerateModelToJson(PlaidTokenGenerateModel data) => json.encode(data.toJson());

class PlaidTokenGenerateModel {
  PlaidTokenGenerateModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  TokenData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory PlaidTokenGenerateModel.fromJson(Map<String, dynamic> jsonValue) => PlaidTokenGenerateModel(
    data: TokenData.fromJson(json.decode(jsonValue["data"].toString())),
    message: jsonValue["message"],
    errors: jsonValue["errors"],
    isSuccessful: jsonValue["isSuccessful"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "errors": errors,
    "isSuccessful": isSuccessful,
  };
}

class TokenData {
  TokenData({
    @required this.expiration,
    @required this.linkToken,
    @required this.requestId,
  });

  DateTime expiration;
  String linkToken;
  String requestId;

  factory TokenData.fromJson(Map<String, dynamic> json) => TokenData(
    expiration: DateTime.parse(json["expiration"]),
    linkToken: json["link_token"],
    requestId: json["request_id"],
  );

  Map<String, dynamic> toJson() => {
    "expiration": expiration.toIso8601String(),
    "link_token": linkToken,
    "request_id": requestId,
  };
}
