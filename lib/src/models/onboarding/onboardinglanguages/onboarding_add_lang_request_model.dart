import 'dart:convert';

import 'package:meta/meta.dart';

List<OnBoardingAddLangRequestModel> onBoardingAddLangRequestModelFromJson(String str) =>
    List<OnBoardingAddLangRequestModel>.from(
        json.decode(str).map((x) => OnBoardingAddLangRequestModel.fromJson(x)));

String onBoardingAddLangRequestModelToJson(List<OnBoardingAddLangRequestModel> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => x?.translatorLanguageId?.isNotEmpty == true ? x.toJson() : x.toJsonAdd())));

class OnBoardingAddLangRequestModel {
  OnBoardingAddLangRequestModel({
    this.translatorLanguageId,
    @required this.userId,
    @required this.languageId,
    @required this.proficiencyLevelId,
    @required this.specializationIds,
  });

  String translatorLanguageId;
  String userId;
  String languageId;
  String proficiencyLevelId;
  List<String> specializationIds;

  factory OnBoardingAddLangRequestModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingAddLangRequestModel(
        translatorLanguageId: json["translatorLanguageId"],
        userId: json["userId"],
        languageId: json["languageId"],
        proficiencyLevelId: json["proficiencyLevelId"],
        specializationIds: List<String>.from(json["specializationIds"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "translatorLanguageId": translatorLanguageId,
        "userId": userId,
        "languageId": languageId,
        "proficiencyLevelId": proficiencyLevelId,
        "specializationIds": List<dynamic>.from(specializationIds.map((x) => x)),
      };

  Map<String, dynamic> toJsonAdd() => {
        "userId": userId,
        "languageId": languageId,
        "proficiencyLevelId": proficiencyLevelId,
        "specializationIds": List<dynamic>.from(specializationIds.map((x) => x)),
      };
}
