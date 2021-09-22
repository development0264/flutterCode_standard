import 'package:meta/meta.dart';
import 'dart:convert';

CheckPhoneResponseModel checkPhoneResponseModelFromJson(String str) => CheckPhoneResponseModel.fromJson(json.decode(str));

String checkPhoneResponseModelToJson(CheckPhoneResponseModel data) => json.encode(data.toJson());

class CheckPhoneResponseModel {
  CheckPhoneResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  bool data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory CheckPhoneResponseModel.initial(){
    return CheckPhoneResponseModel(data: null, message: '', errors: null, isSuccessful: false);
  }

  factory CheckPhoneResponseModel.fromJson(Map<String, dynamic> json) => CheckPhoneResponseModel(
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
