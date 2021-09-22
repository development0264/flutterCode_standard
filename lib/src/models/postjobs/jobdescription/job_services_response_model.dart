import 'package:meta/meta.dart';
import 'dart:convert';

PostJobServicesResponseModel jobServicesResponseModelFromJson(String str) => PostJobServicesResponseModel.fromJson(json.decode(str));

String jobServicesResponseModelToJson(PostJobServicesResponseModel data) => json.encode(data.toJson());

class PostJobServicesResponseModel {
  PostJobServicesResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<JobServicesData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory PostJobServicesResponseModel.fromJson(Map<String, dynamic> json) => PostJobServicesResponseModel(
    data: json["data"] == null ? null : List<JobServicesData>.from(json["data"].map((x) => JobServicesData.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    errors: json["errors"],
    isSuccessful: json["isSuccessful"] == null ? null : json["isSuccessful"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "errors": errors,
    "isSuccessful": isSuccessful == null ? null : isSuccessful,
  };

  factory PostJobServicesResponseModel.initial(){
    return PostJobServicesResponseModel(data: null, message: null, errors: [], isSuccessful: false);
  }
}

class JobServicesData {
  JobServicesData({
    @required this.serviceTypeId,
    @required this.name,
    @required this.code,
    @required this.description,
    @required this.services,
    @required this.serviceId,
  });

  String serviceTypeId;
  String name;
  String code;
  String description;
  List<JobServicesData> services;
  String serviceId;

  factory JobServicesData.fromJson(Map<String, dynamic> json) => JobServicesData(
    serviceTypeId: json["serviceTypeId"] == null ? null : json["serviceTypeId"],
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    description: json["description"] == null ? null : json["description"],
    services: json["services"] == null ? null : List<JobServicesData>.from(json["services"].map((x) => JobServicesData.fromJson(x))),
    serviceId: json["serviceId"] == null ? null : json["serviceId"],
  );

  Map<String, dynamic> toJson() => {
    "serviceTypeId": serviceTypeId == null ? null : serviceTypeId,
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "description": description == null ? null : description,
    "services": services == null ? null : List<dynamic>.from(services.map((x) => x.toJson())),
    "serviceId": serviceId == null ? null : serviceId,
  };
}
