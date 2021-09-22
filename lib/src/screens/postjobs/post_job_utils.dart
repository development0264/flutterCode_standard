import 'package:khontext/src/models/posted_jobs_model.dart';

class PostJobUtils{
  /// [moveBackward] will take the data and set the data within the current model and then set the state of the saved
  /// page and models.
  static PostedJobsModel moveBackward(final data, PostedJobsModel postedModel) {
    switch (data.runtimeType) {
      case PostedJobsDescription:
        postedModel.description = data as PostedJobsDescription;
        break;
      case PostedJobsLanguage:
        postedModel.language = data as PostedJobsLanguage;
        break;
      case PostedJobsLocation:
        postedModel.place = data as PostedJobsLocation;
        break;
      case PostedJobsVisibility:
        postedModel.visibility = data as PostedJobsVisibility;
        break;
      case PostedJobsSchedule:
        postedModel.schedule = data as PostedJobsSchedule;
        break;
      case PostedJobsDetails:
        postedModel.details = data as PostedJobsDetails;
        break;
      case PostedJobsFilters:
        postedModel.filters = data as PostedJobsFilters;
        break;
    }

    return postedModel;
  }
}