import 'package:meta/meta.dart';
import 'dart:convert';

String jobLanguagesRequestModelToJson(JobLanguagesRequestModel data) => json.encode(data.toJson());

class JobLanguagesRequestModel {
  JobLanguagesRequestModel({
    @required this.jobId,
    @required this.userId,
    @required this.fromLanguageId,
    @required this.toLanguageId,
    @required this.specializationIds,
  });

  String jobId;
  String userId;
  String fromLanguageId;
  String toLanguageId;
  List<String> specializationIds;

  Map<String, dynamic> toJson() => {
    "jobId": jobId,
    "UserId": userId,
    "FromLanguageId": fromLanguageId,
    "ToLanguageId": toLanguageId,
    "SpecializationIds": List<dynamic>.from(specializationIds.map((x) => x)),
  };
}
