import 'dart:convert';

ForgetPasswordRequestModel forgetPasswordRequestModelFromJson(String str) =>
    ForgetPasswordRequestModel.fromJson(json.decode(str));

String forgetPasswordRequestModelToJson(ForgetPasswordRequestModel data) =>
    json.encode(data?.email?.isNotEmpty == true ? data.toEmailJson() : data.toPhoneJson());

class ForgetPasswordRequestModel {
  ForgetPasswordRequestModel({this.email, this.countryCode, this.phoneNumber});

  String email;
  String countryCode;
  String phoneNumber;

  factory ForgetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordRequestModel(
        email: json["email"],
        countryCode: json["countryCode"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toEmailJson() => {"email": email};

  Map<String, dynamic> toPhoneJson() => {"countryCode": countryCode, "phoneNumber": phoneNumber};
}
