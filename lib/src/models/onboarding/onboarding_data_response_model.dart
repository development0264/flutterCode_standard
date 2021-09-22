import 'dart:convert';

import 'package:khontext/src/models/onboarding/onboardingaddress/onboarding_address_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/onboarding_education_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/onboarding_experience_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/onboarding_add_lang_response_model.dart';
import 'package:meta/meta.dart';

OnBoardingDataResponseModel onBoardingDataResponseModelFromJson(String str) =>
    OnBoardingDataResponseModel.fromJson(json.decode(str));

String onBoardingDataResponseModelToJson(OnBoardingDataResponseModel data) =>
    json.encode(data.toJson());

class OnBoardingDataResponseModel {
  OnBoardingDataResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  OnBoardingData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory OnBoardingDataResponseModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingDataResponseModel(
        data: OnBoardingData.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory OnBoardingDataResponseModel.initial() {
    return OnBoardingDataResponseModel(data: null, message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class OnBoardingData {
  OnBoardingData({
    @required this.addressAndServices,
    @required this.language,
    @required this.education,
    @required this.experience,
    @required this.identification,
  });

  OnBoardingAddressData addressAndServices;
  List<AddLanguageResponseData> language;
  List<OnBoardingEducationData> education;
  OnBoardingExperienceData experience;
  dynamic identification;

  factory OnBoardingData.fromJson(Map<String, dynamic> json) => OnBoardingData(
        addressAndServices: OnBoardingAddressData.fromJson(json["addressAndServices"]),
        language: json["language"] != null
            ? List<AddLanguageResponseData>.from(
                json["language"].map((x) => AddLanguageResponseData.fromJson(x)))
            : [],
        education: json["education"] != null
            ? List<OnBoardingEducationData>.from(
                json["education"].map((x) => OnBoardingEducationData.fromJson(x)))
            : [],
        experience: json["experience"] != null
            ? OnBoardingExperienceData.fromJson(json["experience"])
            : null,
        identification: json["identification"],
      );

  Map<String, dynamic> toJson() => {
        "addressAndServices": addressAndServices.toJson(),
        "language": language,
        "education": education,
        "experience": experience,
        "identification": identification,
      };
}
