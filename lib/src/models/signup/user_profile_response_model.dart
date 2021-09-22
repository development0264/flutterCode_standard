import 'package:meta/meta.dart';
import 'dart:convert';

UserProfileResponseModel userProfileResponseModelFromJson(String str) => UserProfileResponseModel.fromJson(json.decode(str));

String userProfileResponseModelToJson(UserProfileResponseModel data) => json.encode(data.toJson());

class UserProfileResponseModel {
  UserProfileResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  String data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory UserProfileResponseModel.initial(){
    return UserProfileResponseModel(data: null, message: '', errors: null, isSuccessful: false);
  }

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) => UserProfileResponseModel(
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
