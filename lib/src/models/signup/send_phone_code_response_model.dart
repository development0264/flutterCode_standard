import 'dart:convert';

import 'package:meta/meta.dart';

PhoneCodeResponseModel phoneCodeResponseModelFromJson(String str) => PhoneCodeResponseModel.fromJson(json.decode(str));

String phoneCodeResponseModelToJson(PhoneCodeResponseModel data) => json.encode(data.toJson());

class PhoneCodeResponseModel {
  PhoneCodeResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  String data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory PhoneCodeResponseModel.initial() {
    return PhoneCodeResponseModel(data: null, message: '', errors: null, isSuccessful: false);
  }

  factory PhoneCodeResponseModel.fromJson(Map<String, dynamic> json) => PhoneCodeResponseModel(
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
