import 'package:meta/meta.dart';
import 'dart:convert';

OnBoardingAddressResponseModel onBoardingAddressResponseModelFromJson(String str) => OnBoardingAddressResponseModel.fromJson(json.decode(str));

String onBoardingAddressResponseModelToJson(OnBoardingAddressResponseModel data) => json.encode(data.toJson());

class OnBoardingAddressResponseModel {
  OnBoardingAddressResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  OnBoardingAddressData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory OnBoardingAddressResponseModel.fromJson(Map<String, dynamic> json) => OnBoardingAddressResponseModel(
    data: OnBoardingAddressData.fromJson(json["data"]),
    message: json["message"],
    errors: json["errors"],
    isSuccessful: json["isSuccessful"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "errors": errors,
    "isSuccessful": isSuccessful,
  };
}

class OnBoardingAddressData {
  OnBoardingAddressData({
    @required this.addressId,
    @required this.userId,
    @required this.line1,
    @required this.line2,
    @required this.city,
    @required this.state,
    @required this.zipCode,
    @required this.country,
    @required this.services,
    @required this.ratePerHour,
    @required this.ratePerPage,
    @required this.ratePerMileOrKm,
    @required this.about,
  });

  String addressId;
  String userId;
  String line1;
  String line2;
  String city;
  String state;
  String zipCode;
  String country;
  List<OnBoardingServiceData> services;
  String ratePerHour;
  String ratePerPage;
  String ratePerMileOrKm;
  String about;

  factory OnBoardingAddressData.fromJson(Map<String, dynamic> json) => OnBoardingAddressData(
    addressId: json["addressId"],
    userId: json["userId"],
    line1: json["line1"],
    line2: json["line2"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zipCode"],
    country: json["country"],
    services: List<OnBoardingServiceData>.from(json["services"].map((x) => OnBoardingServiceData.fromJson(x))),
    ratePerHour: json["ratePerHour"],
    ratePerPage: json["ratePerPage"],
    ratePerMileOrKm: json["ratePerMileOrKm"],
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "addressId": addressId,
    "userId": userId,
    "line1": line1,
    "line2": line2,
    "city": city,
    "state": state,
    "zipCode": zipCode,
    "country": country,
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
    "ratePerHour": ratePerHour,
    "ratePerPage": ratePerPage,
    "ratePerMileOrKm": ratePerMileOrKm,
    "about": about,
  };
}

class OnBoardingServiceData {
  OnBoardingServiceData({
    @required this.onboardQuizServiceId,
    @required this.name,
    @required this.code,
    @required this.description,
  });

  String onboardQuizServiceId;
  String name;
  String code;
  String description;

  factory OnBoardingServiceData.fromJson(Map<String, dynamic> json) => OnBoardingServiceData(
    onboardQuizServiceId: json["onboardQuizServiceId"],
    name: json["name"],
    code: json["code"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "onboardQuizServiceId": onboardQuizServiceId,
    "name": name,
    "code": code,
    "description": description,
  };
}
