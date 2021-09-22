import 'dart:convert';

import 'package:meta/meta.dart';

EducationListResponseModel educationListResponseModelFromJson(String str) =>
    EducationListResponseModel.fromJson(json.decode(str));

String educationListResponseModelToJson(EducationListResponseModel data) =>
    json.encode(data.toJson());

class EducationListResponseModel {
  EducationListResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<EducationData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory EducationListResponseModel.fromJson(Map<String, dynamic> json) =>
      EducationListResponseModel(
        data: List<EducationData>.from(json["data"].map((x) => EducationData.fromJson(x))),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class EducationData {
  EducationData({
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

  factory EducationData.initial() {
    return EducationData(
      educationId: '',
      userId: '',
      schoolName: '',
      degree: '',
      fieldOfStudy: '',
      startMonthAndYearDate: DateTime.now(),
      endMonthAndYearDate: DateTime.now(),
      grade: '',
      activitiesAndSocieties: '',
      description: '',
    );
  }

  factory EducationData.fromJson(Map<String, dynamic> json) => EducationData(
        educationId: json["educationId"],
        userId: json["userId"],
        schoolName: json["schoolName"],
        degree: json["degree"],
        fieldOfStudy: json["fieldOfStudy"],
        startMonthAndYearDate: DateTime.parse(json["startMonthAndYearDate"]),
        endMonthAndYearDate: DateTime.parse(json["endMonthAndYearDate"]),
        grade: json["grade"],
        activitiesAndSocieties: json["activitiesAndSocieties"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "educationId": educationId,
        "userId": userId,
        "schoolName": schoolName,
        "degree": degree,
        "fieldOfStudy": fieldOfStudy,
        "startMonthAndYearDate": startMonthAndYearDate.toIso8601String(),
        "endMonthAndYearDate": endMonthAndYearDate.toIso8601String(),
        "grade": grade,
        "activitiesAndSocieties": activitiesAndSocieties,
        "description": description,
      };
}
