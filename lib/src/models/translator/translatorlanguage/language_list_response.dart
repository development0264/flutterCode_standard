import 'dart:convert';

import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:meta/meta.dart';

TranslatorLanguageListResponse translatorLanguageListResponseFromJson(String str) =>
    TranslatorLanguageListResponse.fromJson(json.decode(str));

String translatorLanguageListResponseToJson(TranslatorLanguageListResponse data) =>
    json.encode(data.toJson());

class TranslatorLanguageListResponse {
  TranslatorLanguageListResponse({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<LanguageListData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory TranslatorLanguageListResponse.fromJson(Map<String, dynamic> json) =>
      TranslatorLanguageListResponse(
        data: List<LanguageListData>.from(json["data"].map((x) => LanguageListData.fromJson(x))),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory TranslatorLanguageListResponse.initial() {
    return TranslatorLanguageListResponse(data: null, message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class LanguageListData {
  LanguageListData({
    @required this.userId,
    @required this.translatorLanguagesId,
    @required this.languagesResponse,
    @required this.specializationsResponses,
  });

  String userId;
  String translatorLanguagesId;
  LanguagesData languagesResponse;
  List<SpecializationsData> specializationsResponses;

  factory LanguageListData.fromJson(Map<String, dynamic> json) => LanguageListData(
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
