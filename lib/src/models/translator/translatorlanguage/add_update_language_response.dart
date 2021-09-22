import 'dart:convert';

import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:meta/meta.dart';

AddUpdateLanguageResponse addUpdateLanguageResponseFromJson(String str) =>
    AddUpdateLanguageResponse.fromJson(json.decode(str));

String addUpdateLanguageResponseToJson(AddUpdateLanguageResponse data) =>
    json.encode(data.toJson());

class AddUpdateLanguageResponse {
  AddUpdateLanguageResponse({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  LanguageResponseData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory AddUpdateLanguageResponse.fromJson(Map<String, dynamic> json) =>
      AddUpdateLanguageResponse(
        data: LanguageResponseData.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class LanguageResponseData {
  LanguageResponseData({
    @required this.userId,
    @required this.translatorLanguagesId,
    @required this.languagesResponse,
    @required this.specializationsResponses,
  });

  String userId;
  String translatorLanguagesId;
  LanguagesData languagesResponse;
  List<SpecializationsData> specializationsResponses;

  factory LanguageResponseData.fromJson(Map<String, dynamic> json) => LanguageResponseData(
        userId: json["userId"],
        translatorLanguagesId: json["translatorLanguagesId"],
        languagesResponse: LanguagesData.fromJson(json["languagesResponse"]),
        specializationsResponses: List<SpecializationsData>.from(
            json["specializationsResponses"].map((x) => SpecializationsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "translatorLanguagesId": translatorLanguagesId,
        "languagesResponse": languagesResponse.toJson(),
        "specializationsResponses":
            List<dynamic>.from(specializationsResponses.map((x) => x.toJson())),
      };
}
