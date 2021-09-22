import 'package:khontext/src/models/clientprofile/client_image_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_services_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_response_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

TranslatorFavJobsResponse translatorFavJobsResponseFromJson(String str) => TranslatorFavJobsResponse.fromJson(json.decode(str));

String translatorFavJobsResponseToJson(TranslatorFavJobsResponse data) => json.encode(data.toJson());

class TranslatorFavJobsResponse {
  TranslatorFavJobsResponse({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  FavJobsData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory TranslatorFavJobsResponse.fromJson(Map<String, dynamic> json) => TranslatorFavJobsResponse(
    data: FavJobsData.fromJson(json["data"]),
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

class FavJobsData {
  FavJobsData({
    @required this.favoriteJobsResponses,
    @required this.totalRecords,
    @required this.currentPage,
    @required this.pageSize,
  });

  List<FavoriteJobsResponse> favoriteJobsResponses;
  int totalRecords;
  int currentPage;
  int pageSize;

  factory FavJobsData.fromJson(Map<String, dynamic> json) => FavJobsData(
    favoriteJobsResponses: List<FavoriteJobsResponse>.from(json["favoriteJobsResponses"].map((x) => FavoriteJobsResponse.fromJson(x))),
    totalRecords: json["totalRecords"],
    currentPage: json["currentPage"],
    pageSize: json["pageSize"],
  );

  Map<String, dynamic> toJson() => {
    "favoriteJobsResponses": List<dynamic>.from(favoriteJobsResponses.map((x) => x.toJson())),
    "totalRecords": totalRecords,
    "currentPage": currentPage,
    "pageSize": pageSize,
  };
}

class FavoriteJobsResponse {
  FavoriteJobsResponse({
    @required this.favoriteJobId,
    @required this.userId,
    @required this.jobResponse,
    @required this.isFavorite,
  });

  String favoriteJobId;
  String userId;
  JobResponse jobResponse;
  bool isFavorite;

  factory FavoriteJobsResponse.fromJson(Map<String, dynamic> json) => FavoriteJobsResponse(
    favoriteJobId: json["favoriteJobId"],
    userId: json["userId"],
    jobResponse: JobResponse.fromJson(json["jobResponse"]),
    isFavorite: json["isFavorite"],
  );

  Map<String, dynamic> toJson() => {
    "favoriteJobId": favoriteJobId,
    "userId": userId,
    "jobResponse": jobResponse.toJson(),
    "isFavorite": isFavorite,
  };
}

class JobResponse {
  JobResponse({
    @required this.jobId,
    @required this.description,
    @required this.language,
    @required this.location,
    @required this.visibility,
    @required this.schedule,
    @required this.isReviewed,
  });

  String jobId;
  Description description;
  LanguagesData language;
  Location location;
  VisibilityData visibility;
  JobScheduleData schedule;
  bool isReviewed;

  factory JobResponse.fromJson(Map<String, dynamic> json) => JobResponse(
    jobId: json["jobId"],
    description: Description.fromJson(json["description"]),
    language: LanguagesData.fromJson(json["language"]),
    location: Location.fromJson(json["location"]),
    visibility: VisibilityData.fromJson(json["visibility"]),
    schedule: JobScheduleData.fromJson(json["schedule"]),
    isReviewed: json["isReviewed"],
  );

  Map<String, dynamic> toJson() => {
    "jobId": jobId,
    "description": description.toJson(),
    "language": language.toJson(),
    "location": location.toJson(),
    "visibility": visibility.toJson(),
    "schedule": schedule.toJson(),
    "isReviewed": isReviewed,
  };
}

class Description {
  Description({
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
  List<ClientProfileImageData> fileDocuments;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    jobId: json["jobId"],
    userId: json["userId"],
    title: json["title"],
    serviceType: JobServicesData.fromJson(json["serviceType"]),
    description: json["description"],
    fileDocuments: List<ClientProfileImageData>.from(json["fileDocuments"].map((x) => ClientProfileImageData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "jobId": jobId,
    "userId": userId,
    "title": title,
    "serviceType": serviceType.toJson(),
    "description": description,
    "fileDocuments": List<dynamic>.from(fileDocuments.map((x) => x.toJson())),
  };
}

class ProficiencyLevel {
  ProficiencyLevel({
    @required this.specializationId,
    @required this.name,
    @required this.code,
    @required this.description,
    @required this.proficiencyLevelId,
  });

  String specializationId;
  String name;
  String code;
  String description;
  String proficiencyLevelId;

  factory ProficiencyLevel.fromJson(Map<String, dynamic> json) => ProficiencyLevel(
    specializationId: json["specializationId"] == null ? null : json["specializationId"],
    name: json["name"],
    code: json["code"],
    description: json["description"],
    proficiencyLevelId: json["proficiencyLevelId"] == null ? null : json["proficiencyLevelId"],
  );

  Map<String, dynamic> toJson() => {
    "specializationId": specializationId == null ? null : specializationId,
    "name": name,
    "code": code,
    "description": description,
    "proficiencyLevelId": proficiencyLevelId == null ? null : proficiencyLevelId,
  };
}

class Location {
  Location({
    @required this.addressId,
    @required this.streetNumber,
    @required this.streetName,
    @required this.line1,
    @required this.line2,
    @required this.addressType,
    @required this.city,
    @required this.county,
    @required this.zipCode,
    @required this.timezone,
    @required this.country,
  });

  String addressId;
  String streetNumber;
  String streetName;
  String line1;
  dynamic line2;
  String addressType;
  String city;
  String county;
  String zipCode;
  String timezone;
  String country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    addressId: json["addressId"],
    streetNumber: json["streetNumber"],
    streetName: json["streetName"],
    line1: json["line1"],
    line2: json["line2"],
    addressType: json["addressType"],
    city: json["city"],
    county: json["county"],
    zipCode: json["zipCode"],
    timezone: json["timezone"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "addressId": addressId,
    "streetNumber": streetNumber,
    "streetName": streetName,
    "line1": line1,
    "line2": line2,
    "addressType": addressType,
    "city": city,
    "county": county,
    "zipCode": zipCode,
    "timezone": timezone,
    "country": country,
  };
}
