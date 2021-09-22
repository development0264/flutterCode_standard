import 'package:meta/meta.dart';
import 'dart:convert';

UserAddResponseModel userAddResponseModelFromJson(String str) => UserAddResponseModel.fromJson(json.decode(str));

String userAddResponseModelToJson(UserAddResponseModel data) => json.encode(data.toJson());

class UserAddResponseModel {
  UserAddResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  UserResidenceData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory UserAddResponseModel.fromJson(Map<String, dynamic> json) => UserAddResponseModel(
    data: UserResidenceData.fromJson(json["data"]),
    message: json["message"],
    errors: json["errors"],
    isSuccessful: json["isSuccessful"],
  );

  factory UserAddResponseModel.initial(){
    return UserAddResponseModel(data: null, message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "errors": errors,
    "isSuccessful": isSuccessful,
  };
}

class UserResidenceData {
  UserResidenceData({
    @required this.userId,
    @required this.streetAddress,
    @required this.addressLine,
    @required this.city,
    @required this.stateProvinceRegion,
    @required this.postalCode,
    @required this.country,
  });

  String userId;
  String streetAddress;
  String addressLine;
  String city;
  String stateProvinceRegion;
  int postalCode;
  String country;

  factory UserResidenceData.fromJson(Map<String, dynamic> json) => UserResidenceData(
    userId: json["userId"],
    streetAddress: json["streetAddress"],
    addressLine: json["addressLine"],
    city: json["city"],
    stateProvinceRegion: json["stateProvinceRegion"],
    postalCode: json["postalCode"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "streetAddress": streetAddress,
    "addressLine": addressLine,
    "city": city,
    "stateProvinceRegion": stateProvinceRegion,
    "postalCode": postalCode,
    "country": country,
  };
}
