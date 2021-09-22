import 'dart:convert';

import 'package:meta/meta.dart';

EmploymentTypeResponseModel employmentTypeResponseModelFromJson(String str) =>
    EmploymentTypeResponseModel.fromJson(json.decode(str));

String employmentTypeResponseModelToJson(EmploymentTypeResponseModel data) =>
    json.encode(data.toJson());

class EmploymentTypeResponseModel {
  EmploymentTypeResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<EmploymentTypeData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory EmploymentTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      EmploymentTypeResponseModel(
        data:
            List<EmploymentTypeData>.from(json["data"].map((x) => EmploymentTypeData.fromJson(x))),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory EmploymentTypeResponseModel.initial() {
    return EmploymentTypeResponseModel(
        data: null, message: 'message', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class EmploymentTypeData {
  EmploymentTypeData({
    @required this.employmentTypeId,
    @required this.name,
    @required this.code,
    @required this.description,
  });

  String employmentTypeId;
  String name;
  String code;
  String description;

  factory EmploymentTypeData.fromJson(Map<String, dynamic> json) => EmploymentTypeData(
        employmentTypeId: json["employmentTypeId"],
        name: json["name"],
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "employmentTypeId": employmentTypeId,
        "name": name,
        "code": code,
        "description": description,
      };
}
