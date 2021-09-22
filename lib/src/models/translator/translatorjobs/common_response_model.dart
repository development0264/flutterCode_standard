import 'package:meta/meta.dart';
import 'dart:convert';

CommonResponseModel commonResponseFromJson(String str) => CommonResponseModel.fromJson(json.decode(str));

String commonResponseToJson(CommonResponseModel data) => json.encode(data.toJson());

class CommonResponseModel {
  CommonResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  bool data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) => CommonResponseModel(
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
