import 'dart:convert';

import 'package:khontext/src/models/translator/translatorexperience/experience_list_response_model.dart';
import 'package:meta/meta.dart';

AddUpdateExperienceResponseModel addUpdateExperienceResponseModelFromJson(String str) =>
    AddUpdateExperienceResponseModel.fromJson(json.decode(str));

String addUpdateExperienceResponseModelToJson(AddUpdateExperienceResponseModel data) =>
    json.encode(data.toJson());

class AddUpdateExperienceResponseModel {
  AddUpdateExperienceResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  ExperienceData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory AddUpdateExperienceResponseModel.fromJson(Map<String, dynamic> json) =>
      AddUpdateExperienceResponseModel(
        data: ExperienceData.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}
