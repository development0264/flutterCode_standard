import 'dart:convert';

import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/job_languages_response_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_response_model.dart';
import 'package:meta/meta.dart';

JobsListResponseModel jobsListResponseModelFromJson(String str) =>
    JobsListResponseModel.fromJson(json.decode(str));

String jobsListResponseModelToJson(JobsListResponseModel data) => json.encode(data.toJson());

class JobsListResponseModel {
  JobsListResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  JobData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory JobsListResponseModel.fromJson(Map<String, dynamic> json) => JobsListResponseModel(
        data: JobData.fromJson(json["data"]),
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

class JobData {
  JobData({
    @required this.jobReviewResponses,
    @required this.totalRecords,
    @required this.currentPage,
    @required this.pageSize,
  });

  List<JobsListData> jobReviewResponses;
  int totalRecords;
  int currentPage;
  int pageSize;

  factory JobData.fromJson(Map<String, dynamic> json) => JobData(
        jobReviewResponses: List<JobsListData>.from(
            json["jobReviewResponses"].map((x) => JobsListData.fromJson(x))),
        totalRecords: json["totalRecords"],
        currentPage: json["currentPage"],
        pageSize: json["pageSize"],
      );

  Map<String, dynamic> toJson() => {
        "jobReviewResponses": List<dynamic>.from(jobReviewResponses.map((x) => x.toJson())),
        "totalRecords": totalRecords,
        "currentPage": currentPage,
        "pageSize": pageSize,
      };
}

class JobsListData {
  JobsListData({
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

  factory JobsListData.fromJson(Map<String, dynamic> json) => JobsListData(
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
