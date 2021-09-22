import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/change_translate_page_actions.dart';
import 'package:khontext/redux/actions/translate/fetch_translate_drawer_actions.dart';
import 'package:khontext/redux/actions/translate/translatorexperience/translator_experience_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/screens/translate/translate_navigaton_drawer.dart';
import 'package:khontext/src/screens/translate/translatemodules/translator_modules_export.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorlanguage/translator_language_page.dart';
import 'package:khontext/utils/palette.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TranslatePageModel>(
      distinct: true,
      converter: (store) => TranslatePageModel(
        translateState: store.state.translateState,
        changePage: (index) => store.dispatch(ChangeTranslatePageAction(currentPage: index)),
      ),
      onInit: (store) {
        store.dispatch(TranslateDrawerDataFetchAction(context: context));
        store.dispatch(EmploymentTypesFetchAction());
      },
      builder: (BuildContext context, TranslatePageModel vm) {
        return Scaffold(
          appBar: _appBarUi(vm),
          body: _pageUi(vm),
          drawer: TranslateDrawer(),
        );
      },
    );
  }

  /// Widget function which gives the app bar for the entire translate module.
  /// The title of the app bar will change on the base of the current working page.
  Widget _appBarUi(TranslatePageModel model) {
    return AppBar(
      title: model.translateState.translateDrawerList.isNotEmpty
          ? FormBuilderText(message: model.translateState.translateDrawerList[model.translateState.currentPage])
          : null,
      backgroundColor: Palette.AppThemeColor,
    );
  }

  Widget _pageUi(TranslatePageModel model) {
    switch (model.translateState.currentPage) {
      case 0:
        return TranslatorProfilePage();
      case 1:
        return TranslatorLanguagePage();
      case 2:
        return TranslatorExperiencePage();
      case 3:
        return TranslatorEducationPage();
      case 4:
        return TranslatorIdentificationPage();
      case 5:
        return TranslatorJobsPage();
      case 6:
        return TranslatorContractsPage();
      case 7:
        return TranslatorSchedulePage();
      case 8:
        return TranslatorEarningsPage();
      case 9:
        return TranslatorTaxPage();
      default:
        return TranslatorProfilePage();
    }
  }
}

class TranslatePageModel {
  final TranslateState translateState;
  final Function changePage;

  TranslatePageModel({this.translateState, this.changePage});
}
