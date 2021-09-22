import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorjobs/apply_job_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/applyjobs/translate_apply_jobs_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/models/translator/translatorjobs/apply_jobs_list_response.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class AppliedJobsPage extends StatefulWidget {
  const AppliedJobsPage({Key key}) : super(key: key);

  @override
  _AppliedJobsPageState createState() => _AppliedJobsPageState();
}

class _AppliedJobsPageState extends State<AppliedJobsPage> {
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
      body: StoreConnector<AppState, AppliedJobsViewModel>(
        converter: (store) =>
            AppliedJobsViewModel(translateApplyJobsState: store.state.translateApplyJobsState),
        onInit: (store) => store.dispatch(ApplyJobsListFetchAction()),
        builder: (context, vm) {
          if (vm.translateApplyJobsState.isLoading) {
            return BaseLoadingWidget();
          } else if (!vm.translateApplyJobsState.isLoading &&
              vm.translateApplyJobsState.applyJobsList.isEmpty) {
            return ErrorTextWidget(error: 'No data found');
          }
          return _appliedJobsUI(vm);
        },
      ),
    );
  }

  /// Widget function which gives the ui for the app bar, have the text favorites.
  Widget _appBarTitle() {
    return AppBar(
      centerTitle: true,
      title: FormBuilderText(message: 'Applied Jobs'),
      backgroundColor: Palette.AppThemeColor,
    );
  }

  Widget _appliedJobsUI(AppliedJobsViewModel vm) {
    return ListView.builder(
      itemCount: vm.translateApplyJobsState.applyJobsList.length,
      itemBuilder: (context, index) {
        return _singleItem(applyJobsData: vm.translateApplyJobsState.applyJobsList[index]);
      },
    );
  }

  Widget _singleItem({ApplyJobsData applyJobsData}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _commonCardWidget(
          children: [
            FormBuilderText(
              message: applyJobsData.description,
              textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () =>
                  store.dispatch(DeleteApplyJobsAction(applyJobId: applyJobsData.applyJobId)),
              child: FormBuilderText(
                message: 'Remove',
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
}

class AppliedJobsViewModel {
  final TranslateApplyJobsState translateApplyJobsState;

  AppliedJobsViewModel({this.translateApplyJobsState});
}
