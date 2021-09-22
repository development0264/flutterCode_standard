import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/onboarding/onboarding_data_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingexperience/onboarding_experience_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/onboarding/onboarding_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_scroll_view.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/onboarding_experience_response_model.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingeducation/onboarding_single_item_details.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

import '../common_button_widget.dart';
import '../time_line_widget.dart';

class OnBoardingExperiencePage extends StatefulWidget {
  const OnBoardingExperiencePage({Key key}) : super(key: key);

  @override
  _OnBoardingExperiencePageState createState() => _OnBoardingExperiencePageState();
}

class _OnBoardingExperiencePageState extends State<OnBoardingExperiencePage> {
  /// Store instance to use further
  Store<AppState> store;

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key addButtonKey = Key(Constants.experienceAddButtonKey);

  /// [OnBoardingExperienceData] gives the data of the experience
  /// From this, the experience list will be carried out.
  OnBoardingExperienceData onBoardingExperienceData;

  List<OnboardExperienceResponse> onboardExperienceList = [];

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      baseChild: StoreConnector<AppState, OnBoardingExperienceViewModel>(
        converter: (store) => OnBoardingExperienceViewModel(store.state.onBoardingState),
        builder: (context, vm) {
          checkError(vm);
          onBoardingExperienceData =
              vm.onBoardingState.onBoardingDataResponseModel.data?.experience;
          if (onBoardingExperienceData?.onboardExperienceResponse?.isNotEmpty == true) {
            onboardExperienceList = onBoardingExperienceData.onboardExperienceResponse;
          }
          return Stack(
            children: [
              _onBoardingExperienceWidget(),
              if (vm.onBoardingState.isLoading &&
                  (vm.onBoardingState.currentAction == OnBoardingDeleteExpActions ||
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
  Widget _onBoardingExperienceWidget() {
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
                    message: FormBuilderLocalizations.of(context).experienceText,
                    textStyle: Styles.customTextStyle(
                      textSize: Palette.largeFontSize,
                      textColor: Palette.DarkTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                TimeLineWidget(ticks: 3),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                _educationListView(),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                _addExperienceView(),
              ],
            ),
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        CommonButtonWidget(
          nextButtonClick: () =>
              Utils.navigateTo(context, RoutesConstants.onBoardingVerificationScreen),
          previousButtonClick: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  /// Widget function which gives the ui for the listview of the education
  Widget _educationListView() {
    return ListView.builder(
      itemCount: onboardExperienceList.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => OnBoardingSingleItemDetails(
        titleLine:
            "${onboardExperienceList[index].fromDate.year} - ${onboardExperienceList[index].toDate.year}",
        subTitleLine:
            '${onboardExperienceList[index].title}, ${onboardExperienceList[index].company}',
        descriptionLine: onboardExperienceList[index].description,
        onDeleteIconClick: () => onDeleteButtonClicked(onboardExperienceList[index].experienceId),
      ),
    );
  }

  /// Widget function which gives the UI for the add experience view.
  /// It provides the click event to the user which takes user back to the add language page.
  Widget _addExperienceView() {
    return InkWell(
      key: addButtonKey,
      splashColor: Colors.transparent,
      onTap: () => onAddEducationClick(),
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
              message: FormBuilderLocalizations.of(context).addExperienceText,
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
  void onAddEducationClick() {
    Utils.navigationPushNamedAndRemoveUntil(context, RoutesConstants.onBoardingAddExperienceScreen,
        RoutesConstants.onBoardingLanguagesScreen);
  }

  void checkError(OnBoardingExperienceViewModel vm) {
    if (vm?.onBoardingState?.isLoading == false && vm?.onBoardingState?.error?.isNotEmpty == true) {
      Utils.showToast(context: context, message: vm.onBoardingState.error);
      store.dispatch(OnBoardingClearActions());
    }
  }

  void onDeleteButtonClicked(String experienceId) {
    store.dispatch(OnBoardingDeleteExpActions(context: context, experienceId: experienceId));
  }
}

class OnBoardingExperienceViewModel {
  final OnBoardingState onBoardingState;

  OnBoardingExperienceViewModel(this.onBoardingState);
}
