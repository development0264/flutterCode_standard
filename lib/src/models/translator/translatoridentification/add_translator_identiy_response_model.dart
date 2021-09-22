import 'dart:convert';

import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';
import 'package:meta/meta.dart';

AddIdentificationResponseModel addIdentificationResponseModelFromJson(String str) =>
    AddIdentificationResponseModel.fromJson(json.decode(str));

String addIdentificationResponseModelToJson(AddIdentificationResponseModel data) =>
    json.encode(data.toJson());

class AddIdentificationResponseModel {
  AddIdentificationResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  IndentityData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory AddIdentificationResponseModel.fromJson(Map<String, dynamic> json) =>
      AddIdentificationResponseModel(
        data: IndentityData.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory AddIdentificationResponseModel.initial() {
    return AddIdentificationResponseModel(data: null, message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class IndentityData {
  IndentityData({
    @required this.userId,
    @required this.checkrCandidateId,
    @required this.checkrReportId,
    @required this.checkrStatus,
    @required this.isIdVerified,
    @required this.fileOrDocumentInformations,
  });

  String userId;
  String checkrCandidateId;
  String checkrReportId;
  String checkrStatus;
  bool isIdVerified;
  List<FileOrDocumentInformationResponse> fileOrDocumentInformations;

  factory IndentityData.fromJson(Map<String, dynamic> json) => IndentityData(
        userId: json["userId"],
        checkrCandidateId: json["checkrCandidateId"],
        checkrReportId: json["checkrReportId"],
        checkrStatus: json["checkrStatus"],
        isIdVerified: json["isIdVerified"],
        fileOrDocumentInformations: List<FileOrDocumentInformationResponse>.from(
            json["fileOrDocumentInformations"]
                .map((x) => FileOrDocumentInformationResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "checkrCandidateId": checkrCandidateId,
        "checkrReportId": checkrReportId,
        "checkrStatus": checkrStatus,
        "isIdVerified": isIdVerified,
        "fileOrDocumentInformations":
            List<dynamic>.from(fileOrDocumentInformations.map((x) => x.toJson())),
      };
}
