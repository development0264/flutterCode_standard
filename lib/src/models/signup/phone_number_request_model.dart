import 'package:meta/meta.dart';
import 'dart:convert';

PhoneNumberRequestModel phoneNumberRequestModelFromJson(String str) => PhoneNumberRequestModel.fromJson(json.decode(str));

String phoneNumberRequestModelToJson(PhoneNumberRequestModel data) => json.encode(data.toJson());

class PhoneNumberRequestModel {
  PhoneNumberRequestModel({
    @required this.countryCode,
    @required this.phoneNumber,
  });

  String countryCode;
  String phoneNumber;

  factory PhoneNumberRequestModel.fromJson(Map<String, dynamic> json) => PhoneNumberRequestModel(
    countryCode: json["countryCode"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "phoneNumber": phoneNumber,
  };
}
