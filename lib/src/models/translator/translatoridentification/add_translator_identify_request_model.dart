// To parse this JSON data, do
//
//     final addIdentificationRequestModel = addIdentificationRequestModelFromJson(jsonString);

import 'dart:convert';

import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:meta/meta.dart';

AddIdentificationRequestModel addIdentificationRequestModelFromJson(String str) =>
    AddIdentificationRequestModel.fromJson(json.decode(str));

String addIdentificationRequestModelToJson(AddIdentificationRequestModel data) =>
    json.encode(data.toJson());

class AddIdentificationRequestModel {
  AddIdentificationRequestModel({
    @required this.userId,
    @required this.ssnNumber,
    @required this.dateOfBirth,
    @required this.zipCode,
    @required this.fileOrDocumentInformation,
  });

  String userId;
  String ssnNumber;
  String dateOfBirth;
  String zipCode;
  List<FileOrDocumentInformationRequest> fileOrDocumentInformation;

  factory AddIdentificationRequestModel.fromJson(Map<String, dynamic> json) =>
      AddIdentificationRequestModel(
        userId: json["userId"],
        ssnNumber: json["ssnNumber"],
        dateOfBirth: json["dateOfBirth"],
        zipCode: json["zipCode"],
        fileOrDocumentInformation: List<FileOrDocumentInformationRequest>.from(
            json["fileOrDocumentInformations"]
                .map((x) => FileOrDocumentInformationRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "ssnNumber": ssnNumber,
        "dateOfBirth": dateOfBirth,
        "zipCode": zipCode,
        "fileOrDocumentInformations":
            List<dynamic>.from(fileOrDocumentInformation.map((x) => x.toJson())),
      };
}
