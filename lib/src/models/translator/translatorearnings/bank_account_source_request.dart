import 'package:meta/meta.dart';
import 'dart:convert';

BankAccountSourceRequest bankAccountSourceRequestFromJson(String str) => BankAccountSourceRequest.fromJson(json.decode(str));

String bankAccountSourceRequestToJson(BankAccountSourceRequest data) => json.encode(data.toJson());

class BankAccountSourceRequest {
  BankAccountSourceRequest({
    @required this.publicToken,
    @required this.accountId,
  });

  String publicToken;
  String accountId;

  factory BankAccountSourceRequest.fromJson(Map<String, dynamic> json) => BankAccountSourceRequest(
    publicToken: json["publicToken"],
    accountId: json["accountId"],
  );

  Map<String, dynamic> toJson() => {
    "publicToken": publicToken,
    "accountId": accountId,
  };
}
