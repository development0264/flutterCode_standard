import 'package:khontext/src/models/translator/translatoreducation/education_list_response_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

AddUpdateEducationResponseModel addUpdateEducationResponseModelFromJson(String str) => AddUpdateEducationResponseModel.fromJson(json.decode(str));

String addUpdateEducationResponseModelToJson(AddUpdateEducationResponseModel data) => json.encode(data.toJson());

class AddUpdateEducationResponseModel {
  AddUpdateEducationResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  EducationData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory AddUpdateEducationResponseModel.fromJson(Map<String, dynamic> json) => AddUpdateEducationResponseModel(
    data: EducationData.fromJson(json["data"]),
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