import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/post_job_language_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_languages_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/posted_jobs_filter_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class JobsFilter extends StatefulWidget {
  final PostedJobsFilterModel model;
  final Function onCancelPress;
  final Function onSaveButtonPress;
  final Function onResetButtonPress;

  const JobsFilter(
      {Key key, this.onCancelPress, this.model, this.onSaveButtonPress, this.onResetButtonPress})
      : super(key: key);

  @override
  _JobsFilterState createState() => _JobsFilterState();
}

class _JobsFilterState extends State<JobsFilter> {
  /// Strings which provides the selected values.
  String selectedSourceLanguage, selectedDestinationLanguage;
  List<SpecializationsData> selectedSpecializations = [];

  /// Local model to redux.store and save.
  PostedJobsFilterModel currentModel = PostedJobsFilterModel();

  /// Store instance to use further
  Store<AppState> store;

  /// States of the application
  PostJobLanguageState postJobLanguageState;
  List<LanguagesData> jobLanguagesData;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    postJobLanguageState = store.state.postJobLanguageState;
    jobLanguagesData = postJobLanguageState.languagesResponseModel.data;
    if (jobLanguagesData == null) {
      store.dispatch(LanguagesEssentialsFetchAction(jobId: null));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PostJobLanguageViewModel>(
      converter: (store) => PostJobLanguageViewModel(
          store: store, postJobLanguageState: store.state.postJobLanguageState),
      builder: (context, vm) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 15.0,
              bottom: 15.0,
              left: Utils.screenWidth * 0.05,
              right: Utils.screenWidth * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderDropdown<String>(
                  name: Constants.sourceLanguageText,
                  initialValue: selectedSourceLanguage,
                  hint: FormBuilderText(
                      message: FormBuilderLocalizations.of(context).fromLanguageText,
                      textStyle: Styles.customTextStyle(textSize: 16.0)),
                  onChanged: (val) => onFromLanguageChanged(
                      val, vm?.postJobLanguageState?.languagesResponseModel?.data),
                  validator: FormBuilderValidators.required(context,
                      errorText: FormBuilderLocalizations.of(context).emptyFromLangErrorText),
                  decoration: Styles.textInputDecoration(),
                  items: vm?.postJobLanguageState?.languagesResponseModel?.data
                      ?.map((fromLang) =>
                          _commonDropDownItem(value: fromLang.languageId, message: fromLang.name))
                      ?.toList(),
                ),
                const SizedBox(height: 15.0),
                FormBuilderDropdown<String>(
                  name: Constants.destinationLanguageText,
                  initialValue: selectedDestinationLanguage,
                  hint: FormBuilderText(
                      message: FormBuilderLocalizations.of(context).toLanguageText,
                      textStyle: Styles.customTextStyle(textSize: 16.0)),
                  onChanged: (val) => onToLanguageChanged(
                      val, vm?.postJobLanguageState?.languagesResponseModel?.data),
                  validator: FormBuilderValidators.required(context,
                      errorText: FormBuilderLocalizations.of(context).emptyToLangErrorText),
                  decoration: Styles.textInputDecoration(),
                  items: vm?.postJobLanguageState?.languagesResponseModel?.data
                      ?.map((toLang) =>
                          _commonDropDownItem(value: toLang.languageId, message: toLang.name))
                      ?.toList(),
                ),
                const SizedBox(height: 8.0),
                _actionButtons(),
              ],
            ),
          ),
        );
      },
    );
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

  /// Widget function for the buttons of cancel/save when the user is in the edit mode.
  Widget _actionButtons() {
    return Row(
      children: [
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            backgroundColor: Colors.white,
            btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).cancelText,
              textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor),
            ),
            onPressed: widget.onCancelPress,
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: BaseButtonWidget(
              minWidth: Utils.screenWidth,
              backgroundColor: Palette.AppThemeColor,
              btnChild: FormBuilderText(
                message: FormBuilderLocalizations.of(context).filterText,
                textStyle: Styles.customTextStyle(textColor: Colors.white),
              ),
              onPressed: () {
                widget.onSaveButtonPress(currentModel);
              }),
        ),
      ],
    );
  }

  /// Simple text widget used for the hint used in the dropdowns
  Widget hintWidget(String hintText) {
    return FormBuilderText(message: hintText, textStyle: Styles.customTextStyle(textSize: 16.0));
  }

  /// Group of functions which are used for the changes.
  void onFromLanguageChanged(String value, List<LanguagesData> list) {
    selectedSourceLanguage = value;
    currentModel.fromLanguage = list?.firstWhere((element) => element.languageId == value)?.name;
  }

  void onToLanguageChanged(String value, List<LanguagesData> list) {
    selectedDestinationLanguage = value;
    currentModel.toLanguage = list?.firstWhere((element) => element.languageId == value)?.name;
  }

  void onSpecializationsChanged(List<SpecializationsData> data) {
    selectedSpecializations = data;
  }
}

class PostJobLanguageViewModel {
  final Store<AppState> store;
  final PostJobLanguageState postJobLanguageState;

  PostJobLanguageViewModel({this.store, this.postJobLanguageState});
}
