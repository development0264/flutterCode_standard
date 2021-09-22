import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/change_translate_page_actions.dart';
import 'package:khontext/redux/actions/translate/fetch_translate_drawer_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';

/// [TranslateDrawer] gives the drawer widget for the translate page module.
/// This module will show the current status of the translate page.
/// User can move on to the random screen from the drawer. This drawer also shows which section have been completed.
class TranslateDrawer extends StatefulWidget {
  final Function onDrawerTap;

  const TranslateDrawer({Key key, this.onDrawerTap}) : super(key: key);

  @override
  _TranslateDrawerState createState() => _TranslateDrawerState();
}

class _TranslateDrawerState extends State<TranslateDrawer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TranslatePageDrawerModel>(
      converter: (store) => TranslatePageDrawerModel(
        translateState: store.state.translateState,
        changePage: (index) => store.dispatch(ChangeTranslatePageAction(currentPage: index)),
      ),
      onInit: (store) => store.dispatch(TranslateDrawerDataFetchAction(context: context)),
      builder: (BuildContext context, TranslatePageDrawerModel pm) {
        if (pm.translateState.translateDrawerList.isEmpty) {
          return Container(child: Center(child: CircularProgressIndicator()));
        }
        return Drawer(child: _drawerChild(pm));
      },
    );
  }

  /// Widget function which gives the UI for the drawer data.
  Widget _drawerChild(TranslatePageDrawerModel pm) {
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
            itemCount: pm.translateState.translateDrawerList.length,
            itemBuilder: (listContext, index) {
              return singleDrawerItem(pm.translateState.translateDrawerList[index], index, pm);
            },
          ),
        ],
      ),
    );
  }

  /// Widget function for the single drawer item.
  /// On click of this single item, the user moves on to the next screen.
  Widget singleDrawerItem(String title, int index, TranslatePageDrawerModel pm) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        pm.changePage(index);
      },
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        color: pm.translateState.currentPage == index ? Colors.grey[350] : Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: FormBuilderText(
                message: title,
                textStyle: Styles.customTextStyle(
                  textSize: 18.0,
                  textColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TranslatePageDrawerModel {
  final TranslateState translateState;
  final Function changePage;

  TranslatePageDrawerModel({this.translateState, this.changePage});
}
