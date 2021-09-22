import 'dart:convert';
import 'package:meta/meta.dart';

CallTokenResponseModel callTokenResponseModelFromJson(String str) => CallTokenResponseModel.fromJson(json.decode(str));

String callTokenResponseModelToJson(CallTokenResponseModel data) => json.encode(data.toJson());

class CallTokenResponseModel {
  CallTokenResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  String data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory CallTokenResponseModel.fromJson(Map<String, dynamic> json) => CallTokenResponseModel(
        data: json["data"],
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory CallTokenResponseModel.initial() {
    return CallTokenResponseModel(data: '', message: '', errors: null, isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}
