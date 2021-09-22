import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/postjobs/acceptjobs/accept_proposal_response.dart';
import 'package:khontext/src/models/postjobs/acceptjobs/accept_translator_proposal_model.dart';
import 'package:khontext/src/models/postjobs/acceptjobs/hire_applied_response_model.dart';

class HireAppliedApiCalls {
  /// [getJobProposals] will return the [HireAppliedResponseModel].
  static Future<HireAppliedResponseModel> getJobProposals(String jobId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.jobsProposals + jobId);
    HireAppliedResponseModel responseModel;
    if (response != null) {
      responseModel = hireAppliedResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [acceptJobProposals] will return the [AcceptProposalResponse].
  static Future<AcceptProposalResponse> acceptJobProposals(
      AcceptTranslatorProposal acceptTranslatorProposal) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.acceptJobsProposals,
        body: acceptTranslatorProposalToJson(acceptTranslatorProposal));
    AcceptProposalResponse responseModel;
    if (response != null) {
      responseModel = acceptProposalResponseFromJson(response.body.toString());
    }

    return responseModel;
  }
}
