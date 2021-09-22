import 'dart:convert';

import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_services_response_model.dart';
import 'package:meta/meta.dart';

JobDescriptionResponseModel jobDescriptionResponseModelFromJson(String str) =>
    JobDescriptionResponseModel.fromJson(json.decode(str));

String jobDescriptionResponseModelToJson(JobDescriptionResponseModel data) =>
    json.encode(data.toJson());

class JobDescriptionResponseModel {
  JobDescriptionResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  JobDescriptionData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory JobDescriptionResponseModel.fromJson(Map<String, dynamic> json) =>
      JobDescriptionResponseModel(
        data: JobDescriptionData.fromJson(json["data"]),
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

  factory JobDescriptionResponseModel.initial() {
    return JobDescriptionResponseModel(data: null, message: null, errors: [], isSuccessful: false);
  }
}

class JobDescriptionData {
  JobDescriptionData({
    @required this.jobId,
    @required this.userId,
    @required this.title,
    @required this.serviceType,
    @required this.description,
    @required this.fileDocuments,
  });

  String jobId;
  String userId;
  String title;
  JobServicesData serviceType;
  String description;
  List<FileOrDocumentInformationResponse> fileDocuments;

  factory JobDescriptionData.fromJson(Map<String, dynamic> json) => JobDescriptionData(
        jobId: json["jobId"],
        userId: json["userId"],
        title: json["title"],
        serviceType: JobServicesData.fromJson(json["serviceType"]),
        description: json["description"],
        fileDocuments: json["fileDocuments"] != null
            ? List<FileOrDocumentInformationResponse>.from(
                json["fileDocuments"].map((x) => FileOrDocumentInformationResponse.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "userId": userId,
        "title": title,
        "serviceType": serviceType.toJson(),
        "description": description,
        "fileDocuments": List<FileOrDocumentInformationResponse>.from(fileDocuments.map((x) => x)),
      };
}
