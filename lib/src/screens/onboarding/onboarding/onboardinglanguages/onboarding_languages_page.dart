import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/onboarding/onboarding_data_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardinglanguages/onboarding_languages_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/onboarding/onboarding_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_scroll_view.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/onboarding/onboarding_data_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/onboarding_add_lang_response_model.dart';
import 'package:khontext/src/screens/onboarding/onboarding/common_button_widget.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardinglanguages/onboarding_single_language_details.dart';
import 'package:khontext/src/screens/onboarding/onboarding/time_line_widget.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class OnBoardingLanguagesPage extends StatefulWidget {
  const OnBoardingLanguagesPage({Key key}) : super(key: key);

  @override
  _OnBoardingLanguagesPageState createState() => _OnBoardingLanguagesPageState();
}

class _OnBoardingLanguagesPageState extends State<OnBoardingLanguagesPage> {
  /// List of the languages already added by the user
  List<AddLanguageResponseData> languageListData = [];

  /// Store instance to use further
  Store<AppState> store;

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key addButtonKey = Key(Constants.addButtonKey);

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
        builder: (context, vm) {
          checkError(vm);
          languageListData = vm.onBoardingState.onBoardingDataResponseModel.data?.language;
          if (languageListData == null) languageListData = [];
          return Stack(
            children: [
              _onBoardingLanguageWidget(),
              if (vm.onBoardingState.isLoading &&
                  (vm.onBoardingState.currentAction == OnBoardingDeleteLangActions ||
                      vm.onBoardingState.currentAction == OnBoardingDataActions)) ...[
                BaseLoadingWidget()
              ],
            ],
          );
        },
      ),
    );
  }

  /// Widget function which gives the ui for the base on boarding language widget.
  Widget _onBoardingLanguageWidget() {
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
                  message: FormBuilderLocalizations.of(context).clickLanguageText,
                  textStyle: Styles.customTextStyle(
                    textSize: Palette.mediumFontSize,
                    textColor: Palette.TextColor,
                  ),
                ),
                Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
                _languagesListView(),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                _addLanguageView(),
              ],
            ),
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        CommonButtonWidget(
          nextButtonClick: () => onNextButtonClick(),
          previousButtonClick: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  /// Widget function which gives the ui for the listview of the languages
  Widget _languagesListView() {
    return ListView.builder(
      itemCount: languageListData.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => OnBoardingSingleLanguageDetails(
        singleItemData: languageListData[index],
        onDeleteIconClick: () =>
            onDeleteButtonClicked(languageListData[index].translatorLanguagesId),
      ),
    );
  }

  /// Widget function which gives the UI for the add language view.
  /// It provides the click event to the user which takes user back to the add language page.
  Widget _addLanguageView() {
    return InkWell(
      key: addButtonKey,
      splashColor: Colors.transparent,
      onTap: () => onAddLanguageClick(),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.EnabledFilledColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(Utils.screenWidth * 0.05),
        child: Row(
          children: [
            Icon(Icons.add, size: 21.0, color: Palette.EnabledBorderColor),
            SizedBox(width: Palette.smallSpace),
            FormBuilderText(
              message: FormBuilderLocalizations.of(context).addLanguageText,
              textStyle: Styles.customTextStyle(
                textSize: Palette.mediumFontSize,
                textColor: Palette.EnabledBorderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Group of functions which gives the functionalities like click events, states.
  void onAddLanguageClick() {
    Utils.navigationPushNamedAndRemoveUntil(context, RoutesConstants.onBoardingAddLanguagesScreen,
        RoutesConstants.onBoardingAddressScreen);
  }

  void checkError(OnBoardingLanguageViewModel vm) {
    if (vm?.onBoardingState?.isLoading == false && vm?.onBoardingState?.error?.isNotEmpty == true) {
      Utils.showToast(context: context, message: vm.onBoardingState.error);
      store.dispatch(OnBoardingClearActions());
    }
  }

  void onDeleteButtonClicked(String languageId) {
    store.dispatch(OnBoardingDeleteLangActions(context: context, languageId: languageId));
  }

  void onNextButtonClick() {
    OnBoardingData onBoardingData = store.state.onBoardingState.onBoardingDataResponseModel.data;
    if (onBoardingData?.education?.isNotEmpty == true) {
      Utils.navigateTo(context, RoutesConstants.onBoardingEducationScreen);
    } else {
      Utils.navigateTo(context, RoutesConstants.onBoardingAddEducationScreen);
    }
  }
}

class OnBoardingLanguageViewModel {
  final OnBoardingState onBoardingState;

  OnBoardingLanguageViewModel(this.onBoardingState);
}
