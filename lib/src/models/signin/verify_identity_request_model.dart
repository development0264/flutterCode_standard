import 'package:meta/meta.dart';
import 'dart:convert';

VerifyIdentityRequestModel verifyIdentityRequestModelFromJson(String str) => VerifyIdentityRequestModel.fromJson(json.decode(str));

String verifyIdentityRequestModelToJson(VerifyIdentityRequestModel data) => json.encode(data.toJson());

class VerifyIdentityRequestModel {
  VerifyIdentityRequestModel({
    @required this.userId,
    @required this.verificationCode,
  });

  String userId;
  String verificationCode;

  factory VerifyIdentityRequestModel.fromJson(Map<String, dynamic> json) => VerifyIdentityRequestModel(
    userId: json["userId"],
    verificationCode: json["verificationCode"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "verificationCode": verificationCode,
  };
}
