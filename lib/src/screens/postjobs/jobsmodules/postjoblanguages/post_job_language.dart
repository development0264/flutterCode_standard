import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/post_job_language_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_languages_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/job_languages_request_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/job_languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/screens/postjobs/bottom_navigations_buttons_widget.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class PostJobLanguage extends StatefulWidget {
  final String jobId;
  final Function moveBackward;

  const PostJobLanguage({Key key, this.jobId, this.moveBackward}) : super(key: key);

  @override
  _PostJobLanguageState createState() => _PostJobLanguageState();
}

class _PostJobLanguageState extends State<PostJobLanguage> {
  /// Global key for maintaining the state of the form.
  final _jobLanguageFormKey = GlobalKey<FormBuilderState>();

  /// Strings which provides the selected values.
  String selectedSourceLanguage, selectedDestinationLanguage;
  List<SpecializationsData> selectedSpecializations = [];

  /// Store instance to use further
  Store<AppState> store;

  /// States of the application
  JobDescriptionData jobDescriptionData;
  JobLanguagesData jobLanguagesData;

  /// variable to set data only once.
  bool isSetOnce = false;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    jobDescriptionData = store.state.postJobDescriptionState.postJobDescriptionResponseModel.data;
    jobLanguagesData = store.state.postJobLanguageState.jobLanguagesResponseModel.data;
    if (jobLanguagesData == null) {
      store.dispatch(
          LanguagesEssentialsFetchAction(jobId: widget.jobId != null ? widget.jobId : jobDescriptionData?.jobId));
    } else {
      selectedSourceLanguage = jobLanguagesData.fromLanguage.languageId;
      selectedDestinationLanguage = jobLanguagesData.toLanguage.languageId;
      List<SpecializationsData> tempList = [];
      List<String> specializationIds = jobLanguagesData.specializationIds;
      for (int i = 0; i < specializationIds.length; i++) {
        tempList.add(store.state.postJobLanguageState.specializationsResponseModel.data
            .firstWhere((element) => element.specializationId == specializationIds[i]));
      }
      selectedSpecializations = tempList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PostJobLanguageViewModel>(
      converter: (store) =>
          PostJobLanguageViewModel(store: store, postJobLanguageState: store.state.postJobLanguageState),
      builder: (context, vm) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Utils.screenWidth * 0.05, vertical: Utils.screenHeight * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    languageForm(context, vm),
                    const SizedBox(height: 12.0),
                    postJobButtonsNavigation(),
                  ],
                ),
              ),
            ),
            if (vm.postJobLanguageState.isLoading) ...[
              BaseLoadingWidget(),
            ]
          ],
        );
      },
    );
  }

  Widget languageForm(BuildContext context, PostJobLanguageViewModel vm) {
    setData(vm.postJobLanguageState);
    return FormBuilder(
      key: _jobLanguageFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderDropdown<String>(
            name: Constants.sourceLanguageText,
            initialValue: selectedSourceLanguage,
            hint: FormBuilderText(
                message: FormBuilderLocalizations.of(context).fromLanguageText,
                textStyle: Styles.customTextStyle(textSize: 16.0)),
            onChanged: (val) => onFromLanguageChanged(val),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).emptyFromLangErrorText),
            decoration: Styles.textInputDecoration(),
            items: vm?.postJobLanguageState?.languagesResponseModel?.data
                ?.map((fromLang) => _commonDropDownItem(value: fromLang.languageId, message: fromLang.name))
                ?.toList(),
          ),
          const SizedBox(height: 15.0),
          FormBuilderDropdown<String>(
            name: Constants.destinationLanguageText,
            initialValue: selectedDestinationLanguage,
            hint: FormBuilderText(
                message: FormBuilderLocalizations.of(context).toLanguageText,
                textStyle: Styles.customTextStyle(textSize: 16.0)),
            onChanged: (val) => onToLanguageChanged(val),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).emptyToLangErrorText),
            decoration: Styles.textInputDecoration(),
            items: vm?.postJobLanguageState?.languagesResponseModel?.data
                ?.map((toLang) => _commonDropDownItem(value: toLang.languageId, message: toLang.name))
                ?.toList(),
          ),
          const SizedBox(height: 15.0),
          FormBuilderChipsInput<SpecializationsData>(
            decoration: InputDecoration(labelText: FormBuilderLocalizations.of(context).specializationText),
            name: Constants.specializationsText,
            maxChips: 5,
            focusNode: new FocusNode(),
            initialValue: selectedSpecializations,
            onChanged: (chips) => onSpecializationsChanged(chips),
            findSuggestions: (String query) => chipSuggestions(query, vm),
            chipBuilder: (context, state, specialization) => chipBuilder(context, state, specialization),
            suggestionBuilder: (context, state, data) => suggestionsBuilder(state, data),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).selectSpecializationsErrorText),
          ),
        ],
      ),
    );
  }

  /// Function which takes in the chip query and gives the response as the list of [SpecializationsData]
  List<SpecializationsData> chipSuggestions(String query, PostJobLanguageViewModel vm) {
    if (query.isNotEmpty && vm?.postJobLanguageState?.specializationsResponseModel?.data?.isNotEmpty == true) {
      var lowercaseQuery = query.toLowerCase();
      return vm.postJobLanguageState.specializationsResponseModel.data.where((specialization) {
        return specialization.name.toLowerCase().contains(query.toLowerCase()) ||
            specialization.name.toLowerCase().contains(query.toLowerCase());
      }).toList(growable: false)
        ..sort((a, b) =>
            a.name.toLowerCase().indexOf(lowercaseQuery).compareTo(b.name.toLowerCase().indexOf(lowercaseQuery)));
    } else {
      return vm.postJobLanguageState.specializationsResponseModel.data;
    }
  }

  /// Widget function which gives the ui for the single input chip.
  Widget chipBuilder(BuildContext context, ChipsInputState<SpecializationsData> state, SpecializationsData data) {
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

  /// Widget function which gives the bottom button navigation widget.
  /// This have two buttons, [BACK] and [NEXT].
  Widget postJobButtonsNavigation() {
    return PostJobBottomNavigation(
      moveAhead: () => moveAheadTap(),
      moveBackward: () => moveBackTap(),
      backEnabled: true,
      forwardEnabled: true,
    );
  }

  /// Group of functions which takes place when the state changes happens.
  /// This includes [onFromLanguageChanged], [onToLanguageChanged], [onSpecializationsChanged], [moveBackTap],
  /// [moveAheadTap] and [checkAllValidations].
  void onFromLanguageChanged(String value) {
    selectedSourceLanguage = value;
  }

  void onToLanguageChanged(String value) {
    selectedDestinationLanguage = value;
  }

  void onSpecializationsChanged(List<SpecializationsData> data) {
    selectedSpecializations = data;
  }

  void moveAheadTap() {
    String userId = Utils.getStringFromPrefs(Constants.userToken);
    if (checkAllValidations() && userId?.isNotEmpty == true) {
      List<String> specializationsString = selectedSpecializations.map((e) => e.specializationId).toList();
      store.dispatch(
        AddUpdateJobLanguagesAction(
          jobLanguagesRequestModel: JobLanguagesRequestModel(
            jobId: widget.jobId != null ? widget.jobId : jobDescriptionData.jobId,
            userId: userId,
            fromLanguageId: selectedSourceLanguage,
            toLanguageId: selectedDestinationLanguage,
            specializationIds: specializationsString,
          ),
        ),
      );
    }
  }

  void moveBackTap() {
    widget.moveBackward(null);
  }

  bool checkAllValidations() {
    return _jobLanguageFormKey.currentState.validate();
  }

  void setData(PostJobLanguageState postJobLanguageState) async {
    if (postJobLanguageState?.jobLanguagesResponseModel?.data != null) {
      selectedSourceLanguage = postJobLanguageState?.jobLanguagesResponseModel?.data?.fromLanguage?.languageId;
      selectedDestinationLanguage = postJobLanguageState?.jobLanguagesResponseModel?.data?.toLanguage?.languageId;
      List<SpecializationsData> tempList = [];
      List<String> specializationIds = postJobLanguageState.jobLanguagesResponseModel.data.specializationIds;
      for (int i = 0; i < specializationIds.length; i++) {
        tempList.add(postJobLanguageState.specializationsResponseModel.data
            .firstWhere((element) => element.specializationId == specializationIds[i]));
      }
      selectedSpecializations = tempList;
      if (_jobLanguageFormKey?.currentState != null) {
        _jobLanguageFormKey.currentState.fields[Constants.sourceLanguageText].didChange(selectedSourceLanguage);
        _jobLanguageFormKey.currentState.fields[Constants.destinationLanguageText]
            .didChange(selectedDestinationLanguage);
        _jobLanguageFormKey.currentState.fields[Constants.specializationsText].didChange(selectedSpecializations);
      }
    }
  }
}

class PostJobLanguageViewModel {
  final Store<AppState> store;
  final PostJobLanguageState postJobLanguageState;

  PostJobLanguageViewModel({this.store, this.postJobLanguageState});
}
