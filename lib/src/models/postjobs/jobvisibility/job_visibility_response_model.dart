import 'dart:convert';

import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';
import 'package:meta/meta.dart';

JobVisibilityResponseModel jobVisibilityResponseModelFromJson(String str) =>
    JobVisibilityResponseModel.fromJson(json.decode(str));

String jobVisibilityResponseModelToJson(JobVisibilityResponseModel data) => json.encode(data.toJson());

class JobVisibilityResponseModel {
  JobVisibilityResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  VisibilityData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory JobVisibilityResponseModel.fromJson(Map<String, dynamic> json) => JobVisibilityResponseModel(
        data: VisibilityData.fromJson(json["data"]),
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

  factory JobVisibilityResponseModel.initial() {
    return JobVisibilityResponseModel(data: null, message: null, errors: null, isSuccessful: false);
  }
}

class VisibilityData {
  VisibilityData({
    @required this.visibilityId,
    @required this.jobId,
    @required this.geographicalBoundary,
    @required this.country,
    @required this.languageSpecialties,
    @required this.proficiencyLevel,
    @required this.minimumExperience,
    @required this.minimumRatings,
    @required this.minimumReviews,
  });

  String visibilityId;
  String jobId;
  List<GeographicalBoundary> geographicalBoundary;
  Country country;
  List<ProficiencyData> languageSpecialties;
  ProficiencyData proficiencyLevel;
  int minimumExperience;
  int minimumRatings;
  String minimumReviews;

  factory VisibilityData.fromJson(Map<String, dynamic> json) => VisibilityData(
        visibilityId: json["visibilityId"] == null ? null : json["visibilityId"],
        jobId: json["jobId"] == null ? null : json["jobId"],
        geographicalBoundary: json["geographicalBoundaries"] == null
            ? null
            : List<GeographicalBoundary>.from(json["geographicalBoundaries"].map((x) => GeographicalBoundary.fromJson(x))),
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        languageSpecialties:
            json["languageSpecialties"] == null ? null : List<ProficiencyData>.from(json["languageSpecialties"].map((x) => ProficiencyData.fromJson(x))),
        proficiencyLevel: json["proficiencyLevel"] == null ? null : ProficiencyData.fromJson(json["proficiencyLevel"]),
        minimumExperience: json["minimumExperience"] == null ? null : json["minimumExperience"],
        minimumRatings: json["minimumRatings"] == null ? null : json["minimumRatings"],
        minimumReviews: json["minimumReviews"] == null ? null : json["minimumReviews"],
      );

  Map<String, dynamic> toJson() => {
        "visibilityId": visibilityId,
        "jobId": jobId,
        "geographicalBoundary": List<GeographicalBoundary>.from(geographicalBoundary.map((x) => x)),
        "countryId": country,
        "languageSpecialtyIds": List<ProficiencyData>.from(languageSpecialties.map((x) => x)),
        "proficiencyLevelId": proficiencyLevel,
        "minimumExperience": minimumExperience,
        "minimumRatings": minimumRatings,
        "minimumReviews": minimumReviews,
      };
}

class Country {
  Country({
    this.countryId,
    this.name,
    this.code,
    this.flagUrl,
  });

  final String countryId;
  final String name;
  final String code;
  final dynamic flagUrl;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["countryId"] == null ? null : json["countryId"],
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
        flagUrl: json["flagUrl"],
      );

  Map<String, dynamic> toJson() => {
        "countryId": countryId == null ? null : countryId,
        "name": name == null ? null : name,
        "code": code == null ? null : code,
        "flagUrl": flagUrl,
      };
}

class GeographicalBoundary {
  GeographicalBoundary({
    @required this.stateId,
    @required this.name,
    @required this.shortName,
    @required this.countryId,
  });

  String stateId;
  String name;
  String shortName;
  String countryId;

  factory GeographicalBoundary.fromJson(Map<String, dynamic> json) => GeographicalBoundary(
    stateId: json["stateId"],
    name: json["name"],
    shortName: json["shortName"],
    countryId: json["countryId"],
  );

  Map<String, dynamic> toJson() => {
    "stateId": stateId,
    "name": name,
    "shortName": shortName,
    "countryId": countryId,
  };
}
