import 'package:meta/meta.dart';
import 'dart:convert';

DeleteLanguageResponseModel deleteLanguageResponseModelFromJson(String str) => DeleteLanguageResponseModel.fromJson(json.decode(str));

String deleteLanguageResponseModelToJson(DeleteLanguageResponseModel data) => json.encode(data.toJson());

class DeleteLanguageResponseModel {
  DeleteLanguageResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  bool data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory DeleteLanguageResponseModel.fromJson(Map<String, dynamic> json) => DeleteLanguageResponseModel(
    data: json["data"],
    message: json["message"],
    errors: json["errors"],
    isSuccessful: json["isSuccessful"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "errors": errors,
    "isSuccessful": isSuccessful,
  };
}
