import 'package:meta/meta.dart';
import 'dart:convert';

AcceptTranslatorProposal acceptTranslatorProposalFromJson(String str) => AcceptTranslatorProposal.fromJson(json.decode(str));

String acceptTranslatorProposalToJson(AcceptTranslatorProposal data) => json.encode(data.toJson());

class AcceptTranslatorProposal {
  AcceptTranslatorProposal({
    @required this.jobId,
    @required this.translatorUserId,
    @required this.isAccept,
  });

  String jobId;
  String translatorUserId;
  bool isAccept;

  factory AcceptTranslatorProposal.fromJson(Map<String, dynamic> json) => AcceptTranslatorProposal(
    jobId: json["jobId"],
    translatorUserId: json["translatorUserId"],
    isAccept: json["isAccept"],
  );

  Map<String, dynamic> toJson() => {
    "jobId": jobId,
    "translatorUserId": translatorUserId,
    "isAccept": isAccept,
  };
}
