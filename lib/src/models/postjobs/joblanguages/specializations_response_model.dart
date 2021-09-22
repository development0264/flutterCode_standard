import 'package:meta/meta.dart';
import 'dart:convert';

SpecializationsResponseModel specializationsResponseModelFromJson(String str) => SpecializationsResponseModel.fromJson(json.decode(str));

String specializationsResponseModelToJson(SpecializationsResponseModel data) => json.encode(data.toJson());

class SpecializationsResponseModel {
  SpecializationsResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<SpecializationsData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory SpecializationsResponseModel.fromJson(Map<String, dynamic> json) => SpecializationsResponseModel(
    data: List<SpecializationsData>.from(json["data"].map((x) => SpecializationsData.fromJson(x))),
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

  factory SpecializationsResponseModel.initial() {
    return SpecializationsResponseModel(data: [], message: null, errors: [], isSuccessful: false);
  }
}

class SpecializationsData {
  SpecializationsData({
    @required this.specializationId,
    @required this.name,
    @required this.code,
    @required this.description,
  });

  String specializationId;
  String name;
  String code;
  String description;

  factory SpecializationsData.fromJson(Map<String, dynamic> json) => SpecializationsData(
    specializationId: json["specializationId"],
    name: json["name"],
    code: json["code"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "specializationId": specializationId,
    "name": name,
    "code": code,
    "description": description,
  };
}
