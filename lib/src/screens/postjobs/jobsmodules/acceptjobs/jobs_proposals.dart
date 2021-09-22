import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/accept_jobs_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/applyjobs/translate_apply_jobs_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/models/postedjobs/post_jobs_list_response_model.dart';
import 'package:khontext/src/models/postjobs/acceptjobs/accept_translator_proposal_model.dart';
import 'package:khontext/src/models/postjobs/acceptjobs/hire_applied_response_model.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class JobsProposalsPage extends StatefulWidget {
  final JobsListData jobsModel;

  const JobsProposalsPage({Key key, this.jobsModel}) : super(key: key);

  @override
  _JobsProposalsPageState createState() => _JobsProposalsPageState();
}

class _JobsProposalsPageState extends State<JobsProposalsPage> {
  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarTitle(),
      body: StoreConnector<AppState, JobProposalsViewModel>(
        converter: (store) => JobProposalsViewModel(store.state.translateApplyJobsState),
        onInit: (store) => store.dispatch(JobProposalsFetchAction(jobId: widget.jobsModel.jobId)),
        builder: (context, vm) {
          if (vm.translateApplyJobsState.isLoading) {
            return BaseLoadingWidget();
          } else if (!vm.translateApplyJobsState.isLoading &&
              (vm.translateApplyJobsState.hireAppliedData == null ||
                  vm.translateApplyJobsState.hireAppliedData.appliedUsers.isEmpty)) {
            return ErrorTextWidget(error: 'No data found');
          }
          return _jobsProposalsUI(vm);
        },
      ),
    );
  }

  /// Widget function which gives the ui for the app bar, have the text favorites.
  Widget _appBarTitle() {
    return AppBar(
      centerTitle: true,
      title: FormBuilderText(message: 'Job Proposals'),
      backgroundColor: Palette.AppThemeColor,
    );
  }

  Widget _jobsProposalsUI(JobProposalsViewModel vm) {
    return ListView.builder(
      itemCount: vm.translateApplyJobsState.hireAppliedData.appliedUsers.length,
      itemBuilder: (context, index) {
        return _singleItem(
            appliedUser: vm.translateApplyJobsState.hireAppliedData.appliedUsers[index]);
      },
    );
  }

  Widget _singleItem({AppliedUser appliedUser}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _commonCardWidget(
          children: [
            FormBuilderText(
              message: appliedUser.user.firstName,
              textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => onAcceptButtonClick(appliedUser),
              child: FormBuilderText(
                message: 'Accept',
                textStyle: Styles.customTextStyle(textSize: 14.0),
              ),
            ),
          ],
          onCardTap: () {},
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  /// Widget function which returns the ui for the card widget
  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return FormBuilderCard(
      onCardTap: onCardTap,
      shadowColor: Palette.AppThemeColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }

  /// Function for the accept button click
  void onAcceptButtonClick(AppliedUser appliedUser) {
    store.dispatch(
      AcceptJobProposalsAction(
        context: context,
        acceptTranslatorProposal: AcceptTranslatorProposal(
          jobId: widget.jobsModel.jobId,
          translatorUserId: appliedUser.user.id,
          isAccept: true,
        ),
      ),
    );
  }
}

class JobProposalsViewModel {
  final TranslateApplyJobsState translateApplyJobsState;

  JobProposalsViewModel(this.translateApplyJobsState);
}
