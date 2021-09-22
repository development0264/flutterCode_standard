import 'dart:convert';

import 'package:meta/meta.dart';

OnBoardingExperienceRequestModel onBoardingExperienceRequestModelFromJson(String str) =>
    OnBoardingExperienceRequestModel.fromJson(json.decode(str));

String onBoardingExperienceRequestModelToJson(OnBoardingExperienceRequestModel data) =>
    json.encode(data.toJson());

class OnBoardingExperienceRequestModel {
  OnBoardingExperienceRequestModel({
    @required this.userId,
    @required this.fileOrDocumentId,
    @required this.experienceRequest,
  });

  String userId;
  String fileOrDocumentId;
  List<OnBoardingExperienceRequestData> experienceRequest;

  factory OnBoardingExperienceRequestModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingExperienceRequestModel(
        userId: json["userId"],
        fileOrDocumentId: json["fileOrDocumentId"],
        experienceRequest: List<OnBoardingExperienceRequestData>.from(
            json["experienceRequest"].map((x) => OnBoardingExperienceRequestData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fileOrDocumentId": fileOrDocumentId,
        "experienceRequest": List<dynamic>.from(experienceRequest
            .map((x) => x?.experienceId?.isNotEmpty == true ? x.toJson() : x.toJsonWithoutId())),
      };
}

class OnBoardingExperienceRequestData {
  OnBoardingExperienceRequestData({
    @required this.experienceId,
    @required this.company,
    @required this.location,
    @required this.fromDate,
    @required this.toDate,
    @required this.isCurrentWorkingHere,
    @required this.description,
    @required this.title,
    @required this.employmentTypeId,
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
  String employmentTypeId;
  String employerPhoneNumber;
  String employerEmail;
  bool isEmployerContact;

  factory OnBoardingExperienceRequestData.fromJson(Map<String, dynamic> json) =>
      OnBoardingExperienceRequestData(
        experienceId: json["experienceId"],
        company: json["company"],
        location: json["location"],
        fromDate: DateTime.parse(json["fromDate"]),
        toDate: DateTime.parse(json["toDate"]),
        isCurrentWorkingHere: json["isCurrentWorkingHere"],
        description: json["description"],
        title: json["title"],
        employmentTypeId: json["employmentTypeId"],
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
        "employmentTypeId": employmentTypeId,
        "employerPhoneNumber": employerPhoneNumber,
        "employerEmail": employerEmail,
        "isEmployerContact": isEmployerContact,
      };

  Map<String, dynamic> toJsonWithoutId() => {
        "company": company,
        "location": location,
        "fromDate": fromDate.toIso8601String(),
        "toDate": toDate.toIso8601String(),
        "isCurrentWorkingHere": isCurrentWorkingHere,
        "description": description,
        "title": title,
        "employmentTypeId": employmentTypeId,
        "employerPhoneNumber": employerPhoneNumber,
        "employerEmail": employerEmail,
        "isEmployerContact": isEmployerContact,
      };
}
