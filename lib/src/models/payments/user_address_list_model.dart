import 'dart:convert';

import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:meta/meta.dart';

UserAddressListResponseModel userAddressListResponseModelFromJson(String str) =>
    UserAddressListResponseModel.fromJson(json.decode(str));

String userAddressListResponseModelToJson(UserAddressListResponseModel data) => json.encode(data.toJson());

class UserAddressListResponseModel {
  UserAddressListResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<dynamic> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory UserAddressListResponseModel.fromJson(Map<String, dynamic> json) => UserAddressListResponseModel(
        data: List<dynamic>.from(json["data"].map((x) => ClientAddressData.fromJson(x))),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory UserAddressListResponseModel.initial() {
    return UserAddressListResponseModel(data: [], message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}
