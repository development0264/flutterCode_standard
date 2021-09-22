import 'package:meta/meta.dart';
import 'dart:convert';

SendVerifyMailRequestModel sendVerifyMailRequestModelFromJson(String str) => SendVerifyMailRequestModel.fromJson(json.decode(str));

String sendVerifyMailRequestModelToJson(SendVerifyMailRequestModel data) => json.encode(data.toJson());

class SendVerifyMailRequestModel {
  SendVerifyMailRequestModel({
    @required this.userId,
    @required this.toEmail,
  });

  String userId;
  String toEmail;

  factory SendVerifyMailRequestModel.fromJson(Map<String, dynamic> json) => SendVerifyMailRequestModel(
    userId: json["userId"],
    toEmail: json["toEmail"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "toEmail": toEmail,
  };
}
