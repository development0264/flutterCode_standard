import 'dart:convert';

import 'package:meta/meta.dart';

JobStatesResponseModel jobStatesResponseModelFromJson(String str) => JobStatesResponseModel.fromJson(json.decode(str));

String jobStatesResponseModelToJson(JobStatesResponseModel data) => json.encode(data.toJson());

class JobStatesResponseModel {
  JobStatesResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<PostJobStatesData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory JobStatesResponseModel.fromJson(Map<String, dynamic> json) => JobStatesResponseModel(
        data: List<PostJobStatesData>.from(json["data"].map((x) => PostJobStatesData.fromJson(x))),
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

  factory JobStatesResponseModel.initial() {
    return JobStatesResponseModel(data: null, message: null, errors: [], isSuccessful: false);
  }
}

class PostJobStatesData {
  PostJobStatesData({
    @required this.stateId,
    @required this.name,
    @required this.shortName,
    @required this.countryId,
  });

  String stateId;
  String name;
  String shortName;
  String countryId;

  factory PostJobStatesData.fromJson(Map<String, dynamic> json) => PostJobStatesData(
        stateId: json["stateId"],
        name: json["name"],
        shortName: json["shortName"],
        countryId: json["countryId"],
      );

  Map<String, dynamic> toJson() => {
        "stateId": stateId,
        "name": name,
        "shortName": shortName,
        "countryId": countryId,
      };
}
