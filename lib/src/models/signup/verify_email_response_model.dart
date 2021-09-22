import 'dart:convert';

import 'package:meta/meta.dart';

VerifyEmailResponseModel verifyEmailResponseModelFromJson(String str) =>
    VerifyEmailResponseModel.fromJson(json.decode(str));

String verifyEmailResponseModelToJson(VerifyEmailResponseModel data) => json.encode(data.toJson());

class VerifyEmailResponseModel {
  VerifyEmailResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  bool data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory VerifyEmailResponseModel.initial() {
    return VerifyEmailResponseModel(data: null, message: '', errors: null, isSuccessful: false);
  }

  factory VerifyEmailResponseModel.fromJson(Map<String, dynamic> json) => VerifyEmailResponseModel(
        data: json["data"] == null ? null : json["data"],
        message: json["message"] == null ? null : json["message"],
        errors: json["errors"] == null ? null : List<dynamic>.from(json["errors"].map((x) => x)),
        isSuccessful: json["isSuccessful"] == null ? null : json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data,
        "message": message == null ? null : message,
        "errors": errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
        "isSuccessful": isSuccessful == null ? null : isSuccessful,
      };
}
