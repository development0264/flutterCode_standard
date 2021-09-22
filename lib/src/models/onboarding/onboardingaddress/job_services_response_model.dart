import 'dart:convert';

import 'package:meta/meta.dart';

JobServicesResponseModel jobServicesResponseModelFromJson(String str) =>
    JobServicesResponseModel.fromJson(json.decode(str));

String jobServicesResponseModelToJson(JobServicesResponseModel data) => json.encode(data.toJson());

class JobServicesResponseModel {
  JobServicesResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<JobServicesData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory JobServicesResponseModel.fromJson(Map<String, dynamic> json) => JobServicesResponseModel(
        data: List<JobServicesData>.from(json["data"].map((x) => JobServicesData.fromJson(x))),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory JobServicesResponseModel.initial() {
    return JobServicesResponseModel(data: [], message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class JobServicesData {
  JobServicesData({
    @required this.onboardQuizServiceId,
    @required this.name,
    @required this.code,
    @required this.description,
  });

  String onboardQuizServiceId;
  String name;
  String code;
  String description;

  factory JobServicesData.fromJson(Map<String, dynamic> json) => JobServicesData(
        onboardQuizServiceId: json["onboardQuizServiceId"],
        name: json["name"],
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "onboardQuizServiceId": onboardQuizServiceId,
        "name": name,
        "code": code,
        "description": description,
      };
}
