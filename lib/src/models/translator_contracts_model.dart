import 'package:flutter/material.dart';

class TranslatorContractsModel {
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final String fromLanguage;
  final String toLanguage;
  final String contractStatus;
  final String contractBudget;
  final String speciality;
  final String service;
  final String serviceType;
  final String description;
  final String location;
  final String schedule;
  final int feedbackRating;
  final String owner;

  TranslatorContractsModel({
    @required this.title,
    @required this.startDate,
    @required this.endDate,
    @required this.fromLanguage,
    @required this.toLanguage,
    @required this.contractStatus,
    @required this.contractBudget,
    @required this.speciality,
    @required this.service,
    @required this.serviceType,
    @required this.description,
    @required this.location,
    @required this.schedule,
    @required this.feedbackRating,
    @required this.owner,
  });

  factory TranslatorContractsModel.initial() {
    return TranslatorContractsModel(
      title: '',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      fromLanguage: '',
      toLanguage: '',
      contractStatus: '',
      contractBudget: '',
      speciality: null,
      service: '',
      serviceType: '',
      description: '',
      location: '',
      schedule: '',
      feedbackRating: 0,
      owner: '',
    );
  }
}
