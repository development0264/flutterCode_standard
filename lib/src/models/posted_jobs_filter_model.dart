/// Model which stores the current state of the posted jobs filter
class PostedJobsFilterModel {
  String search;
  String fromLanguage;
  String toLanguage;

  PostedJobsFilterModel({this.search, this.fromLanguage, this.toLanguage});

  factory PostedJobsFilterModel.initial() {
    return PostedJobsFilterModel(search: '', fromLanguage: '', toLanguage: '');
  }
}
