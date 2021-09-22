import 'package:flutter/material.dart';
import 'package:khontext/src/models/postjobs/acceptjobs/accept_proposal_response.dart';
import 'package:khontext/src/models/postjobs/acceptjobs/accept_translator_proposal_model.dart';
import 'package:khontext/src/models/postjobs/acceptjobs/hire_applied_response_model.dart';

/// Group of functions which gives the actions for the [AcceptJobs].
/// This group contains [JobProposalsFetchAction] which takes in the queries and gives out the response as
/// either [JobProposalsFetchSuccessAction] or [JobProposalsFetchErrorAction].
class JobProposalsFetchAction {
  final String jobId;

  JobProposalsFetchAction({this.jobId});
}

class JobProposalsFetchErrorAction {
  final String error;

  JobProposalsFetchErrorAction({this.error});
}

class JobProposalsFetchSuccessAction {
  final HireAppliedResponseModel hireAppliedResponseModel;

  JobProposalsFetchSuccessAction({this.hireAppliedResponseModel});
}

/// Group of functions which gives the actions for the [AcceptJobs].
/// This group contains [AcceptJobProposalsAction] which takes in the queries and gives out the response as
/// either [AcceptJobProposalsSuccessAction] or [AcceptJobProposalsErrorAction].
class AcceptJobProposalsAction {
  final BuildContext context;
  final AcceptTranslatorProposal acceptTranslatorProposal;

  AcceptJobProposalsAction({this.context, this.acceptTranslatorProposal});
}

class AcceptJobProposalsErrorAction {
  final String error;

  AcceptJobProposalsErrorAction({this.error});
}

class AcceptJobProposalsSuccessAction {
  final AcceptProposalResponse acceptProposalResponse;

  AcceptJobProposalsSuccessAction({this.acceptProposalResponse});
}
