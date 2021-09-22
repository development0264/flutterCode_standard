import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorlanguage/translator_language_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/translator/translatorlanguage/add_update_language_request.dart';
import 'package:khontext/src/models/translator/translatorlanguage/language_list_response.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorlanguage/translator_language_page.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class LanguageDialog extends StatefulWidget {
  final bool isUpdate;
  final PostJobLanguageViewModel vm;
  final LanguageListData languageListData;

  const LanguageDialog({Key key, this.isUpdate, this.vm, this.languageListData}) : super(key: key);

  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  /// Global key for maintaining the state of the form.
  final _translatorLanguageFormKey = GlobalKey<FormBuilderState>();

  /// Strings which provides the selected values.
  String selectedLanguage;
  List<SpecializationsData> selectedSpecializations = [];

  /// Store for the dispatch of the events.
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    if (widget.languageListData != null) {
      selectedLanguage = widget.languageListData.languagesResponse.languageId;
      selectedSpecializations = widget.languageListData.specializationsResponses;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 3.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
        child: Column(
          children: [
            FormBuilderText(
              message: widget.isUpdate
                  ? FormBuilderLocalizations.of(context).updateLanguageText
                  : FormBuilderLocalizations.of(context).addLanguageText,
              textStyle: Styles.customTextStyle(fontWeight: FontWeight.w500, textSize: 18.0),
            ),
            const SizedBox(height: 15.0),
            languageForm(),
          ],
        ),
      ),
    );
  }

  /// Widget function which will contain the ui for the language from.
  Widget languageForm() {
    return FormBuilder(
      key: _translatorLanguageFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderDropdown<String>(
            name: Constants.languageText,
            initialValue: selectedLanguage,
            hint: FormBuilderText(
                message: FormBuilderLocalizations.of(context).fromLanguageText,
                textStyle: Styles.customTextStyle(textSize: 16.0)),
            onChanged: (val) => onLanguageChanged(val),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).emptyFromLangErrorText),
            decoration: Styles.textInputDecoration(),
            items: widget.vm?.postJobLanguageState?.languagesResponseModel?.data
                ?.map((fromLang) =>
                    _commonDropDownItem(value: fromLang.languageId, message: fromLang.name))
                ?.toList(),
          ),
          const SizedBox(height: 15.0),
          FormBuilderChipsInput<SpecializationsData>(
            decoration:
                InputDecoration(labelText: FormBuilderLocalizations.of(context).specializationText),
            name: Constants.specializationsText,
            maxChips: 5,
            focusNode: new FocusNode(),
            initialValue: selectedSpecializations,
            onChanged: (chips) => onSpecializationsChanged(chips),
            findSuggestions: (String query) => chipSuggestions(query, widget.vm),
            chipBuilder: (context, state, specialization) =>
                chipBuilder(context, state, specialization),
            suggestionBuilder: (context, state, data) => suggestionsBuilder(state, data),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).selectSpecializationsErrorText),
          ),
          const SizedBox(height: 15.0),
          _actionButtons(context),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }

  /// Function which takes in the chip query and gives the response as the list of [SpecializationsData]
  List<SpecializationsData> chipSuggestions(String query, PostJobLanguageViewModel vm) {
    if (query.isNotEmpty &&
        vm?.postJobLanguageState?.specializationsResponseModel?.data?.isNotEmpty == true) {
      var lowercaseQuery = query.toLowerCase();
      return vm.postJobLanguageState.specializationsResponseModel.data.where((specialization) {
        return specialization.name.toLowerCase().contains(query.toLowerCase()) ||
            specialization.name.toLowerCase().contains(query.toLowerCase());
      }).toList(growable: false)
        ..sort((a, b) => a.name
            .toLowerCase()
            .indexOf(lowercaseQuery)
            .compareTo(b.name.toLowerCase().indexOf(lowercaseQuery)));
    } else {
      return vm.postJobLanguageState.specializationsResponseModel.data;
    }
  }

  /// Widget function for the common drop down item.
  DropdownMenuItem<String> _commonDropDownItem({String value, String message}) {
    return DropdownMenuItem<String>(
      value: value,
      child: FormBuilderText(
        message: message,
        textStyle: Styles.customTextStyle(textSize: 18.0),
      ),
    );
  }

  /// Widget function which gives the ui for the single input chip.
  Widget chipBuilder(
      BuildContext context, ChipsInputState<SpecializationsData> state, SpecializationsData data) {
    return InputChip(
      key: ObjectKey(data),
      label: Text(data.name),
      onDeleted: () => state.deleteChip(data),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  /// Widget function which gives the ui for the chip suggestions list.
  Widget suggestionsBuilder(ChipsInputState<SpecializationsData> state, SpecializationsData data) {
    return ListTile(
      key: ObjectKey(data),
      title: Text(data.name),
      onTap: () => state.selectSuggestion(data),
    );
  }

  /// Widget function for the buttons of cancel/save/update when the user is in the edit mode.
  Widget _actionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            backgroundColor: Colors.white,
            btnChild: FormBuilderText(
                message: FormBuilderLocalizations.of(context).cancelText,
                textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            btnChild: FormBuilderText(
              message: widget.isUpdate
                  ? FormBuilderLocalizations.of(context).updateText
                  : FormBuilderLocalizations.of(context).saveText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: () => onSaveClicked(),
          ),
        ),
      ],
    );
  }

  /// Group of functions which takes place when the state changes happens.
  /// This includes [onLanguageChanged], [onSpecializationsChanged], [onSaveClicked]
  void onLanguageChanged(String value) {
    selectedLanguage = value;
  }

  void onSpecializationsChanged(List<SpecializationsData> data) {
    selectedSpecializations = data;
  }

  void onSaveClicked() {
    if (_translatorLanguageFormKey.currentState.validate()) {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      AddUpdateLanguageRequest requestModel;
      List<String> specializationsString =
          selectedSpecializations.map((e) => e.specializationId).toList();
      if (widget.isUpdate) {
        requestModel = AddUpdateLanguageRequest(
          translatorLanguageId: widget.languageListData.translatorLanguagesId,
          userId: userId,
          languageId: selectedLanguage,
          specializationIds: specializationsString,
        );
      } else {
        requestModel = AddUpdateLanguageRequest(
          translatorLanguageId: '',
          userId: userId,
          languageId: selectedLanguage,
          specializationIds: specializationsString,
        );
      }
      store.dispatch(
        AddUpdateTranslateLanguageAction(addUpdateLanguageRequest: requestModel),
      );
      Navigator.of(context).pop();
    }
  }
}
