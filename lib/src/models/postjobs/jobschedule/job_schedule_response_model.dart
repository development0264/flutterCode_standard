import 'dart:convert';

import 'package:meta/meta.dart';

JobScheduleResponseModel jobScheduleResponseModelFromJson(String str) =>
    JobScheduleResponseModel.fromJson(json.decode(str));

String jobScheduleResponseModelToJson(JobScheduleResponseModel data) => json.encode(data.toJson());

class JobScheduleResponseModel {
  JobScheduleResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  JobScheduleData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory JobScheduleResponseModel.fromJson(Map<String, dynamic> json) => JobScheduleResponseModel(
        data: JobScheduleData.fromJson(json["data"]),
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

  factory JobScheduleResponseModel.initial() {
    return JobScheduleResponseModel(data: null, message: '', errors: [], isSuccessful: false);
  }
}

class JobScheduleData {
  JobScheduleData({
    @required this.jobId,
    @required this.scheduleDateTimes,
  });

  String jobId;
  List<ScheduleDateTime> scheduleDateTimes;

  factory JobScheduleData.fromJson(Map<String, dynamic> json) => JobScheduleData(
        jobId: json["jobId"],
        scheduleDateTimes:
            List<ScheduleDateTime>.from(json["scheduleDateTimes"].map((x) => ScheduleDateTime.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "scheduleDateTimes": List<dynamic>.from(scheduleDateTimes.map((x) => x.toJson())),
      };
}

class ScheduleDateTime {
  ScheduleDateTime({
    @required this.fromDateTime,
    @required this.toDateTime,
  });

  DateTime fromDateTime;
  DateTime toDateTime;

  factory ScheduleDateTime.fromJson(Map<String, dynamic> json) => ScheduleDateTime(
        fromDateTime: DateTime.parse(json["fromDateTime"]),
        toDateTime: DateTime.parse(json["toDateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "fromDateTime": fromDateTime.toIso8601String(),
        "toDateTime": toDateTime.toIso8601String(),
      };
}
