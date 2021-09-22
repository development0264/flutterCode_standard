import 'package:meta/meta.dart';
import 'dart:convert';

ResetPasswordRequestModel resetPasswordRequestModelFromJson(String str) => ResetPasswordRequestModel.fromJson(json.decode(str));

String resetPasswordRequestModelToJson(ResetPasswordRequestModel data) => json.encode(data.toJson());

class ResetPasswordRequestModel {
  ResetPasswordRequestModel({
    @required this.resetToken,
    @required this.password,
  });

  String resetToken;
  String password;

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) => ResetPasswordRequestModel(
    resetToken: json["resetToken"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "resetToken": resetToken,
    "password": password,
  };
}
