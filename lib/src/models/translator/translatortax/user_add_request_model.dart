import 'package:meta/meta.dart';
import 'dart:convert';

AddUserAddressRequestModel addUserAddressRequestModelFromJson(String str) => AddUserAddressRequestModel.fromJson(json.decode(str));

String addUserAddressRequestModelToJson(AddUserAddressRequestModel data) => json.encode(data.toJson());

class AddUserAddressRequestModel {
  AddUserAddressRequestModel({
    @required this.taxResidenceId,
    @required this.userId,
    @required this.streetAddress,
    @required this.addressLine,
    @required this.city,
    @required this.stateProvinceRegion,
    @required this.postalCode,
    @required this.country,
  });

  String taxResidenceId;
  String userId;
  String streetAddress;
  String addressLine;
  String city;
  String stateProvinceRegion;
  int postalCode;
  String country;

  factory AddUserAddressRequestModel.fromJson(Map<String, dynamic> json) => AddUserAddressRequestModel(
    taxResidenceId: json["taxResidenceId"],
    userId: json["userId"],
    streetAddress: json["streetAddress"],
    addressLine: json["addressLine"],
    city: json["city"],
    stateProvinceRegion: json["stateProvinceRegion"],
    postalCode: json["postalCode"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "taxResidenceId": taxResidenceId,
    "userId": userId,
    "streetAddress": streetAddress,
    "addressLine": addressLine,
    "city": city,
    "stateProvinceRegion": stateProvinceRegion,
    "postalCode": postalCode,
    "country": country,
  };
}
