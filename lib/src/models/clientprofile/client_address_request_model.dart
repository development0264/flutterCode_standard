import 'dart:convert';

import 'package:flutter/material.dart';

String addressCreateRequestModelToJson(AddressCreateRequestModel data) =>
    json.encode(data?.addressId?.isNotEmpty == true ? data.toJson() : data.toJsonWithoutAddress());

class AddressCreateRequestModel {
  AddressCreateRequestModel({
    this.addressId,
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

  Map<String, dynamic> toJson() => {
        "addressId": addressId == null ? null : addressId,
        "StreetNumber": streetNumber == null ? null : streetNumber,
        "StreetName": streetName == null ? null : streetName,
        "Line1": line1 == null ? null : line1,
        "Line2": line2 == null ? null : line2,
        "AddressType": addressType == null ? null : addressType,
        "City": city == null ? null : city,
        "County": county == null ? null : county,
        "ZipCode": zipCode == null ? null : zipCode,
        "Timezone": timezone == null ? null : timezone,
        "Country": country == null ? null : country,
      };

  Map<String, dynamic> toJsonWithoutAddress() => {
        "StreetNumber": streetNumber == null ? null : streetNumber,
        "StreetName": streetName == null ? null : streetName,
        "Line1": line1 == null ? null : line1,
        "Line2": line2 == null ? null : line2,
        "AddressType": addressType == null ? null : addressType,
        "City": city == null ? null : city,
        "County": county == null ? null : county,
        "ZipCode": zipCode == null ? null : zipCode,
        "Timezone": timezone == null ? null : timezone,
        "Country": country == null ? null : country,
      };
}
