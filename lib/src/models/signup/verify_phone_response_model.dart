import 'dart:convert';

import 'package:meta/meta.dart';

VerifyPhoneResponseModel verifyPhoneResponseModelFromJson(String str) =>
    VerifyPhoneResponseModel.fromJson(json.decode(str));

String verifyPhoneResponseModelToJson(VerifyPhoneResponseModel data) => json.encode(data.toJson());

class VerifyPhoneResponseModel {
  VerifyPhoneResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  bool data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory VerifyPhoneResponseModel.initial() {
    return VerifyPhoneResponseModel(data: null, message: '', errors: null, isSuccessful: false);
  }

  factory VerifyPhoneResponseModel.fromJson(Map<String, dynamic> json) => VerifyPhoneResponseModel(
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
