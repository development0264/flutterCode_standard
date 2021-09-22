import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/onboarding/onboarding_data_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardinglanguages/onboarding_languages_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/onboarding/onboarding_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_bottomsheet.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_checkbox.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_scroll_view.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/languages_essentials_model.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/onboarding_add_lang_request_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';
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

class OnBoardingAddLanguagesPage extends StatefulWidget {
  const OnBoardingAddLanguagesPage({Key key}) : super(key: key);

  @override
  OnBoardingAddLanguagesPageState createState() => OnBoardingAddLanguagesPageState();
}

class OnBoardingAddLanguagesPageState extends State<OnBoardingAddLanguagesPage> {
  /// [String] value which will store the selected values of each selection menus
  String selectedLanguage = Constants.languagesPlaceholder;
  String selectedProficiency = Constants.proficiencyPlaceholder;
  String selectedSpecializations = Constants.specializationsPlaceholder;

  /// List of the selected specialization which is helpful to show the pre selected when opened
  List<String> selectedSpecializationList = [];

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter languageState, proficiencyState, specializationsState;

  /// LanguageEssentialModel which gives the language model for showing the essential data.
  /// Along with it, the three different list which gives the data for all three selectable types.
  LanguageEssentialsModel languageEssentialsModel;
  List<LanguagesData> languageDataList = [];
  List<SpecializationsData> specializationDataList = [];
  List<ProficiencyData> proficiencyDataList = [];

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key popupApplyButtonKey = Key(Constants.popupApplyButtonKey);
  Key applyButtonKey = Key(Constants.applyButtonKey);
  Key languageViewKey = Key(Constants.languageViewKey);
  Key proficiencyViewKey = Key(Constants.proficiencyViewKey);
  Key specializationKey = Key(Constants.specializationViewKey);

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      baseChild: StoreConnector<AppState, OnBoardingLanguageViewModel>(
        converter: (store) => OnBoardingLanguageViewModel(store.state.onBoardingState),
        onInit: (store) => store.dispatch(OnBoardingLangEssentialsActions(context: context)),
        builder: (context, vm) {
          checkError(vm);
          setEssentialData(vm);
          return Stack(
            children: [
              _onBoardingAddLanguageWidget(vm),
              if (vm.onBoardingState.isLoading &&
                  (vm.onBoardingState.currentAction == OnBoardingLangEssentialsActions ||
                      vm.onBoardingState.currentAction == OnBoardingAddLangActions)) ...[
                BaseLoadingWidget()
              ],
            ],
          );
        },
      ),
    );
  }

  /// Widget function which gives ui for the on boarding language page
  Widget _onBoardingAddLanguageWidget(OnBoardingLanguageViewModel vm) {
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
                    message: FormBuilderLocalizations.of(context).languagesText,
                    textStyle: Styles.customTextStyle(
                      textSize: Palette.largeFontSize,
                      textColor: Palette.DarkTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                TimeLineWidget(ticks: 1),
                Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
                FormBuilderText(
                  message: FormBuilderLocalizations.of(context).languagesPossessText,
                  textStyle: Styles.customTextStyle(
                      textSize: Palette.mediumFontSize,
                      textColor: Palette.DarkTextColor,
                      fontWeight: FontWeight.bold),
                ),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                FormBuilderText(
                  message: FormBuilderLocalizations.of(context).selectLanguageText,
                  textStyle: Styles.customTextStyle(
                    textSize: Palette.mediumFontSize,
                    textColor: Palette.TextColor,
                  ),
                ),
                Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
                StatefulBuilder(builder: (context, state) {
                  this.languageState = state;
                  return _typePickerWidget(
                      Constants.languagesPlaceholder, selectedLanguage, languageViewKey);
                }),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                StatefulBuilder(builder: (context, state) {
                  this.proficiencyState = state;
                  return _typePickerWidget(
                      Constants.proficiencyPlaceholder, selectedProficiency, proficiencyViewKey);
                }),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                StatefulBuilder(builder: (context, state) {
                  this.specializationsState = state;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _typePickerWidget(Constants.specializationsPlaceholder,
                          selectedSpecializations, specializationKey),
                      Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
                      selectedSpecializationsChips(),
                    ],
                  );
                }),
                Utils.getVerticalSpacing(SPACE_TYPE.EXTRA_LARGE),
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

  /// Widget function which gives the ui for the picker type widget.
  /// It is a common widget which will dynamically maintain the entire title as well as the value
  /// of the particular picker along with the state.
  Widget _typePickerWidget(String title, String value, Key key) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title != value,
          child: FormBuilderText(
            message: title,
            textStyle: Styles.customTextStyle(
              textSize: Palette.smallFontSize,
              textColor: Palette.AppThemeColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Visibility(visible: title != value, child: Utils.getVerticalSpacing(SPACE_TYPE.SMALL)),
        DropDownWidget(onPressed: () => onDropDownWidgetClicked(title), titleText: value),
      ],
    );
  }

  /// Widget function gives the ui for the picker of the language
  Widget _languagesPickerWidget() {
    return _bottomSheetBaseLayout(
      onApplyButton: () => pickerApplyClick(this.languageState),
      title: FormBuilderLocalizations.of(context).languageText,
      child: _commonCupertinoPicker(
        childList: languageDataList,
        onItemSelected: (int value) => onNewLanguageSelected(languageDataList[value].name),
      ),
    );
  }

  /// Widget function gives the ui for the picker of the proficiency
  Widget _proficiencyPickerWidget() {
    return _bottomSheetBaseLayout(
      onApplyButton: () => pickerApplyClick(this.proficiencyState),
      title: FormBuilderLocalizations.of(context).levelProficiencyText,
      child: _commonCupertinoPicker(
        childList: proficiencyDataList,
        onItemSelected: (int value) => onNewProficiencySelected(proficiencyDataList[value].name),
      ),
    );
  }

  /// Widget function which gives the ui for the common cupertino picker which allows the user
  /// to pick a single item and on click of the button the callback function will take the selected
  /// item to the user.
  Widget _commonCupertinoPicker({@required dynamic childList, @required Function onItemSelected}) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) =>
          disableGlowProperty(overscroll),
      child: CupertinoPicker(
        backgroundColor: Palette.WhiteColor,
        itemExtent: 50,
        diameterRatio: 10.0,
        magnification: 1.0,
        onSelectedItemChanged: (int value) => onItemSelected(value),
        scrollController: FixedExtentScrollController(initialItem: childList.length ~/ 2),
        children: (childList as List<dynamic>).map((e) {
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
    );
  }

  /// Widget function gives the ui for the picker of the specialization
  Widget _specializationPickerWidget() {
    return _bottomSheetBaseLayout(
      onApplyButton: () => pickerApplyClick(this.specializationsState),
      title: FormBuilderLocalizations.of(context).levelSpecializationText,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) =>
            disableGlowProperty(overscroll),
        child: ListView.builder(
          itemCount: specializationDataList.length,
          itemBuilder: (context, index) {
            return FormBuilderCheckbox(
              name: Constants.languageSpecialization,
              decoration:
                  Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
              initialValue: selectedSpecializationList
                  .contains(specializationDataList[index].specializationId),
              activeColor: Palette.EnabledBorderColor,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              contentPadding: EdgeInsets.zero,
              onChanged: (value) => onNewSpecializationsSelected(specializationDataList[index]),
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: Utils.screenHeight * 0.01),
                child: FormBuilderText(
                  message: specializationDataList[index].name,
                  textStyle: Styles.customTextStyle(
                    textColor: Palette.AppThemeColor,
                    textSize: Palette.mediumFontSize,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Widget function which gives the ui for the list of chips.
  /// It gives functionality like chips showing, delete an entry of chips.
  Widget selectedSpecializationsChips() {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      children: selectedSpecializationList.map((e) {
        return InputChip(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          padding: EdgeInsets.all(10.0),
          deleteIcon: Icon(Icons.clear, color: Palette.EnabledBorderColor, size: 18),
          backgroundColor: Palette.MediumGrayColor,
          label: FormBuilderText(
            message: specializationDataList?.isNotEmpty == true
                ? specializationDataList.firstWhere((element) => element.specializationId == e).name
                : '',
            textStyle: Styles.customTextStyle(
              textColor: Palette.TextColor,
              textSize: Palette.mediumFontSize,
            ),
          ),
          selected: false,
          selectedColor: Palette.DarkTextColor,
          onDeleted: () => specializationChipDelete(e),
        );
      }).toList(),
    );
  }

  /// Widget function which gives us the base ui for the bottomsheet opened up for the selection
  /// of each option.
  Widget _bottomSheetBaseLayout({Widget child, String title, Function onApplyButton}) {
    return Column(
      children: [
        FormBuilderText(
          message: title,
          textStyle: Styles.customTextStyle(
            textSize: Palette.largeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        Expanded(child: child),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        BaseButtonWidget(
          key: popupApplyButtonKey,
          minWidth: Utils.screenWidth,
          btnChild: FormBuilderText(
            message: FormBuilderLocalizations.of(context).applyText,
            textStyle: Styles.customTextStyle(textColor: Colors.white),
          ),
          onPressed: () => onApplyButton(),
        ),
      ],
    );
  }

  /// Group of functions which gives us functionalities like click events, state setter.
  void onDropDownWidgetClicked(String title) {
    switch (title) {
      case Constants.languagesPlaceholder:
        onLanguagesClicked();
        break;
      case Constants.proficiencyPlaceholder:
        onProficiencyClicked();
        break;
      case Constants.specializationsPlaceholder:
        onSpecializationsClicked();
        break;
    }
  }

  void onLanguagesClicked() {
    FormBuilderBottomSheet.openBottomSheet(context: context, child: _languagesPickerWidget());
  }

  void onNewLanguageSelected(String value) {
    selectedLanguage = value;
  }

  void onProficiencyClicked() {
    FormBuilderBottomSheet.openBottomSheet(context: context, child: _proficiencyPickerWidget());
  }

  void onNewProficiencySelected(String value) {
    selectedProficiency = value;
  }

  void onSpecializationsClicked() {
    FormBuilderBottomSheet.openBottomSheet(context: context, child: _specializationPickerWidget());
  }

  void onNewSpecializationsSelected(SpecializationsData specializationsData) {
    if (selectedSpecializationList.contains(specializationsData.specializationId)) {
      selectedSpecializationList.remove(specializationsData.specializationId);
    } else {
      selectedSpecializationList.add(specializationsData.specializationId);
    }
    selectedSpecializations =
        '${selectedSpecializationList.length} ${FormBuilderLocalizations.of(context).selectedText}';
  }

  void setEssentialData(OnBoardingLanguageViewModel vm) {
    if (!vm.onBoardingState.isLoading &&
        vm.onBoardingState.currentAction == OnBoardingLangEssentialsSuccessAction) {
      languageEssentialsModel = vm.onBoardingState.languageEssentialsModel;
      languageDataList = languageEssentialsModel != null &&
              languageEssentialsModel.languagesResponseModel != null &&
              languageEssentialsModel.languagesResponseModel.data.isNotEmpty
          ? languageEssentialsModel.languagesResponseModel.data
          : [];

      specializationDataList = languageEssentialsModel != null &&
              languageEssentialsModel.specializationsResponseModel != null &&
              languageEssentialsModel.specializationsResponseModel.data.isNotEmpty
          ? languageEssentialsModel.specializationsResponseModel.data
          : [];

      proficiencyDataList = languageEssentialsModel != null &&
              languageEssentialsModel.proficiencyResponseModel != null &&
              languageEssentialsModel.proficiencyResponseModel.data.isNotEmpty
          ? languageEssentialsModel.proficiencyResponseModel.data
          : [];
    }
  }

  bool disableGlowProperty(OverscrollIndicatorNotification overscroll) {
    overscroll.disallowGlow();
    return true;
  }

  void pickerApplyClick(StateSetter stateSetter) {
    stateSetter(() {
      Navigator.of(context).pop();
    });
  }

  void specializationChipDelete(String e) {
    this.specializationsState(() {
      selectedSpecializationList.remove(e);
      selectedSpecializations =
          '${selectedSpecializationList.length} ${FormBuilderLocalizations.of(context).selectedText}';
    });
  }

  void onApplyButtonClick() {
    if (selectedLanguage == Constants.languagesPlaceholder) {
      Utils.showToast(
          context: context, message: FormBuilderLocalizations.of(context).languageErrorText);
      return;
    }
    if (selectedProficiency == Constants.proficiencyPlaceholder) {
      Utils.showToast(
          context: context, message: FormBuilderLocalizations.of(context).proficiencyErrorText);
      return;
    }
    if (selectedSpecializations == Constants.specializationsPlaceholder) {
      Utils.showToast(
          context: context, message: FormBuilderLocalizations.of(context).specializationErrorText);
      return;
    }

    String userId = Utils.getStringFromPrefs(Constants.userToken);
    store.dispatch(OnBoardingAddLangActions(
      context: context,
      onBoardingAddLangRequestModel: [
        OnBoardingAddLangRequestModel(
          userId: userId,
          languageId:
              languageDataList.firstWhere((element) => element.name == selectedLanguage).languageId,
          proficiencyLevelId: proficiencyDataList
              .firstWhere((element) => element.name == selectedProficiency)
              .proficiencyLevelId,
          specializationIds: selectedSpecializationList,
        ),
      ],
    ));
  }

  void checkError(OnBoardingLanguageViewModel vm) {
    if (vm?.onBoardingState?.isLoading == false && vm?.onBoardingState?.error?.isNotEmpty == true) {
      Utils.showToast(context: context, message: vm.onBoardingState.error);
      store.dispatch(OnBoardingClearActions());
    }
  }
}

class OnBoardingLanguageViewModel {
  final OnBoardingState onBoardingState;

  OnBoardingLanguageViewModel(this.onBoardingState);
}
