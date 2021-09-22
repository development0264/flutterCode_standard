import 'dart:convert';

String signInRequestModelToJson(SignInRequestModel data) => json.encode(data.toJson());

SignInRequestModel signInRequestModelFromJson(String str) =>
    SignInRequestModel.fromJson(json.decode(str));

class SignInRequestModel {
  final String userName;
  final String password;
  final bool rememberMe;

  SignInRequestModel({this.userName, this.password, this.rememberMe});

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) => SignInRequestModel(
        userName: json["username"],
        password: json["password"],
        rememberMe: json['rememberMe'],
      );

  Map<String, dynamic> toJson() =>
      {"username": userName, "password": password, "rememberMe": rememberMe};
}
