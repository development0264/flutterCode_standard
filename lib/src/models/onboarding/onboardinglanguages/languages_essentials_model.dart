import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';

String languageEssentialsModelToJson(LanguageEssentialsModel data) => json.encode(data.toJson());

class LanguageEssentialsModel {
  final LanguagesResponseModel languagesResponseModel;
  final SpecializationsResponseModel specializationsResponseModel;
  final ProficiencyResponseModel proficiencyResponseModel;

  LanguageEssentialsModel({
    @required this.languagesResponseModel,
    @required this.specializationsResponseModel,
    @required this.proficiencyResponseModel,
  });

  factory LanguageEssentialsModel.initial() {
    return LanguageEssentialsModel(
      languagesResponseModel: LanguagesResponseModel.initial(),
      specializationsResponseModel: SpecializationsResponseModel.initial(),
      proficiencyResponseModel: ProficiencyResponseModel.initial(),
    );
  }

  Map<String, dynamic> toJson() => {
        "languagesResponseModel": languagesResponseModel,
        "specializationsResponseModel": specializationsResponseModel,
        "proficiencyResponseModel": proficiencyResponseModel
      };
}
