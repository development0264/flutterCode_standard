import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/onboarding/onboarding_data_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingeducation/onboarding_education_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/onboarding/onboarding_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_scroll_view.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/onboarding_education_request_model.dart';
import 'package:khontext/src/screens/onboarding/onboarding/time_line_widget.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:path/path.dart' as p;
import 'package:redux/redux.dart';

class OnBoardingAddEducationPage extends StatefulWidget {
  const OnBoardingAddEducationPage({Key key}) : super(key: key);

  @override
  OnBoardingAddEducationPageState createState() => OnBoardingAddEducationPageState();
}

class OnBoardingAddEducationPageState extends State<OnBoardingAddEducationPage> {
  /// Global key for maintaining the state of the form.
  final _onBoardingEducationFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire sign in form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _studyFieldController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _activitiesAndSocietiesController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _docTitleController = TextEditingController();

  /// [FocusNode] for the entire sign in form.
  /// These [FocusNode] will give the current focus of a text field.
  final FocusNode _schoolFocus = FocusNode();
  final FocusNode _studyFieldFocus = FocusNode();
  final FocusNode _startDateFocus = FocusNode();
  final FocusNode _endDateFocus = FocusNode();
  final FocusNode _degreeFocus = FocusNode();
  final FocusNode _gradeFocus = FocusNode();
  final FocusNode _activitiesAndSocietiesFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final FocusNode _docTitleFocus = FocusNode();

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key schoolKey = Key(Constants.schoolKey);
  Key studyFieldKey = Key(Constants.studyFieldKey);
  Key startDateKey = Key(Constants.onBoardingEducationStartDateKey);
  Key endDateKey = Key(Constants.onBoardingEducationEndDateKey);
  Key degreeKey = Key(Constants.degreeKey);
  Key gradeKey = Key(Constants.gradeKey);
  Key activitiesAndSocietiesKey = Key(Constants.activitiesAndSocietiesKey);
  Key descriptionKey = Key(Constants.descriptionKey);
  Key applyButtonKey = Key(Constants.educationApplyButtonKey);

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter schoolState;
  StateSetter fieldOfStudyState;
  StateSetter startDateState;
  StateSetter endDateState;
  StateSetter degreeState;
  StateSetter gradeState;
  StateSetter activitiesState;
  StateSetter descriptionState;
  StateSetter titleDescState;
  StateSetter documentsState;

  /// [DateTime] variables which will give the flexibility to get and set the date time.
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  /// [bool] value which holds the toggle flags.
  bool hideEndDateFlag = false;

  /// [File] is the selected file, this file also handles the visibility of the add document button
  /// as only one document needs to be added.
  File selectedDocumentFile;
  FileOrDocumentInformationRequest fileOrDocumentInformationRequest;

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    initiateListeners();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      resizeToAvoidBottomInset: true,
      baseChild: StoreConnector<AppState, OnBoardingEducationViewModel>(
          converter: (store) => OnBoardingEducationViewModel(store.state.onBoardingState),
          builder: (context, vm) {
            checkError(vm);
            return Stack(
              children: [
                _onBoardEducationWidget(vm),
                if (vm.onBoardingState.isLoading) ...[BaseLoadingWidget()],
              ],
            );
          }),
    );
  }

  /// Widget function which gives ui for the on boarding address page
  Widget _onBoardEducationWidget(OnBoardingEducationViewModel vm) {
    return Column(
      children: [
        Expanded(
          child: FormBuilderScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                Center(
                  child: FormBuilderText(
                    message: FormBuilderLocalizations.of(context).educationText,
                    textStyle: Styles.customTextStyle(
                      textSize: Palette.largeFontSize,
                      textColor: Palette.DarkTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                TimeLineWidget(ticks: 2),
                Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
                FormBuilderText(
                  message: FormBuilderLocalizations.of(context).educationTellText,
                  textStyle: Styles.customTextStyle(
                      textSize: Palette.mediumFontSize,
                      textColor: Palette.DarkTextColor,
                      fontWeight: FontWeight.bold),
                ),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                _educationInputForm(),
                Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
                _attachDocument(),
              ],
            ),
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        BaseButtonWidget(
          key: applyButtonKey,
          minWidth: Utils.screenWidth,
          btnChild: FormBuilderText(
            message: FormBuilderLocalizations.of(context).applyText,
            textStyle: Styles.customTextStyle(textColor: Colors.white),
          ),
          onPressed: () => onApplyButtonClick(),
        ),
      ],
    );
  }

  /// Widget function which gives the ui for the education layout form
  Widget _educationInputForm() {
    return FormBuilder(
      key: _onBoardingEducationFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatefulBuilder(builder: (context, state) {
            this.schoolState = state;
            return FormBuilderTextField(
              key: schoolKey,
              name: Constants.school,
              controller: _schoolController,
              textInputAction: TextInputAction.next,
              focusNode: _schoolFocus,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).schoolText,
                focusNode: _schoolFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).schoolErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this.fieldOfStudyState = state;
            return FormBuilderTextField(
              key: studyFieldKey,
              name: Constants.fieldOfStudy,
              controller: _studyFieldController,
              textInputAction: TextInputAction.next,
              focusNode: _studyFieldFocus,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).fieldOfStudyText,
                focusNode: _studyFieldFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).fieldOfStudyErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this.startDateState = state;
            return FormBuilderDateTimePicker(
              key: startDateKey,
              name: Constants.startDate,
              controller: startDateController,
              initialValue: selectedStartDate,
              focusNode: _startDateFocus,
              inputType: InputType.date,
              onChanged: (newDateTime) => onStartDateChanged(newDateTime),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).startDateErrorText),
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).startDateYearText,
                focusNode: _startDateFocus,
              ),
            );
          }),
          StatefulBuilder(builder: (context, state) {
            this.endDateState = state;
            return Visibility(
              visible: !hideEndDateFlag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                  FormBuilderDateTimePicker(
                    key: endDateKey,
                    name: Constants.endDate,
                    controller: endDateController,
                    initialValue: selectedEndDate,
                    focusNode: _endDateFocus,
                    inputType: InputType.date,
                    onChanged: (newDateTime) => onEndDateChanged(newDateTime),
                    validator: FormBuilderValidators.required(context,
                        errorText: FormBuilderLocalizations.of(context).endDateErrorText),
                    decoration: Styles.textInputDecoration(
                      hint: FormBuilderLocalizations.of(context).endDateYearText,
                      focusNode: _endDateFocus,
                    ),
                  ),
                ],
              ),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          FormBuilderCheckbox(
            name: Constants.hideEndDate,
            decoration:
                Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
            initialValue: hideEndDateFlag,
            activeColor: Palette.AppThemeColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            contentPadding: EdgeInsets.zero,
            onChanged: (bool hide) => hideEndDateToggle(hide),
            title: FormBuilderText(
              message: FormBuilderLocalizations.of(context).studyHereText,
              textStyle: Styles.customTextStyle(
                  textSize: Palette.smallFontSize, textColor: Palette.DarkTextColor),
            ),
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this.degreeState = state;
            return FormBuilderTextField(
              key: degreeKey,
              name: Constants.degree,
              controller: _degreeController,
              textInputAction: TextInputAction.next,
              focusNode: _degreeFocus,
              decoration: Styles.textInputDecoration(
                  hint: FormBuilderLocalizations.of(context).degreeText, focusNode: _degreeFocus),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).degreeErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this.gradeState = state;
            return FormBuilderTextField(
              key: gradeKey,
              name: Constants.grade,
              controller: _gradeController,
              textInputAction: TextInputAction.next,
              focusNode: _gradeFocus,
              decoration: Styles.textInputDecoration(
                  hint: FormBuilderLocalizations.of(context).gradeText, focusNode: _gradeFocus),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).gradeErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this.activitiesState = state;
            return FormBuilderTextField(
              key: activitiesAndSocietiesKey,
              name: Constants.activitiesAndSocieties,
              controller: _activitiesAndSocietiesController,
              textInputAction: TextInputAction.next,
              maxLines: 3,
              minLines: 1,
              focusNode: _activitiesAndSocietiesFocus,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).activitiesAndSocietiesText,
                focusNode: _activitiesAndSocietiesFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).activitiesErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this.descriptionState = state;
            return FormBuilderTextField(
              key: descriptionKey,
              name: Constants.descriptionText,
              controller: _descriptionController,
              textInputAction: TextInputAction.done,
              maxLines: 3,
              minLines: 1,
              focusNode: _descriptionFocus,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).descriptionText,
                focusNode: _descriptionFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).descriptionErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).attachmentsText,
            textStyle: Styles.customTextStyle(
              textSize: Palette.largeFontSize,
              textColor: Palette.DarkTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// Widget function which gives the custom ui for the button of the add document.
  Widget _addDocumentButton() {
    return InkWell(
      onTap: () => pickEducationDocument(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.screenWidth * 0.04,
          vertical: Utils.screenHeight * 0.018,
        ),
        decoration: BoxDecoration(
          color: Palette.WhiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: Palette.DisabledBorderColor, width: 1),
        ),
        child: Row(
          children: [
            Icon(Icons.add, color: Palette.EnabledBorderColor, size: 21),
            SizedBox(width: Palette.smallSpace),
            FormBuilderText(
              message: FormBuilderLocalizations.of(context).addDocumentText,
              textStyle: Styles.customTextStyle(
                textSize: Palette.mediumFontSize,
                textColor: Palette.AppThemeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget function which gives the ui for the list of documents.
  Widget _attachDocument() {
    return StatefulBuilder(builder: (context, state) {
      this.documentsState = state;
      return Column(
        children: [
          if (selectedDocumentFile != null) ...[_singleDocumentItem()],
          Visibility(
            visible: selectedDocumentFile == null,
            child: Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          ),
          Visibility(visible: selectedDocumentFile == null, child: _addDocumentButton()),
        ],
      );
    });
  }

  /// Widget function which gives the ui for the single document item.
  ///
  /// It will take in the dynamic controllers created and setup the dynamic title and description.
  Widget _singleDocumentItem() {
    String fileName = selectedDocumentFile.path.split('/').last;
    if (fileName == null) fileName = '';
    if (fileName.length > 150) fileName = fileName.substring(0, 150);
    return Padding(
      padding: EdgeInsets.only(top: Utils.screenHeight * 0.01),
      child: Column(
        children: [
          FormBuilderTextField(
            name: Constants.titleDescription,
            controller: _docTitleController,
            textInputAction: TextInputAction.next,
            focusNode: _docTitleFocus,
            decoration: Styles.textInputDecoration(
              hint: FormBuilderLocalizations.of(context).titleDescriptionText,
              focusNode: _docTitleFocus,
            ),
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: Palette.DisabledBorderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.image, color: Palette.TextColor),
                            SizedBox(width: 5.0),
                            Expanded(
                              child: FormBuilderText(
                                message: fileName,
                                maxLines: 2,
                                textStyle: Styles.customTextStyle(
                                  textSize: Palette.mediumFontSize,
                                  textColor: Palette.AppThemeColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
                        FormBuilderText(
                          message: '${Utils.getFileSize(selectedDocumentFile)} MB',
                          textStyle: Styles.customTextStyle(
                            textSize: Palette.mediumFontSize,
                            textColor: Palette.AppThemeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => onDeleteDocumentClick(),
                    child: Icon(
                      Icons.delete_outline_outlined,
                      size: 21,
                      color: Palette.EnabledBorderColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Group of functions which gives the functionalities like click events, state changes,
  /// listeners.
  void initiateListeners() {
    _schoolFocus.addListener(() {
      this.schoolState(() {});
    });

    _gradeFocus.addListener(() {
      this.gradeState(() {});
    });

    _studyFieldFocus.addListener(() {
      this.fieldOfStudyState(() {});
    });

    _activitiesAndSocietiesFocus.addListener(() {
      this.activitiesState(() {});
    });

    _degreeFocus.addListener(() {
      this.degreeState(() {});
    });

    _descriptionFocus.addListener(() {
      this.descriptionState(() {});
    });
  }

  void onStartDateChanged(DateTime changedStartDate) {
    this.startDateState(() {
      selectedStartDate = changedStartDate;
    });
  }

  void onEndDateChanged(DateTime changedEndDate) {
    this.endDateState(() {
      selectedEndDate = changedEndDate;
    });
  }

  void hideEndDateToggle(bool hide) {
    this.endDateState(() {
      hideEndDateFlag = hide;
    });
  }

  void pickEducationDocument() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (result != null) {
      this.documentsState(() {
        selectedDocumentFile = File(result.files.single.path);

        Uint8List byteData = selectedDocumentFile.readAsBytesSync();

        fileOrDocumentInformationRequest = FileOrDocumentInformationRequest(
          name: p.basenameWithoutExtension(selectedDocumentFile.path),
          base64: base64Encode(byteData),
          fileType: 'Image',
        );
      });
    }
  }

  void onDeleteDocumentClick() {
    this.documentsState(() {
      selectedDocumentFile = null;
      fileOrDocumentInformationRequest = null;
    });
  }

  void checkError(OnBoardingEducationViewModel vm) {
    if (vm?.onBoardingState?.isLoading == false && vm?.onBoardingState?.error?.isNotEmpty == true) {
      Utils.showToast(context: context, message: vm.onBoardingState.error);
      store.dispatch(OnBoardingClearActions());
    }
  }

  void onApplyButtonClick() {
    if (_onBoardingEducationFormKey.currentState.validate()) {
      if (selectedDocumentFile != null) {
        String userId = Utils.getStringFromPrefs(Constants.userToken);
        store.dispatch(
          OnBoardingAddEduActions(
            context: context,
            documentsList: [fileOrDocumentInformationRequest],
            addEducationRequestModel: [
              OnBoardingEducationRequestModel(
                educationId: '',
                userId: userId,
                schoolName: _schoolController.text,
                degree: _degreeController.text,
                fieldOfStudy: _studyFieldController.text,
                startMonthAndYearDate: selectedStartDate,
                endMonthAndYearDate: selectedEndDate,
                grade: _gradeController.text,
                activitiesAndSocieties: _activitiesAndSocietiesController.text,
                description: _descriptionController.text,
                fileOrDocumentId: '',
              ),
            ],
          ),
        );
      } else {
        Utils.showToast(
            context: context, message: FormBuilderLocalizations.of(context).selectDocumentText);
      }
    }
  }
}

class OnBoardingEducationViewModel {
  final OnBoardingState onBoardingState;

  OnBoardingEducationViewModel(this.onBoardingState);
}
