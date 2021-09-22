import 'dart:convert';

import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';
import 'package:meta/meta.dart';

OnBoardingAddLangResponseModel onBoardingAddLangResponseModelFromJson(String str) =>
    OnBoardingAddLangResponseModel.fromJson(json.decode(str));

String onBoardingAddLangResponseModelToJson(OnBoardingAddLangResponseModel data) =>
    json.encode(data.toJson());

class OnBoardingAddLangResponseModel {
  OnBoardingAddLangResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<AddLanguageResponseData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory OnBoardingAddLangResponseModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingAddLangResponseModel(
        data: List<AddLanguageResponseData>.from(
            json["data"].map((x) => AddLanguageResponseData.fromJson(x))),
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
}

class AddLanguageResponseData {
  AddLanguageResponseData({
    @required this.userId,
    @required this.translatorLanguagesId,
    @required this.languagesResponse,
    @required this.proficiencyLevelsResponse,
    @required this.specializationsResponses,
  });

  String userId;
  String translatorLanguagesId;
  LanguagesData languagesResponse;
  ProficiencyData proficiencyLevelsResponse;
  List<SpecializationsData> specializationsResponses;

  factory AddLanguageResponseData.fromJson(Map<String, dynamic> json) => AddLanguageResponseData(
        userId: json["userId"],
        translatorLanguagesId: json["translatorLanguagesId"],
        languagesResponse: LanguagesData.fromJson(json["languagesResponse"]),
        proficiencyLevelsResponse: ProficiencyData.fromJson(json["proficiencyLevelsResponse"]),
        specializationsResponses: List<SpecializationsData>.from(
            json["specializationsResponses"].map((x) => SpecializationsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "translatorLanguagesId": translatorLanguagesId,
        "languagesResponse": languagesResponse.toJson(),
        "proficiencyLevelsResponse": proficiencyLevelsResponse.toJson(),
        "specializationsResponses":
            List<dynamic>.from(specializationsResponses.map((x) => x.toJson())),
      };
}
