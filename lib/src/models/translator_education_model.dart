class TranslatorEducationModel{
  String school;
  String degree;
  String fieldOfStudy;
  DateTime startDate;
  DateTime endDate;
  String grade;
  String activities;
  String description;

  TranslatorEducationModel(
      {this.school,
      this.degree,
      this.fieldOfStudy,
      this.startDate,
      this.endDate,
      this.grade,
      this.activities,
      this.description});

  factory TranslatorEducationModel.initial(){
    return TranslatorEducationModel(
      description: '',
      activities: '',
      degree: '',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      fieldOfStudy: '',
      grade: '',
      school: '',
    );
  }
}