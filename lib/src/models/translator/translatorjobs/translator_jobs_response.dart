import 'dart:convert';

import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/clientprofile/client_image_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_services_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';
import 'package:meta/meta.dart';

TranslatorJobsResponse translatorJobsResponseFromJson(String str) =>
    TranslatorJobsResponse.fromJson(json.decode(str));

String translatorJobsResponseToJson(TranslatorJobsResponse data) => json.encode(data.toJson());

class TranslatorJobsResponse {
  TranslatorJobsResponse({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  TranslatorJobsData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory TranslatorJobsResponse.fromJson(Map<String, dynamic> json) => TranslatorJobsResponse(
        data:
        TranslatorJobsData.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory TranslatorJobsResponse.initial(){
    return TranslatorJobsResponse(data: null, message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class TranslatorJobsData {
  TranslatorJobsData({
    @required this.records,
    @required this.total,
    @required this.page,
    @required this.pageSize,
  });

  List<JobRecord> records;
  int total;
  int page;
  int pageSize;

  factory TranslatorJobsData.fromJson(Map<String, dynamic> json) => TranslatorJobsData(
    records: List<JobRecord>.from(json["records"].map((x) => JobRecord.fromJson(x))),
    total: json["total"],
    page: json["page"],
    pageSize: json["pageSize"],
  );

  Map<String, dynamic> toJson() => {
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
    "total": total,
    "page": page,
    "pageSize": pageSize,
  };
}

class JobRecord {
  JobRecord({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.serviceType,
    @required this.fileDocuments,
    @required this.fromLanguage,
    @required this.toLanguage,
    @required this.specializations,
    @required this.address,
    @required this.visibility,
    @required this.schedule,
  });

  String id;
  String title;
  String description;
  JobServicesData serviceType;
  List<ClientProfileImageData> fileDocuments;
  LanguagesData fromLanguage;
  LanguagesData toLanguage;
  List<ProficiencyData> specializations;
  ClientAddressData address;
  VisibilityData visibility;
  JobScheduleData schedule;

  factory JobRecord.fromJson(Map<String, dynamic> json) => JobRecord(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        serviceType: JobServicesData.fromJson(json["serviceType"]),
        fileDocuments: List<ClientProfileImageData>.from(
            json["fileDocuments"].map((x) => ClientProfileImageData.fromJson(x))),
        fromLanguage: LanguagesData.fromJson(json["fromLanguage"]),
        toLanguage: LanguagesData.fromJson(json["toLanguage"]),
        specializations: List<ProficiencyData>.from(
            json["specializations"].map((x) => ProficiencyData.fromJson(x))),
        address: ClientAddressData.fromJson(json["address"]),
        visibility: VisibilityData.fromJson(json["visibility"]),
        schedule: JobScheduleData.fromJson(json["schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "serviceType": serviceType.toJson(),
        "fileDocuments": List<dynamic>.from(fileDocuments.map((x) => x.toJson())),
        "fromLanguage": fromLanguage.toJson(),
        "toLanguage": toLanguage.toJson(),
        "specializations": List<dynamic>.from(specializations.map((x) => x.toJson())),
        "address": address.toJson(),
        "visibility": visibility.toJson(),
        "schedule": schedule.toJson(),
      };
}
