import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/post_job_language_actions.dart';
import 'package:khontext/redux/actions/translate/translatorlanguage/translator_language_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_languages_state.dart';
import 'package:khontext/redux/states/translate/translate_language_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator/translatorlanguage/language_list_response.dart';
import 'package:khontext/src/screens/payments/payment_header.dart';
import 'package:khontext/src/screens/translate/translate_module_dialogs.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/add_module_widget.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class TranslatorLanguagePage extends StatefulWidget {
  const TranslatorLanguagePage({Key key}) : super(key: key);

  @override
  _TranslatorLanguagePageState createState() => _TranslatorLanguagePageState();
}

class _TranslatorLanguagePageState extends State<TranslatorLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PostJobLanguageViewModel>(
      converter: (store) => PostJobLanguageViewModel(
        store: store,
        postJobLanguageState: store.state.postJobLanguageState,
        translateLanguageState: store.state.translateLanguageState,
      ),
      onInit: (store) {
        store.dispatch(TranslateLanguageFetchAction());
        store.dispatch(LanguagesEssentialsFetchAction());
      },
      builder: (context, vm) {
        if (vm.postJobLanguageState.isLoading) {
          return BaseLoadingWidget();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Utils.screenWidth * 0.05, vertical: Utils.screenHeight * 0.02),
              child: PaymentHeader(
                headerTitle: FormBuilderLocalizations.of(context).languageText,
                headerWidget: addLanguageWidget(vm),
              ),
            ),
            Expanded(child: languageList(vm.translateLanguageState, vm)),
          ],
        );
      },
    );
  }

  /// Widget function which gives functionality for the add card
  Widget addLanguageWidget(PostJobLanguageViewModel vm) {
    return AddModuleWidget(
      moduleText: FormBuilderLocalizations.of(context).addLanguageText,
      onAddClick: () => TranslateDialog().showTranslateLanguageDialog(
        context,
        isUpdate: false,
        vm: vm,
        ld: null,
      ),
    );
  }

  /// Widget function which returns the list of the languages.
  Widget languageList(TranslateLanguageState translateLanguageState, PostJobLanguageViewModel vm) {
    if (translateLanguageState?.translatorLanguageListResponse?.isSuccessful == true &&
        translateLanguageState?.translatorLanguageListResponse?.data?.isNotEmpty == true) {
      return ListView.builder(
        itemCount: translateLanguageState.translatorLanguageListResponse.data.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _singleItem(translateLanguageState.translatorLanguageListResponse.data[index], vm);
        },
      );
    } else {
      return ErrorTextWidget(error: "No Languages added");
    }
  }

  /// Single item UI for the language
  Widget _singleItem(LanguageListData languageListData, PostJobLanguageViewModel vm) {
    return _commonCardWidget(
      child: Row(
        children: [
          Expanded(child: FormBuilderText(message: languageListData.languagesResponse.name)),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () => onEditClicked(vm, languageListData),
            child: Icon(Icons.edit, size: 21, color: Palette.AppThemeColor),
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () => onDeleteClicked(vm, languageListData),
            child: Icon(Icons.delete, size: 21, color: Palette.AppThemeColor),
          ),
        ],
      ),
    );
  }

  /// Widget function which will give the base card view.
  Widget _commonCardWidget({Widget child}) {
    return FormBuilderCard(
      onCardTap: () {},
      child: child,
    );
  }

  /// Click events for the icons
  void onEditClicked(PostJobLanguageViewModel vm, LanguageListData languageListData) {
    TranslateDialog().showTranslateLanguageDialog(
      context,
      isUpdate: true,
      vm: vm,
      ld: languageListData,
    );
  }

  void onDeleteClicked(PostJobLanguageViewModel vm, LanguageListData languageListData) {
    vm.store.dispatch(
        DeleteTranslateLanguageAction(languageId: languageListData.translatorLanguagesId));
  }
}

class PostJobLanguageViewModel {
  final Store<AppState> store;
  final PostJobLanguageState postJobLanguageState;
  final TranslateLanguageState translateLanguageState;

  PostJobLanguageViewModel({this.store, this.postJobLanguageState, this.translateLanguageState});
}
