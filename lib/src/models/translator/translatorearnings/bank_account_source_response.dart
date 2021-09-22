import 'package:meta/meta.dart';
import 'dart:convert';

BankAccountSourceResponse bankAccountSourceResponseFromJson(String str) => BankAccountSourceResponse.fromJson(json.decode(str));

String bankAccountSourceResponseToJson(BankAccountSourceResponse data) => json.encode(data.toJson());

class BankAccountSourceResponse {
  BankAccountSourceResponse({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  String data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory BankAccountSourceResponse.fromJson(Map<String, dynamic> json) => BankAccountSourceResponse(
    data: json["data"],
    message: json["message"],
    errors: json["errors"],
    isSuccessful: json["isSuccessful"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "errors": errors,
    "isSuccessful": isSuccessful,
  };
}
