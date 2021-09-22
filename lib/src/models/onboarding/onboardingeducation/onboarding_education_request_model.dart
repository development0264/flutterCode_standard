import 'dart:convert';

import 'package:meta/meta.dart';

List<OnBoardingEducationRequestModel> onBoardingEducationRequestModelFromJson(String str) =>
    List<OnBoardingEducationRequestModel>.from(
        json.decode(str).map((x) => OnBoardingEducationRequestModel.fromJson(x)));

String onBoardingEducationRequestModelToJson(List<OnBoardingEducationRequestModel> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => x?.educationId?.isNotEmpty == true ? x.toJson() : x.toJsonAdd())));

class OnBoardingEducationRequestModel {
  OnBoardingEducationRequestModel({
    this.educationId,
    @required this.userId,
    @required this.schoolName,
    @required this.degree,
    @required this.fieldOfStudy,
    @required this.startMonthAndYearDate,
    @required this.endMonthAndYearDate,
    @required this.grade,
    @required this.activitiesAndSocieties,
    @required this.description,
    @required this.fileOrDocumentId,
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
  String fileOrDocumentId;

  factory OnBoardingEducationRequestModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingEducationRequestModel(
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
        fileOrDocumentId: json["fileOrDocumentId"] == null ? null : json["fileOrDocumentId"],
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
        "fileOrDocumentId": fileOrDocumentId == null ? null : fileOrDocumentId,
      };

  Map<String, dynamic> toJsonAdd() => {
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
        "fileOrDocumentId": fileOrDocumentId == null ? null : fileOrDocumentId,
      };
}
