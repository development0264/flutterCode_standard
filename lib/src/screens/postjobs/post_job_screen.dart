import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/change_page_actions.dart';
import 'package:khontext/redux/actions/postjobs/fetch_drawer_data_actions.dart';
import 'package:khontext/redux/actions/postjobs/move_backward_actions.dart';
import 'package:khontext/redux/actions/postjobs/move_forward_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/screens/postjobs/jobsmodules/post_job_review.dart';
import 'package:khontext/src/screens/postjobs/jobsmodules/postjobdescription/post_job_description.dart';
import 'package:khontext/src/screens/postjobs/jobsmodules/postjoblanguages/post_job_language.dart';
import 'package:khontext/src/screens/postjobs/jobsmodules/postjobschedule/post_job_schedule.dart';
import 'package:khontext/src/screens/postjobs/jobsmodules/postjobvisibility/post_job_visibility.dart';
import 'package:khontext/src/screens/postjobs/post_jobs_navigation_drawer.dart';
import 'package:khontext/utils/palette.dart';

import 'jobsmodules/postjoblocality/post_job_locality.dart';

class PostJobPage extends StatefulWidget {
  final String jobId;

  const PostJobPage({Key key, this.jobId}) : super(key: key);

  @override
  _PostJobPageState createState() => _PostJobPageState();
}

class _PostJobPageState extends State<PostJobPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PostJobsScreenModel>(
      converter: (store) => PostJobsScreenModel(
        postJobsState: store.state.postJobsState,
        moveForwardDispatch: (data) => store.dispatch(MoveForwardAction(data: data)),
        moveBackwardDispatch: (data) => store.dispatch(MoveBackwardAction(data: data)),
        changePage: (index) => store.dispatch(ChangeCurrentPageAction(currentPage: index)),
      ),
      onInit: (store) => store.dispatch(DrawerDataFetchAction(context: context)),
      builder: (BuildContext context, PostJobsScreenModel model) {
        // model.postJobsState.postedModel.filters = new PostedJobsFilters(jobType: 'Active');
        return Scaffold(
          appBar: _appBarUi(model),
          body: _pageUi(model),
          drawer: PostJobDrawer(),
        );
      },
    );
  }

  /// Widget function which gives the app bar for the entire post a job module.
  /// The title of the app bar will change on the base of the current working page.
  Widget _appBarUi(PostJobsScreenModel model) {
    return AppBar(
      title: model.postJobsState.jobsPostList.isNotEmpty
          ? FormBuilderText(message: model.postJobsState.jobsPostList[model.postJobsState.currentPage].moduleTitle)
          : null,
      backgroundColor: Palette.AppThemeColor,
    );
  }

  /// Widget function which gives the page UI
  Widget _pageUi(PostJobsScreenModel model) {
    switch (model.postJobsState.currentPage) {
      case 0:
        return PostJobDescription(jobId: widget.jobId);
      case 1:
        return PostJobLanguage(moveBackward: (data) => model.moveBackwardDispatch(data), jobId: widget.jobId);
      case 2:
        return PostJobLocality(moveBackward: (data) => model.moveBackwardDispatch(data), jobId: widget.jobId);
      case 3:
        return PostJobVisibility(moveBackward: (data) => model.moveBackwardDispatch(data), jobId: widget.jobId);
      case 4:
        return PostJobSchedule(moveBackward: (data) => model.moveBackwardDispatch(data), jobId: widget.jobId);
      case 5:
        return PostJobReview(editJob: (index) => model.changePage(index == 5 ? 0 : index), jobId: widget.jobId);
      default:
        return PostJobDescription(jobId: widget.jobId);
    }
  }
}

class PostJobsScreenModel {
  final PostJobsState postJobsState;
  final Function moveForwardDispatch;
  final Function moveBackwardDispatch;
  final Function changePage;

  PostJobsScreenModel({this.postJobsState, this.moveForwardDispatch, this.moveBackwardDispatch, this.changePage});
}
