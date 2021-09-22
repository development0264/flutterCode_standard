import 'package:meta/meta.dart';
import 'dart:convert';

CreateStripeAccountRequestModel createStripeAccountRequestModelFromJson(String str) => CreateStripeAccountRequestModel.fromJson(json.decode(str));

String createStripeAccountRequestModelToJson(CreateStripeAccountRequestModel data) => json.encode(data.toJson());

class CreateStripeAccountRequestModel {
  CreateStripeAccountRequestModel({
    @required this.userId,
    @required this.externalAccountSource,
    @required this.externalSourceType,
    @required this.country,
    @required this.email,
    @required this.addressId,
    @required this.identificationDocument,
    @required this.dateOfBirth,
    @required this.ssnNumber,
    @required this.ipAddress,
  });

  String userId;
  String externalAccountSource;
  String externalSourceType;
  String country;
  String email;
  String addressId;
  String identificationDocument;
  DateOfBirth dateOfBirth;
  String ssnNumber;
  String ipAddress;

  factory CreateStripeAccountRequestModel.fromJson(Map<String, dynamic> json) => CreateStripeAccountRequestModel(
    userId: json["userId"],
    externalAccountSource: json["externalAccountSource"],
    externalSourceType: json["externalSourceType"],
    country: json["country"],
    email: json["email"],
    addressId: json["addressId"],
    identificationDocument: json["identificationDocument"],
    dateOfBirth: DateOfBirth.fromJson(json["dateOfBirth"]),
    ssnNumber: json["ssnNumber"],
    ipAddress: json["ipAddress"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "externalAccountSource": externalAccountSource,
    "externalSourceType": externalSourceType,
    "country": country,
    "email": email,
    "addressId": addressId,
    "identificationDocument": identificationDocument,
    "dateOfBirth": dateOfBirth.toJson(),
    "ssnNumber": ssnNumber,
    "ipAddress": ipAddress,
  };
}

class DateOfBirth {
  DateOfBirth({
    @required this.day,
    @required this.month,
    @required this.year,
  });

  int day;
  int month;
  int year;

  factory DateOfBirth.fromJson(Map<String, dynamic> json) => DateOfBirth(
    day: json["day"],
    month: json["month"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "month": month,
    "year": year,
  };
}