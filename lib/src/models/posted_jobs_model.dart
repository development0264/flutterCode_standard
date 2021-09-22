import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_states_model.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class PostedJobsModel {
  // Description
  PostedJobsDescription description;

  // Language
  PostedJobsLanguage language;

  // Location
  PostedJobsLocation place;

  // Visibility
  PostedJobsVisibility visibility;

  // Schedule
  PostedJobsSchedule schedule;

  // Details
  PostedJobsDetails details;

  // Filters
  PostedJobsFilters filters;

  // Creation time
  DateTime timeCreated;

  PostedJobsModel(
      {this.description,
      this.language,
      this.place,
      this.visibility,
      this.schedule,
      this.timeCreated,
      this.details,
      this.filters});

  factory PostedJobsModel.initial() {
    return PostedJobsModel(
      description: PostedJobsDescription.initial(),
      filters: PostedJobsFilters.initial(),
      details: PostedJobsDetails.initial(),
      language: PostedJobsLanguage.initial(),
      place: PostedJobsLocation.initial(),
      schedule: PostedJobsSchedule.initial(),
      visibility: PostedJobsVisibility.initial(),
      timeCreated: DateTime.now(),
    );
  }
}

class PostedJobsDescription {
  String jobTitle;
  String jobDescription;
  String service;
  List<dynamic> serviceType;
  List<Asset> jobFiles;

  PostedJobsDescription({this.jobTitle, this.jobDescription, this.jobFiles, this.service, this.serviceType});

  factory PostedJobsDescription.initial() {
    return PostedJobsDescription(jobTitle: '', serviceType: [], jobFiles: [], jobDescription: '', service: '');
  }
}

class PostedJobsLanguage {
  String jobSourceLanguages;
  String jobDestinationLanguages;
  String jobSpecializations;

  PostedJobsLanguage({this.jobSourceLanguages, this.jobDestinationLanguages, this.jobSpecializations});

  factory PostedJobsLanguage.initial() {
    return PostedJobsLanguage(jobDestinationLanguages: '', jobSourceLanguages: '', jobSpecializations: null);
  }
}

class PostedJobsLocation {
  String streetAddress;
  String addressLine2;
  String city;
  String state;
  String zipCode;
  String country;

  PostedJobsLocation({this.streetAddress, this.addressLine2, this.city, this.state, this.zipCode, this.country});

  factory PostedJobsLocation.initial() {
    return PostedJobsLocation(
      state: '',
      streetAddress: '',
      city: '',
      addressLine2: '',
      zipCode: '',
      country: '',
    );
  }
}

class PostedJobsVisibility {
  List<PostJobStatesData> jobBoundary;
  List<SpecializationsData> jobLanguageSpeciality;
  String jobProficiency;
  String jobExperiences;
  String jobRatings;
  String jobReviews;

  PostedJobsVisibility(
      {this.jobBoundary,
      this.jobLanguageSpeciality,
      this.jobProficiency,
      this.jobExperiences,
      this.jobRatings,
      this.jobReviews});

  factory PostedJobsVisibility.initial() {
    return PostedJobsVisibility(
      jobRatings: null,
      jobExperiences: '',
      jobProficiency: null,
      jobLanguageSpeciality: null,
      jobBoundary: null,
      jobReviews: null,
    );
  }
}

class PostedJobsSchedule {
  List<ScheduleDateTime> jobScheduleList;

  PostedJobsSchedule({this.jobScheduleList});

  factory PostedJobsSchedule.initial() {
    return PostedJobsSchedule(jobScheduleList: []);
  }
}

class PostJobsScheduleModel {
  DateTime fromDate;
  DateTime toDate;

  PostJobsScheduleModel({this.toDate, this.fromDate});

  factory PostJobsScheduleModel.initial() {
    return PostJobsScheduleModel(
      toDate: DateTime.now(),
      fromDate: DateTime.now(),
    );
  }
}

class PostedJobsDetails {
  String proposals;
  String messaged;
  String hired;

  PostedJobsDetails({this.proposals, this.messaged, this.hired});

  factory PostedJobsDetails.initial() {
    return PostedJobsDetails(messaged: '', proposals: '', hired: '');
  }
}

class PostedJobsFilters {
  String jobType;

  PostedJobsFilters({this.jobType});

  factory PostedJobsFilters.initial() {
    return PostedJobsFilters(jobType: '');
  }
}
