import 'dart:convert';

AddressReturnModel addressReturnModelFromJson(String str) => AddressReturnModel.fromJson(json.decode(str));

String addressReturnModelToJson(AddressReturnModel data) => json.encode(data.toJson());

class AddressReturnModel {
  AddressReturnModel({
    this.streetNumber,
    this.streetRoute,
    this.subLocality3,
    this.subLocality2,
    this.subLocality1,
    this.locality,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.selectedTimeZone,
  });

  String streetNumber;
  String streetRoute;
  String subLocality3;
  String subLocality2;
  String subLocality1;
  String locality;
  String city;
  String state;
  String country;
  String postalCode;
  String selectedTimeZone;

  factory AddressReturnModel.fromJson(Map<String, dynamic> json) => AddressReturnModel(
    streetNumber: json["streetNumber"],
    streetRoute: json["streetRoute"],
    subLocality3: json["subLocality3"],
    subLocality2: json["subLocality2"],
    subLocality1: json["subLocality1"],
    locality: json["locality"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    postalCode: json["postalCode"],
    selectedTimeZone: json["selectedTimeZone"],
  );

  Map<String, dynamic> toJson() => {
    "streetNumber": streetNumber,
    "streetRoute": streetRoute,
    "subLocality3": subLocality3,
    "subLocality2": subLocality2,
    "subLocality1": subLocality1,
    "locality": locality,
    "city": city,
    "state": state,
    "country": country,
    "postalCode": postalCode,
    "selectedTimeZone": selectedTimeZone,
  };
}
