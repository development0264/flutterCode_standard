import 'dart:convert';

import 'package:meta/meta.dart';

ClientAddressResponseModel clientAddressResponseModelFromJson(String str) =>
    ClientAddressResponseModel.fromJson(json.decode(str));

String clientAddressResponseModelToJson(ClientAddressResponseModel data) => json.encode(data.toJson());

class ClientAddressResponseModel {
  ClientAddressResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  ClientAddressData data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory ClientAddressResponseModel.fromJson(Map<String, dynamic> json) => ClientAddressResponseModel(
        data: json["data"] == null ? null : ClientAddressData.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        errors: json["errors"] == null ? null : List<dynamic>.from(json["errors"].map((x) => x)),
        isSuccessful: json["isSuccessful"] == null ? null : json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
        "message": message == null ? null : message,
        "errors": errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
        "isSuccessful": isSuccessful == null ? null : isSuccessful,
      };

  factory ClientAddressResponseModel.initial() {
    return ClientAddressResponseModel(data: null, message: null, errors: null, isSuccessful: false);
  }
}

class ClientAddressData {
  ClientAddressData({
    @required this.addressId,
    @required this.streetNumber,
    @required this.streetName,
    @required this.line1,
    @required this.line2,
    @required this.addressType,
    @required this.city,
    @required this.county,
    @required this.zipCode,
    @required this.timezone,
    @required this.country,
  });

  String addressId;
  String streetNumber;
  String streetName;
  String line1;
  String line2;
  String addressType;
  String city;
  String county;
  String zipCode;
  String timezone;
  String country;

  factory ClientAddressData.fromJson(Map<String, dynamic> json) => ClientAddressData(
        addressId: json["addressId"] == null ? null : json["addressId"],
        streetNumber: json["streetNumber"] == null ? null : json["streetNumber"],
        streetName: json["streetName"] == null ? null : json["streetName"],
        line1: json["line1"] == null ? null : json["line1"],
        line2: json["line2"] == null ? null : json["line2"],
        addressType: json["addressType"] == null ? null : json["addressType"],
        city: json["city"] == null ? null : json["city"],
        county: json["county"] == null ? null : json["county"],
        zipCode: json["zipCode"] == null ? null : json["zipCode"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        country: json["country"] == null ? null : json["country"],
      );

  factory ClientAddressData.initial() {
    return ClientAddressData(
        addressId: '',
        streetNumber: '',
        streetName: '',
        line1: '',
        line2: '',
        addressType: '',
        city: '',
        county: '',
        zipCode: '',
        timezone: '',
        country: '');
  }

  Map<String, dynamic> toJson() => {
        "addressId": addressId == null ? null : addressId,
        "streetNumber": streetNumber == null ? null : streetNumber,
        "streetName": streetName == null ? null : streetName,
        "line1": line1 == null ? null : line1,
        "line2": line2 == null ? null : line2,
        "addressType": addressType == null ? null : addressType,
        "city": city == null ? null : city,
        "county": county == null ? null : county,
        "zipCode": zipCode == null ? null : zipCode,
        "timezone": timezone == null ? null : timezone,
        "country": country == null ? null : country,
      };
}
