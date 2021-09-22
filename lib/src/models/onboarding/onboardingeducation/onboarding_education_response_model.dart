import 'dart:convert';

import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';
import 'package:meta/meta.dart';

OnBoardingEducationResponseModel onBoardingEducationResponseModelFromJson(String str) =>
    OnBoardingEducationResponseModel.fromJson(json.decode(str));

String onBoardingEducationResponseModelToJson(OnBoardingEducationResponseModel data) =>
    json.encode(data.toJson());

class OnBoardingEducationResponseModel {
  OnBoardingEducationResponseModel({
    @required this.education,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<OnBoardingEducationData> education;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory OnBoardingEducationResponseModel.initial() {
    return OnBoardingEducationResponseModel(
        education: null, message: '', errors: null, isSuccessful: false);
  }

  factory OnBoardingEducationResponseModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingEducationResponseModel(
        education: json["Education"] == null
            ? null
            : List<OnBoardingEducationData>.from(json["Education"].map((x) => OnBoardingEducationData.fromJson(x))),
        message: json["message"] == null ? null : json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"] == null ? null : json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "Education":
            education == null ? null : List<dynamic>.from(education.map((x) => x.toJson())),
        "message": message == null ? null : message,
        "errors": errors,
        "isSuccessful": isSuccessful == null ? null : isSuccessful,
      };
}

class OnBoardingEducationData {
  OnBoardingEducationData({
    @required this.educationId,
    @required this.userId,
    @required this.schoolName,
    @required this.degree,
    @required this.fieldOfStudy,
    @required this.startMonthAndYearDate,
    @required this.endMonthAndYearDate,
    @required this.grade,
    @required this.activitiesAndSocieties,
    @required this.description,
    @required this.fileOrDocumentResponse,
  });

  String educationId;
  String userId;
  String schoolName;
  String degree;
  String fieldOfStudy;
  DateTime startMonthAndYearDate;
  DateTime endMonthAndYearDate;
  String grade;
  String activitiesAndSocieties;
  String description;
  FileOrDocumentInformationResponse fileOrDocumentResponse;

  factory OnBoardingEducationData.fromJson(Map<String, dynamic> json) => OnBoardingEducationData(
        educationId: json["educationId"] == null ? null : json["educationId"],
        userId: json["userId"] == null ? null : json["userId"],
        schoolName: json["schoolName"] == null ? null : json["schoolName"],
        degree: json["degree"] == null ? null : json["degree"],
        fieldOfStudy: json["fieldOfStudy"] == null ? null : json["fieldOfStudy"],
        startMonthAndYearDate: json["startMonthAndYearDate"] == null
            ? null
            : DateTime.parse(json["startMonthAndYearDate"]),
        endMonthAndYearDate: json["endMonthAndYearDate"] == null
            ? null
            : DateTime.parse(json["endMonthAndYearDate"]),
        grade: json["grade"] == null ? null : json["grade"],
        activitiesAndSocieties:
            json["activitiesAndSocieties"] == null ? null : json["activitiesAndSocieties"],
        description: json["description"] == null ? null : json["description"],
        fileOrDocumentResponse: json["fileOrDocumentResponse"] != null
            ? FileOrDocumentInformationResponse.fromJson(json["fileOrDocumentResponse"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "educationId": educationId == null ? null : educationId,
        "userId": userId == null ? null : userId,
        "schoolName": schoolName == null ? null : schoolName,
        "degree": degree == null ? null : degree,
        "fieldOfStudy": fieldOfStudy == null ? null : fieldOfStudy,
        "startMonthAndYearDate":
            startMonthAndYearDate == null ? null : startMonthAndYearDate.toIso8601String(),
        "endMonthAndYearDate":
            endMonthAndYearDate == null ? null : endMonthAndYearDate.toIso8601String(),
        "grade": grade == null ? null : grade,
        "activitiesAndSocieties": activitiesAndSocieties == null ? null : activitiesAndSocieties,
        "description": description == null ? null : description,
        "fileOrDocumentResponse": fileOrDocumentResponse,
      };
}
