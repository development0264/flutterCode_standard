import 'dart:convert';

import 'package:meta/meta.dart';

LanguagesResponseModel languagesResponseModelFromJson(String str) => LanguagesResponseModel.fromJson(json.decode(str));

String languagesResponseModelToJson(LanguagesResponseModel data) => json.encode(data.toJson());

class LanguagesResponseModel {
  LanguagesResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<LanguagesData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory LanguagesResponseModel.fromJson(Map<String, dynamic> json) => LanguagesResponseModel(
        data: List<LanguagesData>.from(json["data"].map((x) => LanguagesData.fromJson(x))),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };

  factory LanguagesResponseModel.initial() {
    return LanguagesResponseModel(data: [], message: null, errors: [], isSuccessful: false);
  }
}

class LanguagesData {
  LanguagesData({
    @required this.languageId,
    @required this.name,
    @required this.code,
    @required this.locale,
    @required this.directionality,
    @required this.localName,
  });

  String languageId;
  String name;
  String code;
  String locale;
  String directionality;
  String localName;

  factory LanguagesData.fromJson(Map<String, dynamic> json) => LanguagesData(
        languageId: json["languageId"],
        name: json["name"],
        code: json["code"],
        locale: json["locale"],
        directionality: json["directionality"],
        localName: json["localName"],
      );

  Map<String, dynamic> toJson() => {
        "languageId": languageId,
        "name": name,
        "code": code,
        "locale": locale,
        "directionality": directionality,
        "localName": localName,
      };
}
