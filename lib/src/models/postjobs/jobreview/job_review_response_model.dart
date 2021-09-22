import 'dart:convert';

import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/job_languages_response_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_response_model.dart';
import 'package:meta/meta.dart';

JobReviewResponseModel jobReviewResponseModelFromJson(String str) => JobReviewResponseModel.fromJson(json.decode(str));

String jobReviewResponseModelToJson(JobReviewResponseModel data) => json.encode(data.toJson());

class JobReviewResponseModel {
  JobReviewResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  ReviewData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory JobReviewResponseModel.fromJson(Map<String, dynamic> json) => JobReviewResponseModel(
        data: ReviewData.fromJson(json["data"]),
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

class ReviewData {
  ReviewData({
    @required this.jobId,
    @required this.description,
    @required this.language,
    @required this.location,
    @required this.visibility,
    @required this.schedule,
  });

  String jobId;
  JobDescriptionData description;
  JobLanguagesData language;
  ClientAddressData location;
  VisibilityData visibility;
  JobScheduleData schedule;

  factory ReviewData.fromJson(Map<String, dynamic> json) => ReviewData(
        jobId: json["jobId"],
        description: JobDescriptionData.fromJson(json["description"]),
        language: JobLanguagesData.fromJson(json["language"]),
        location: ClientAddressData.fromJson(json["location"]),
        visibility: VisibilityData.fromJson(json["visibility"]),
        schedule: JobScheduleData.fromJson(json["schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "description": description.toJson(),
        "language": language.toJson(),
        "location": location.toJson(),
        "visibility": visibility.toJson(),
        "schedule": schedule.toJson(),
      };
}

