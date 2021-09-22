import 'package:flutter/material.dart';

class TranslatorProfileModel {
  final String firstName;
  final String lastName;
  final String email;
  final String taxId;
  final String phoneNumber;
  final String country;
  final String zipCode;
  final String address;
  final String addressLine2;
  final String city;
  final String state;
  final dynamic timeZone;
  final String countryCode;
  final String imageUrl;

  TranslatorProfileModel({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.taxId,
    @required this.phoneNumber,
    @required this.country,
    @required this.zipCode,
    @required this.address,
    @required this.addressLine2,
    @required this.city,
    @required this.state,
    @required this.timeZone,
    @required this.countryCode,
    @required this.imageUrl,
  });

  factory TranslatorProfileModel.initial() {
    return TranslatorProfileModel(
      firstName: '',
      lastName: '',
      email: '',
      taxId: '',
      phoneNumber: '',
      country: '',
      zipCode: '',
      address: '',
      addressLine2: '',
      city: '',
      state: '',
      timeZone: '',
      countryCode: '',
      imageUrl: '',
    );
  }
}
