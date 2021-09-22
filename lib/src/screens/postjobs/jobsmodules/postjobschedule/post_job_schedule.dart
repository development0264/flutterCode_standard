import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/post_job_schedule_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_schedule_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/posted_jobs_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_request_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';
import 'package:khontext/src/screens/postjobs/bottom_navigations_buttons_widget.dart';
import 'package:khontext/src/screens/postjobs/jobsmodules/postjobschedule/post_job_schedule_dialog.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/add_module_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class PostJobSchedule extends StatefulWidget {
  final String jobId;
  final Function moveBackward;

  const PostJobSchedule({Key key, this.jobId, this.moveBackward}) : super(key: key);

  @override
  _PostJobScheduleState createState() => _PostJobScheduleState();
}

class _PostJobScheduleState extends State<PostJobSchedule> {
  /// Current [PostedJobsSchedule] which stores the current state at the time of saving.
  PostedJobsSchedule addedPostJobSchedule = PostedJobsSchedule();

  List<ScheduleDateTime> postJobsScheduleList = [];

  /// Store instance to use further
  Store<AppState> store;

  JobScheduleData jobScheduleData;
  JobDescriptionData jobDescriptionData;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    jobScheduleData = store.state.postJobScheduleState?.jobScheduleResponseModel?.data;
    jobDescriptionData = store.state.postJobDescriptionState.postJobDescriptionResponseModel.data;
    if (jobScheduleData == null) {
      store.dispatch(PostJobScheduleFetchAction(
          jobId: widget.jobId != null ? widget.jobId : jobDescriptionData.jobId));
    } else {
      postJobsScheduleList = jobScheduleData?.scheduleDateTimes ?? [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, JobScheduleViewModel>(
      converter: (store) => JobScheduleViewModel(store, store.state.postJobScheduleState),
      builder: (context, vm) {
        if (vm?.jobScheduleState?.jobScheduleResponseModel?.data?.scheduleDateTimes?.isNotEmpty ==
            true) {
          postJobsScheduleList =
              vm.jobScheduleState.jobScheduleResponseModel.data.scheduleDateTimes;
        }
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: schedulePageView()),
                const SizedBox(height: 12.0),
                postJobButtonsNavigation(),
              ],
            ),
            if (vm.jobScheduleState.isLoading) ...[
              BaseLoadingWidget(),
            ]
          ],
        );
      },
    );
  }

  /// Widget function for the schedule page view
  Widget schedulePageView() {
    return Column(
      children: [
        addScheduleWidget(),
        const SizedBox(height: 15.0),
        Expanded(
          child: postJobsScheduleList.isNotEmpty
              ? scheduleLists()
              : Center(
                  child: FormBuilderText(
                      message: FormBuilderLocalizations.of(context).noScheduleText)),
        ),
      ],
    );
  }

  /// Widget function which gives functionality for the add schedule
  Widget addScheduleWidget() {
    return Padding(
      padding: EdgeInsets.only(right: Utils.screenWidth * 0.05, top: Utils.screenHeight * 0.02),
      child: AddModuleWidget(
        moduleText: FormBuilderLocalizations.of(context).addScheduleText,
        onAddClick: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) {
              return PostJobScheduleDialog(
                currentSaved: (ScheduleDateTime data) {
                  setState(() {
                    postJobsScheduleList.add(data);
                  });
                },
              );
            },
          );
        },
      ),
    );
  }

  /// Widget function which gives the listview for the schedule lists
  Widget scheduleLists() {
    return ListView.builder(
      itemCount: postJobsScheduleList.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return _singleScheduleItem(postJobsScheduleList[index]);
      },
    );
  }

  /// Widget function which gives the single item UI
  Widget _singleScheduleItem(ScheduleDateTime model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: _commonCardWidget(
        onCardTap: () {},
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  _scheduleRow(FormBuilderLocalizations.of(context).startDateText,
                      model.fromDateTime.toString()),
                  const SizedBox(height: 5.0),
                  _scheduleRow(FormBuilderLocalizations.of(context).endDateText,
                      model.toDateTime.toString()),
                ],
              ),
            ),
            Column(
              children: [
                GestureDetector(child: Icon(Icons.edit), onTap: () => editSchedule(model)),
                const SizedBox(height: 10.0),
                GestureDetector(child: Icon(Icons.delete), onTap: () => deleteSchedule(model)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Widget function which will give the separate UI for the single row of the schedule.
  /// For eg. this widget will provide the UI for the Name and its value of a single schedule
  /// This have been used for the code optimizations and better performance.
  Widget _scheduleRow(String title, String message) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child:
                FormBuilderText(message: title, textStyle: Styles.customTextStyle(textSize: 16.0))),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 2,
          child: FormBuilderText(
              message: message,
              textStyle: Styles.customTextStyle(textSize: 16.0, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }

  Widget _commonCardWidget({Widget child, Function onCardTap}) {
    return FormBuilderCard(
      onCardTap: () => onCardTap(),
      child: child,
    );
  }

  /// Widget function which gives the bottom button navigation widget.
  /// This have two buttons, [BACK] and [NEXT].
  Widget postJobButtonsNavigation() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Utils.screenHeight * 0.02, horizontal: Utils.screenWidth * 0.05),
      child: PostJobBottomNavigation(
        moveAhead: () => moveAheadTap(),
        moveBackward: () => moveBackTap(),
        backEnabled: true,
        forwardEnabled: true,
      ),
    );
  }

  /// Group of functions which takes place when the state changes happens.
  /// This includes [moveBackTap], [moveAheadTap], [deleteSchedule] and
  /// [checkAllValidations].
  void moveAheadTap() {
    if (checkAllValidations()) {
      store.dispatch(
        AddJobScheduleAction(
          jobScheduleRequestModel: JobScheduleRequestModel(
            jobId: widget.jobId != null
                ? widget.jobId
                : jobDescriptionData?.jobId?.isNotEmpty == true
                    ? jobDescriptionData.jobId
                    : null,
            scheduleDateTime: postJobsScheduleList,
          ),
        ),
      );
    }
  }

  void moveBackTap() {
    addedPostJobSchedule.jobScheduleList = postJobsScheduleList;
    widget.moveBackward(addedPostJobSchedule);
  }

  bool checkAllValidations() {
    return postJobsScheduleList?.isNotEmpty;
  }

  /// Group of functions which will give the functionality on the schedules.
  void editSchedule(ScheduleDateTime model) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return PostJobScheduleDialog(
          editModel: model,
          currentSaved: (ScheduleDateTime data) {
            int currentDataIndex = postJobsScheduleList.indexOf(model);
            setState(() {
              postJobsScheduleList.replaceRange(currentDataIndex, currentDataIndex + 1, [data]);
            });
          },
        );
      },
    );
  }

  void deleteSchedule(ScheduleDateTime model) {
    setState(() {
      postJobsScheduleList.remove(model);
    });
  }
}

class JobScheduleViewModel {
  final Store<AppState> store;
  final PostJobScheduleState jobScheduleState;

  JobScheduleViewModel(this.store, this.jobScheduleState);
}
