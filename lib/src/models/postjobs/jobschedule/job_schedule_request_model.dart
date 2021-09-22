import 'dart:convert';

import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';

String jobScheduleRequestModelToJson(JobScheduleRequestModel data) => json.encode(data.toJson());

class JobScheduleRequestModel {
  JobScheduleRequestModel({this.jobId, this.scheduleDateTime});

  String jobId;
  List<ScheduleDateTime> scheduleDateTime;

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "scheduleDateTimes": scheduleDateTime,
      };
}
