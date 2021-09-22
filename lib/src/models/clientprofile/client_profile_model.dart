import 'dart:convert';

import 'package:meta/meta.dart';

ClientProfileResponseModel clientProfileResponseModelFromJson(String str) =>
    ClientProfileResponseModel.fromJson(json.decode(str));

String clientProfileResponseModelToJson(ClientProfileResponseModel data) => json.encode(data.toJson());

class ClientProfileResponseModel {
  ClientProfileResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  ClientProfileData data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory ClientProfileResponseModel.fromJson(Map<String, dynamic> json) => ClientProfileResponseModel(
        data: json["data"] == null ? null : ClientProfileData.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        errors: json["errors"] == null ? null : List<dynamic>.from(json["errors"].map((x) => x)),
        isSuccessful: json["isSuccessful"] == null ? null : json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
        "message": message == null ? null : message,
        "errors": errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
        "isSuccessful": isSuccessful == null ? null : isSuccessful,
      };
}

class ClientProfileData {
  ClientProfileData({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.phone,
    @required this.taxId,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  String taxId;

  factory ClientProfileData.fromJson(Map<String, dynamic> json) => ClientProfileData(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        taxId: json["taxId"] == null ? null : json["taxId"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "taxId": taxId == null ? null : taxId,
      };
}
