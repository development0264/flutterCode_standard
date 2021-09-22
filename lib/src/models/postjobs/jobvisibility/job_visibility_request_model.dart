import 'dart:convert';

import 'package:meta/meta.dart';

JobVisibilityRequestModel jobVisibilityRequestModelFromJson(String str) =>
    JobVisibilityRequestModel.fromJson(json.decode(str));

String jobVisibilityRequestModelToJson(JobVisibilityRequestModel data) => json.encode(data.toJson());

class JobVisibilityRequestModel {
  JobVisibilityRequestModel({
    this.visibilityId,
    @required this.jobId,
    @required this.geographicalBoundaryIds,
    @required this.countryId,
    @required this.languageSpecialtyIds,
    @required this.proficiencyLevelId,
    @required this.minimumExperience,
    @required this.minimumRatings,
    @required this.minimumReviews,
  });

  String visibilityId;
  String jobId;
  List<String> geographicalBoundaryIds;
  String countryId;
  List<String> languageSpecialtyIds;
  String proficiencyLevelId;
  int minimumExperience;
  int minimumRatings;
  String minimumReviews;

  factory JobVisibilityRequestModel.fromJson(Map<String, dynamic> json) => JobVisibilityRequestModel(
        visibilityId: json["VisibilityId"],
        jobId: json["jobId"],
        geographicalBoundaryIds: List<String>.from(json["geographicalBoundaryIds"].map((x) => x)),
        countryId: json["countryId"],
        languageSpecialtyIds: List<String>.from(json["languageSpecialtyIds"].map((x) => x)),
        proficiencyLevelId: json["proficiencyLevelId"],
        minimumExperience: json["minimumExperience"],
        minimumRatings: json["minimumRatings"],
        minimumReviews: json["minimumReviews"],
      );

  Map<String, dynamic> toJson() => {
        "VisibilityId": visibilityId,
        "jobId": jobId,
        "geographicalBoundaryIds": List<dynamic>.from(geographicalBoundaryIds.map((x) => x)),
        "countryId": countryId,
        "languageSpecialtyIds": List<dynamic>.from(languageSpecialtyIds.map((x) => x)),
        "proficiencyLevelId": proficiencyLevelId,
        "minimumExperience": minimumExperience,
        "minimumRatings": minimumRatings,
        "minimumReviews": minimumReviews,
      };

  factory JobVisibilityRequestModel.initial() {
    return JobVisibilityRequestModel(
      visibilityId: '',
      jobId: '',
      geographicalBoundaryIds: [],
      countryId: '',
      languageSpecialtyIds: [],
      proficiencyLevelId: '',
      minimumExperience: -1,
      minimumRatings: -1,
      minimumReviews: '',
    );
  }
}
