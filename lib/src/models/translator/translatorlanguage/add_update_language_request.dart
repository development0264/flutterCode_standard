import 'dart:convert';

import 'package:meta/meta.dart';

AddUpdateLanguageRequest addUpdateLanguageRequestFromJson(String str) =>
    AddUpdateLanguageRequest.fromJson(json.decode(str));

String addUpdateLanguageRequestToJson(AddUpdateLanguageRequest data) =>
    json.encode(data?.translatorLanguageId?.isEmpty == true ? data.toJsonAdd() : data.toJson());

class AddUpdateLanguageRequest {
  AddUpdateLanguageRequest({
    @required this.translatorLanguageId,
    @required this.userId,
    @required this.languageId,
    @required this.specializationIds,
  });

  String translatorLanguageId;
  String userId;
  String languageId;
  List<String> specializationIds;

  factory AddUpdateLanguageRequest.fromJson(Map<String, dynamic> json) => AddUpdateLanguageRequest(
        translatorLanguageId: json["translatorLanguageId"],
        userId: json["userId"],
        languageId: json["languageId"],
        specializationIds: List<String>.from(json["specializationIds"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "translatorLanguageId": translatorLanguageId,
        "userId": userId,
        "languageId": languageId,
        "specializationIds": List<dynamic>.from(specializationIds.map((x) => x)),
      };

  Map<String, dynamic> toJsonAdd() => {
        "userId": userId,
        "languageId": languageId,
        "specializationIds": List<dynamic>.from(specializationIds.map((x) => x)),
      };
}
