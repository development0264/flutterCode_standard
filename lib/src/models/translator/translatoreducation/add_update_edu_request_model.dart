import 'dart:convert';

import 'package:meta/meta.dart';

AddUpdateEducationRequestModel addUpdateEducationRequestModelFromJson(String str) =>
    AddUpdateEducationRequestModel.fromJson(json.decode(str));

String addUpdateEducationRequestModelToJson(AddUpdateEducationRequestModel data) =>
    json.encode(data?.educationId?.isEmpty == true ? data.toJsonWithoutId() : data.toJson());

class AddUpdateEducationRequestModel {
  AddUpdateEducationRequestModel({
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

  factory AddUpdateEducationRequestModel.fromJson(Map<String, dynamic> json) =>
      AddUpdateEducationRequestModel(
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

  Map<String, dynamic> toJsonWithoutId() => {
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
