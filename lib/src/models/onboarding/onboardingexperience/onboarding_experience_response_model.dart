import 'dart:convert';

import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/employment_type_response.dart';
import 'package:meta/meta.dart';

OnBoardingExperienceResponseModel onBoardingExperienceResponseModelFromJson(String str) =>
    OnBoardingExperienceResponseModel.fromJson(json.decode(str));

String onBoardingExperienceResponseModelToJson(OnBoardingExperienceResponseModel data) =>
    json.encode(data.toJson());

class OnBoardingExperienceResponseModel {
  OnBoardingExperienceResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  OnBoardingExperienceData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory OnBoardingExperienceResponseModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingExperienceResponseModel(
        data: OnBoardingExperienceData.fromJson(json["data"]),
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

class OnBoardingExperienceData {
  OnBoardingExperienceData({
    @required this.userId,
    @required this.onboardExperienceResponse,
    @required this.fileOrDocumentResponse,
  });

  String userId;
  List<OnboardExperienceResponse> onboardExperienceResponse;
  FileOrDocumentInformationResponse fileOrDocumentResponse;

  factory OnBoardingExperienceData.fromJson(Map<String, dynamic> json) => OnBoardingExperienceData(
        userId: json["userId"],
        onboardExperienceResponse: List<OnboardExperienceResponse>.from(
            json["onboardExperienceResponse"].map((x) => OnboardExperienceResponse.fromJson(x))),
        fileOrDocumentResponse:
            FileOrDocumentInformationResponse.fromJson(json["fileOrDocumentResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "onboardExperienceResponse":
            List<dynamic>.from(onboardExperienceResponse.map((x) => x.toJson())),
        "fileOrDocumentResponse": fileOrDocumentResponse.toJson(),
      };
}

class OnboardExperienceResponse {
  OnboardExperienceResponse({
    @required this.experienceId,
    @required this.company,
    @required this.location,
    @required this.fromDate,
    @required this.toDate,
    @required this.isCurrentWorkingHere,
    @required this.description,
    @required this.title,
    @required this.employmentTypesResponse,
    @required this.employerPhoneNumber,
    @required this.employerEmail,
    @required this.isEmployerContact,
  });

  String experienceId;
  String company;
  String location;
  DateTime fromDate;
  DateTime toDate;
  bool isCurrentWorkingHere;
  String description;
  String title;
  EmploymentTypeData employmentTypesResponse;
  String employerPhoneNumber;
  String employerEmail;
  bool isEmployerContact;

  factory OnboardExperienceResponse.fromJson(Map<String, dynamic> json) =>
      OnboardExperienceResponse(
        experienceId: json["experienceId"],
        company: json["company"],
        location: json["location"],
        fromDate: DateTime.parse(json["fromDate"]),
        toDate: DateTime.parse(json["toDate"]),
        isCurrentWorkingHere: json["isCurrentWorkingHere"],
        description: json["description"],
        title: json["title"],
        employmentTypesResponse: EmploymentTypeData.fromJson(json["employmentTypesResponse"]),
        employerPhoneNumber: json["employerPhoneNumber"],
        employerEmail: json["employerEmail"],
        isEmployerContact: json["isEmployerContact"],
      );

  Map<String, dynamic> toJson() => {
        "experienceId": experienceId,
        "company": company,
        "location": location,
        "fromDate": fromDate.toIso8601String(),
        "toDate": toDate.toIso8601String(),
        "isCurrentWorkingHere": isCurrentWorkingHere,
        "description": description,
        "title": title,
        "employmentTypesResponse": employmentTypesResponse.toJson(),
        "employerPhoneNumber": employerPhoneNumber,
        "employerEmail": employerEmail,
        "isEmployerContact": isEmployerContact,
      };
}
