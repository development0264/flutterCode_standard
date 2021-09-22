import 'dart:convert';

import 'package:meta/meta.dart';

OnBoardingAddressRequestModel onBoardingAddressRequestModelFromJson(String str) =>
    OnBoardingAddressRequestModel.fromJson(json.decode(str));

String onBoardingAddressRequestModelToJson(OnBoardingAddressRequestModel data) =>
    json.encode(data.toJson());

class OnBoardingAddressRequestModel {
  OnBoardingAddressRequestModel({
    this.addressId,
    @required this.userId,
    @required this.line1,
    @required this.line2,
    @required this.city,
    @required this.state,
    @required this.zipCode,
    @required this.country,
    @required this.serviceIds,
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
  List<String> serviceIds;
  String ratePerHour;
  String ratePerPage;
  String ratePerMileOrKm;
  String about;

  factory OnBoardingAddressRequestModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingAddressRequestModel(
        addressId: json["addressId"],
        userId: json["userId"],
        line1: json["line1"],
        line2: json["line2"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
        country: json["country"],
        serviceIds: List<String>.from(json["serviceIds"].map((x) => x)),
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
        "serviceIds": List<dynamic>.from(serviceIds.map((x) => x)),
        "ratePerHour": ratePerHour,
        "ratePerPage": ratePerPage,
        "ratePerMileOrKm": ratePerMileOrKm,
        "about": about,
      };
}
