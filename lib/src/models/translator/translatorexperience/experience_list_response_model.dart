import 'dart:convert';

import 'package:meta/meta.dart';

ExperienceListResponseModel experienceListResponseModelFromJson(String str) =>
    ExperienceListResponseModel.fromJson(json.decode(str));

String experienceListResponseModelToJson(ExperienceListResponseModel data) =>
    json.encode(data.toJson());

class ExperienceListResponseModel {
  ExperienceListResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<ExperienceData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory ExperienceListResponseModel.fromJson(Map<String, dynamic> json) =>
      ExperienceListResponseModel(
        data: List<ExperienceData>.from(json["data"].map((x) => ExperienceData.fromJson(x))),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory ExperienceListResponseModel.initial() {
    return ExperienceListResponseModel(data: null, message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class ExperienceData {
  ExperienceData({
    @required this.experienceId,
    @required this.company,
    @required this.location,
    @required this.fromDate,
    @required this.toDate,
    @required this.isCurrentWorkingHere,
    @required this.description,
    @required this.employmentTypeId,
    @required this.userId,
  });

  String experienceId;
  String company;
  String location;
  DateTime fromDate;
  DateTime toDate;
  bool isCurrentWorkingHere;
  String description;
  String employmentTypeId;
  String userId;

  factory ExperienceData.fromJson(Map<String, dynamic> json) => ExperienceData(
        experienceId: json["experienceId"],
        company: json["company"],
        location: json["location"],
        fromDate: DateTime.parse(json["fromDate"]),
        toDate: DateTime.parse(json["toDate"]),
        isCurrentWorkingHere: json["isCurrentWorkingHere"],
        description: json["description"],
        employmentTypeId: json["employmentTypeId"],
        userId: json["userId"],
      );

  factory ExperienceData.initial() {
    return ExperienceData(
      experienceId: '',
      company: '',
      location: '',
      fromDate: DateTime.now(),
      toDate: DateTime.now(),
      isCurrentWorkingHere: false,
      description: '',
      employmentTypeId: '',
      userId: '',
    );
  }

  Map<String, dynamic> toJson() => {
        "experienceId": experienceId,
        "company": company,
        "location": location,
        "fromDate": fromDate.toIso8601String(),
        "toDate": toDate.toIso8601String(),
        "isCurrentWorkingHere": isCurrentWorkingHere,
        "description": description,
        "employmentTypeId": employmentTypeId,
        "userId": userId,
      };
}
