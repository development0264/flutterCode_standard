import 'dart:convert';

import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:meta/meta.dart';

JobLanguagesResponseModel jobLanguagesResponseModelFromJson(String str) =>
    JobLanguagesResponseModel.fromJson(json.decode(str));

String jobLanguagesResponseModelToJson(JobLanguagesResponseModel data) =>
    json.encode(data.toJson());

class JobLanguagesResponseModel {
  JobLanguagesResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  JobLanguagesData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory JobLanguagesResponseModel.fromJson(Map<String, dynamic> json) =>
      JobLanguagesResponseModel(
        data: JobLanguagesData.fromJson(json["data"]),
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

  factory JobLanguagesResponseModel.initial() {
    return JobLanguagesResponseModel(data: null, message: null, errors: [], isSuccessful: false);
  }
}

class JobLanguagesData {
  JobLanguagesData({
    @required this.jobId,
    @required this.userId,
    @required this.fromLanguage,
    @required this.toLanguage,
    @required this.specializationIds,
    @required this.specializations,
  });

  String jobId;
  String userId;
  LanguagesData fromLanguage;
  LanguagesData toLanguage;
  List<String> specializationIds;
  List<SpecializationsData> specializations;

  factory JobLanguagesData.fromJson(Map<String, dynamic> json) => JobLanguagesData(
        jobId: json["jobId"],
        userId: json["userId"],
        fromLanguage:
            json["fromLanguage"] == null ? null : LanguagesData.fromJson(json["fromLanguage"]),
        toLanguage: json["toLanguage"] == null ? null : LanguagesData.fromJson(json["toLanguage"]),
        specializationIds: json["specializationIds"] != null
            ? List<String>.from(json["specializationIds"].map((x) => x))
            : [],
        specializations: json["specializations"] != null
            ? List<SpecializationsData>.from(
                json["specializations"].map((x) => SpecializationsData.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "userId": userId,
        "fromLanguage": fromLanguage == null ? null : fromLanguage.toJson(),
        "toLanguage": toLanguage == null ? null : toLanguage.toJson(),
        "specializationIds": List<dynamic>.from(specializationIds.map((x) => x)),
      };
}
