import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/change_page_actions.dart';
import 'package:khontext/redux/actions/postjobs/fetch_drawer_data_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/models/postjobs/post_job_status_model.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';

/// [PostJobDrawer] gives the drawer widget for the post a job module.
/// This module will show the current status of the post job of a user.
/// User can move on to the random screen from the drawer. This drawer also shows which section have been completed.
class PostJobDrawer extends StatefulWidget {
  final Function onDrawerTap;

  const PostJobDrawer({Key key, this.onDrawerTap}) : super(key: key);

  @override
  _PostJobDrawerState createState() => _PostJobDrawerState();
}

class _PostJobDrawerState extends State<PostJobDrawer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PostJobsDrawerModel>(
      converter: (store) => PostJobsDrawerModel(
        postJobsState: store.state.postJobsState,
        changePage: (index) => store.dispatch(ChangeCurrentPageAction(currentPage: index)),
      ),
      onInit: (store) => store.dispatch(DrawerDataFetchAction(context: context)),
      builder: (BuildContext context, PostJobsDrawerModel pm) {
        if (pm.postJobsState.jobsPostList.isEmpty) {
          return Container(child: Center(child: CircularProgressIndicator()));
        }
        return Drawer(child: _drawerChild(pm));
      },
    );
  }

  /// Widget function which gives the UI for the drawer data.
  Widget _drawerChild(PostJobsDrawerModel pm) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Container(color: Palette.AppThemeColor),
          ),
          const SizedBox(height: 5.0),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: pm.postJobsState.jobsPostList.length,
            itemBuilder: (listContext, index) {
              return singleDrawerItem(pm.postJobsState.jobsPostList[index], index, pm);
            },
          ),
        ],
      ),
    );
  }

  /// Widget function for the single drawer item.
  /// On click of this single item, the user moves on to the next screen.
  Widget singleDrawerItem(PostJobsStatusModel singleModel, int index, PostJobsDrawerModel pm) {
    return InkWell(
      onTap: () {
        // if(singleModel.moduleDoneStatus){
        //   Navigator.of(context).pop();
        //   pm.changePage(index);
        // }
        Navigator.of(context).pop();
        pm.changePage(index);
      },
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        color: pm.postJobsState.currentPage == index ? Colors.grey[350] : Colors.transparent,
        child: Row(
          children: [
            Icon(
              Icons.credit_card,
              color: singleModel.moduleDoneStatus ? Colors.green : Colors.black,
              size: Utils.screenWidth * 0.07,
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: FormBuilderText(
                message: singleModel.moduleTitle,
                textStyle: Styles.customTextStyle(
                  textSize: 18.0,
                  textColor: singleModel.moduleDoneStatus ? Colors.green : Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            Icon(
              Icons.done,
              color: singleModel.moduleDoneStatus ? Colors.green : Colors.black,
              size: Utils.screenWidth * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}

class PostJobsDrawerModel {
  final PostJobsState postJobsState;
  final Function changePage;

  PostJobsDrawerModel({this.postJobsState, this.changePage});
}
