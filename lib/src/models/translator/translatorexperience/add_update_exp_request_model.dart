import 'dart:convert';

import 'package:meta/meta.dart';

AddUpdateExperienceRequestModel addUpdateExperienceRequestModelFromJson(String str) =>
    AddUpdateExperienceRequestModel.fromJson(json.decode(str));

String addUpdateExperienceRequestModelToJson(AddUpdateExperienceRequestModel data) =>
    json.encode(data?.experienceId?.isEmpty == true ? data.toJsonWithoutId() : data.toJson());

class AddUpdateExperienceRequestModel {
  AddUpdateExperienceRequestModel({
    this.experienceId,
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

  factory AddUpdateExperienceRequestModel.fromJson(Map<String, dynamic> json) =>
      AddUpdateExperienceRequestModel(
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

  Map<String, dynamic> toJsonWithoutId() => {
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
