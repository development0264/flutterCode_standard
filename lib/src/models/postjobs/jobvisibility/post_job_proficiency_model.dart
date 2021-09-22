import 'package:meta/meta.dart';
import 'dart:convert';

ProficiencyResponseModel jobProficiencyResponseModelFromJson(String str) => ProficiencyResponseModel.fromJson(json.decode(str));

String jobProficiencyResponseModelToJson(ProficiencyResponseModel data) => json.encode(data.toJson());

class ProficiencyResponseModel {
  ProficiencyResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<ProficiencyData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory ProficiencyResponseModel.fromJson(Map<String, dynamic> json) => ProficiencyResponseModel(
    data: List<ProficiencyData>.from(json["data"].map((x) => ProficiencyData.fromJson(x))),
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

  factory ProficiencyResponseModel.initial() {
    return ProficiencyResponseModel(data: [], message: null, errors: [], isSuccessful: false);
  }
}

class ProficiencyData {
  ProficiencyData({
    @required this.specializationId,
    @required this.proficiencyLevelId,
    @required this.name,
    @required this.code,
    @required this.description,
  });

  String specializationId;
  String proficiencyLevelId;
  String name;
  String code;
  String description;

  factory ProficiencyData.fromJson(Map<String, dynamic> json) => ProficiencyData(
    specializationId: json["specializationId"] == null ? null : json["specializationId"],
    proficiencyLevelId: json["proficiencyLevelId"] == null ? null : json["proficiencyLevelId"],
    name: json["name"],
    code: json["code"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "specializationId": specializationId == null ? null : specializationId,
    "proficiencyLevelId": proficiencyLevelId == null ? null : proficiencyLevelId,
    "name": name,
    "code": code,
    "description": description,
  };
}
