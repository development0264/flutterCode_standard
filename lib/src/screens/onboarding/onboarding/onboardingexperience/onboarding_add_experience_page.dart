import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/onboarding/onboarding_data_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingexperience/onboarding_experience_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardinglanguages/onboarding_languages_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/onboarding/onboarding_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_bottomsheet.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_scroll_view.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/employment_type_response.dart';
import 'package:khontext/src/screens/onboarding/onboarding/time_line_widget.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/drop_down_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class OnBoardingAddExperiencePage extends StatefulWidget {
  const OnBoardingAddExperiencePage({Key key}) : super(key: key);

  @override
  _OnBoardingAddExperiencePageState createState() => _OnBoardingAddExperiencePageState();
}

class _OnBoardingAddExperiencePageState extends State<OnBoardingAddExperiencePage> {
  /// Global key used for maintaining the card form.
  final GlobalKey<FormBuilderState> _onBoardingExperienceFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire add address form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _employeePhoneController = TextEditingController();
  final TextEditingController _employeeEmailController = TextEditingController();
  final TextEditingController _docTitleController = TextEditingController();

  /// [FocusNode] for the entire sign in form.
  /// These [FocusNode] will give the current focus of a text field.
  final FocusNode _startDateFocus = FocusNode();
  final FocusNode _endDateFocus = FocusNode();
  final FocusNode _positionFocus = FocusNode();
  final FocusNode _companyFocus = FocusNode();
  final FocusNode _locationFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final FocusNode _employeePhoneFocus = FocusNode();
  final FocusNode _employeeEmailFocus = FocusNode();
  final FocusNode _docTitleFocus = FocusNode();

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter _startDateState;
  StateSetter _endDateState;
  StateSetter _positionState;
  StateSetter _companyState;
  StateSetter _employmentTypeState;
  StateSetter _locationState;
  StateSetter _descriptionState;
  StateSetter _employeePhoneState;
  StateSetter _employeeEmailState;
  StateSetter _documentState;

  /// [String] value which will store the selected values of each selection menus
  String selectedEmploymentType = Constants.employmentTypePlaceHolder;

  /// Variables to store the dates selected by the user.
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  /// [bool] value which holds the toggle flags.
  bool isCurrentlyWorking = false;
  bool canContactEmployer = false;

  /// [List] gives the list of the employment type.
  List<EmploymentTypeData> employeeTypeList = [];

  /// Store instance to use further
  Store<AppState> store;

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key applyButtonKey = Key(Constants.experienceApplyButtonKey);
  Key popupApplyButtonKey = Key(Constants.employmentTypeApplyButtonKey);

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
      baseChild: StoreConnector<AppState, OnBoardingExperienceViewModel>(
          converter: (store) => OnBoardingExperienceViewModel(store.state.onBoardingState),
          onInit: (store) => store.dispatch(OnBoardingEmploymentTypesFetchAction(context: context)),
          builder: (context, vm) {
            // checkError(vm);
            setEmploymentTypes(vm);
            return Stack(
              children: [
                _onBoardingExperienceWidget(vm),
                if (vm.onBoardingState.isLoading &&
                    (vm.onBoardingState.currentAction == OnBoardingEmploymentTypesFetchAction ||
                        vm.onBoardingState.currentAction == OnBoardingAddLangActions)) ...[
                  BaseLoadingWidget()
                ],
              ],
            );
          }),
    );
  }

  Widget _onBoardingExperienceWidget(OnBoardingExperienceViewModel vm) {
    return Column(
      children: [
        Expanded(
          child: FormBuilderScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
                Center(
                  child: FormBuilderText(
                    message: FormBuilderLocalizations.of(context).experienceText,
                    textStyle: Styles.customTextStyle(
                      textSize: Palette.largeFontSize,
                      textColor: Palette.DarkTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
                TimeLineWidget(ticks: 3),
                Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
                FormBuilderText(
                  message: FormBuilderLocalizations.of(context).experienceTellText,
                  textStyle: Styles.customTextStyle(
                      textSize: Palette.mediumFontSize,
                      textColor: Palette.DarkTextColor,
                      fontWeight: FontWeight.bold),
                ),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                _experienceInputForm(),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                _employerContact(),
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
  Widget _experienceInputForm() {
    return FormBuilder(
      key: _onBoardingExperienceFormKey,
      child: Column(
        children: [
          StatefulBuilder(builder: (context, state) {
            this._startDateState = state;
            return FormBuilderDateTimePicker(
              name: Constants.startDate,
              initialValue: fromDate,
              inputType: InputType.date,
              controller: _startDateController,
              focusNode: _startDateFocus,
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).fromErrorText),
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).fromDateText,
                focusNode: _startDateFocus,
              ),
            );
          }),
          StatefulBuilder(builder: (context, state) {
            this._endDateState = state;
            return Visibility(
              visible: !isCurrentlyWorking,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                  FormBuilderDateTimePicker(
                    name: Constants.endDate,
                    controller: _endDateController,
                    focusNode: _endDateFocus,
                    initialValue: toDate,
                    inputType: InputType.date,
                    validator: FormBuilderValidators.required(context,
                        errorText: FormBuilderLocalizations.of(context).toErrorText),
                    decoration: Styles.textInputDecoration(
                      hint: FormBuilderLocalizations.of(context).endDateText,
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
            initialValue: isCurrentlyWorking,
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
            this._positionState = state;
            return FormBuilderTextField(
              name: Constants.positionText,
              controller: _positionController,
              focusNode: _positionFocus,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).positionErrorText),
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).positionText,
                focusNode: _positionFocus,
              ),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this._companyState = state;
            return FormBuilderTextField(
              name: Constants.companyText,
              controller: _companyController,
              focusNode: _companyFocus,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).companyTitleErrorText),
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).companyTitleText,
                focusNode: _companyFocus,
              ),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          _employmentTypeWidget(Constants.employmentTypePlaceHolder),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this._locationState = state;
            return FormBuilderTextField(
              name: Constants.location,
              controller: _locationController,
              focusNode: _locationFocus,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).locationText,
                focusNode: _locationFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).locationErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this._descriptionState = state;
            return FormBuilderTextField(
              name: Constants.descriptionText,
              controller: _descriptionController,
              focusNode: _descriptionFocus,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              maxLines: 3,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).descriptionText,
                focusNode: _descriptionFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).descriptionErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this._employeePhoneState = state;
            return FormBuilderTextField(
              name: Constants.employerPhone,
              controller: _employeePhoneController,
              focusNode: _employeePhoneFocus,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).employerPhoneText,
                focusNode: _employeePhoneFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).employerPhoneErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this._employeeEmailState = state;
            return FormBuilderTextField(
              name: Constants.employerEmail,
              controller: _employeeEmailController,
              focusNode: _employeeEmailFocus,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).employerEmailText,
                focusNode: _employeeEmailFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).employerEmailErrorText),
            );
          }),
        ],
      ),
    );
  }

  /// Widget function which gives the ui for the employer contact section
  ///
  /// It provides a radio group for yes and no.
  Widget _employerContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).contactEmployerText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.largeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        FormBuilderRadioGroup(
            name: Constants.contactEmployer,
            activeColor: Palette.AppThemeColor,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            initialValue: FormBuilderLocalizations.of(context).noText,
            options: [
              FormBuilderLocalizations.of(context).yesText,
              FormBuilderLocalizations.of(context).noText
            ].map(
              (contactEmployer) {
                return FormBuilderFieldOption(
                  value: contactEmployer,
                  child: FormBuilderText(
                    message: contactEmployer,
                    textStyle: Styles.customTextStyle(
                      textSize: Palette.mediumFontSize,
                      textColor: Palette.TextColor,
                    ),
                  ),
                );
              },
            ).toList()),
      ],
    );
  }

  /// Widget function which gives the ui for the employment type.
  ///
  /// Click function will open up a bottom sheet.
  Widget _employmentTypeWidget(String title) {
    return StatefulBuilder(builder: (context, state) {
      this._employmentTypeState = state;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: title != selectedEmploymentType,
            child: FormBuilderText(
              message: title,
              textStyle: Styles.customTextStyle(
                textSize: Palette.smallFontSize,
                textColor: Palette.AppThemeColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Visibility(
              visible: title != selectedEmploymentType,
              child: Utils.getVerticalSpacing(SPACE_TYPE.SMALL)),
          DropDownWidget(
            borderColor: Palette.DisabledBorderColor,
            onPressed: () => employmentTypeClicked(),
            titleText: selectedEmploymentType,
          ),
        ],
      );
    });
  }

  /// Widget function which gives the ui for the picker of the employment types.
  Widget _employmentTypePickerWidget() {
    return Column(
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).employmentTypeText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.largeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        Expanded(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) =>
                disableGlowProperty(overscroll),
            child: CupertinoPicker(
              backgroundColor: Palette.WhiteColor,
              itemExtent: 50,
              diameterRatio: 10.0,
              magnification: 1.0,
              onSelectedItemChanged: (int value) =>
                  onEmploymentTypeSelected(employeeTypeList[value].name),
              scrollController:
                  FixedExtentScrollController(initialItem: employeeTypeList.length ~/ 2),
              children: employeeTypeList.map((e) {
                return Center(
                  child: FormBuilderText(
                    message: e.name,
                    textStyle: Styles.customTextStyle(
                      textColor: Palette.AppThemeColor,
                      textSize: Palette.mediumFontSize,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        BaseButtonWidget(
          key: popupApplyButtonKey,
          minWidth: Utils.screenWidth,
          btnChild: FormBuilderText(
            message: FormBuilderLocalizations.of(context).applyText,
            textStyle: Styles.customTextStyle(textColor: Colors.white),
          ),
          onPressed: () => onEmploymentApplyButton(),
        ),
      ],
    );
  }

  /// Group of functions which gives the functionalities like click events, state changes,
  /// listeners.
  void onApplyButtonClick() {}

  void employmentTypeClicked() {
    FormBuilderBottomSheet.openBottomSheet(context: context, child: _employmentTypePickerWidget());
  }

  void hideEndDateToggle(bool hide) {
    this._endDateState(() {
      isCurrentlyWorking = hide;
    });
  }

  void onEmploymentApplyButton() {
    this._employmentTypeState(() {
      Navigator.of(context).pop();
    });
  }

  void onEmploymentTypeSelected(String value) {
    selectedEmploymentType = value;
  }

  void setEmploymentTypes(OnBoardingExperienceViewModel vm) {
    if (!vm.onBoardingState.isLoading &&
        vm.onBoardingState.currentAction == OnBoardingEmploymentTypesSuccessAction) {
      employeeTypeList = vm.onBoardingState.employmentTypeResponseModel != null &&
              vm.onBoardingState.employmentTypeResponseModel.data != null &&
              vm.onBoardingState.employmentTypeResponseModel.data.isNotEmpty
          ? vm.onBoardingState.employmentTypeResponseModel.data
          : [];
    }
  }

  bool disableGlowProperty(OverscrollIndicatorNotification overscroll) {
    overscroll.disallowGlow();
    return true;
  }

  void initiateListeners() {
    _startDateFocus.addListener(() {
      this._startDateState(() {});
    });

    _endDateFocus.addListener(() {
      this._endDateState(() {});
    });

    _positionFocus.addListener(() {
      this._positionState(() {});
    });

    _companyFocus.addListener(() {
      this._companyState(() {});
    });

    _locationFocus.addListener(() {
      this._locationState(() {});
    });

    _descriptionFocus.addListener(() {
      this._descriptionState(() {});
    });

    _employeePhoneFocus.addListener(() {
      this._employeePhoneState(() {});
    });

    _employeeEmailFocus.addListener(() {
      this._employeeEmailState(() {});
    });

    _docTitleFocus.addListener(() {
      this._documentState(() {});
    });
  }

  void checkError(OnBoardingExperienceViewModel vm) {
    if (vm?.onBoardingState?.isLoading == false && vm?.onBoardingState?.error?.isNotEmpty == true) {
      Utils.showToast(context: context, message: vm.onBoardingState.error);
      store.dispatch(OnBoardingClearActions());
    }
  }
}

class OnBoardingExperienceViewModel {
  final OnBoardingState onBoardingState;

  OnBoardingExperienceViewModel(this.onBoardingState);
}
