import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_request_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';

/// Class which will help calling the apis for the [PostedJobsSchedule].
class PostJobScheduleApiCalls {
  /// [getSchedules] will return the [JobScheduleResponseModel].
  static Future<JobScheduleResponseModel> getSchedules(String jobId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.postJobSchedule + jobId);
    JobScheduleResponseModel responseModel;
    if (response != null) {
      responseModel = jobScheduleResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addUpdateSchedules] will return the [JobScheduleResponseModel].
  static Future<JobScheduleResponseModel> addUpdateSchedules(JobScheduleRequestModel jobScheduleRequestModel) async {
    var response = await ApiProvider
        .postAsync(ApiEndpoints.addUpdateJobSchedule, body: jobScheduleRequestModelToJson(jobScheduleRequestModel));
    JobScheduleResponseModel responseModel;
    if (response != null) {
      responseModel = jobScheduleResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
