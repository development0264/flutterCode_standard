import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/onboarding/onboarding_data_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingeducation/onboarding_education_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/onboarding/onboarding_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_scroll_view.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/onboarding/onboarding_data_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/onboarding_education_response_model.dart';
import 'package:khontext/src/screens/onboarding/onboarding/common_button_widget.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingeducation/onboarding_single_item_details.dart';
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

class OnBoardingEducationPage extends StatefulWidget {
  const OnBoardingEducationPage({Key key}) : super(key: key);

  @override
  _OnBoardingEducationPageState createState() => _OnBoardingEducationPageState();
}

class _OnBoardingEducationPageState extends State<OnBoardingEducationPage> {
  /// List of the education already added by the user
  List<OnBoardingEducationData> educationListData = [];

  /// Store instance to use further
  Store<AppState> store;

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key addButtonKey = Key(Constants.educationAddButtonKey);

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      baseChild: StoreConnector<AppState, OnBoardingEducationViewModel>(
        converter: (store) => OnBoardingEducationViewModel(store.state.onBoardingState),
        builder: (context, vm) {
          checkError(vm);
          educationListData = vm.onBoardingState.onBoardingDataResponseModel.data?.education;
          if (educationListData == null) educationListData = [];
          return Stack(
            children: [
              _onBoardingLanguageWidget(),
              if (vm.onBoardingState.isLoading &&
                  (vm.onBoardingState.currentAction == OnBoardingDeleteEduActions ||
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
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                _educationListView(),
                Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
                _addEducationView(),
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

  /// Widget function which gives the ui for the listview of the education
  Widget _educationListView() {
    return ListView.builder(
      itemCount: educationListData.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => OnBoardingSingleItemDetails(
        titleLine:
            "${educationListData[index].startMonthAndYearDate.year} - ${educationListData[index].endMonthAndYearDate.year}",
        subTitleLine: '${educationListData[index].degree}, ${educationListData[index].schoolName}',
        descriptionLine: educationListData[index].activitiesAndSocieties,
        onDeleteIconClick: () => onDeleteButtonClicked(educationListData[index].educationId),
      ),
    );
  }

  /// Widget function which gives the UI for the add language view.
  /// It provides the click event to the user which takes user back to the add language page.
  Widget _addEducationView() {
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
              message: FormBuilderLocalizations.of(context).addEducationText,
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
    Utils.navigationPushNamedAndRemoveUntil(context, RoutesConstants.onBoardingAddEducationScreen,
        RoutesConstants.onBoardingLanguagesScreen);
  }

  void checkError(OnBoardingEducationViewModel vm) {
    if (vm?.onBoardingState?.isLoading == false && vm?.onBoardingState?.error?.isNotEmpty == true) {
      Utils.showToast(context: context, message: vm.onBoardingState.error);
      store.dispatch(OnBoardingClearActions());
    }
  }

  void onDeleteButtonClicked(String educationId) {
    store.dispatch(OnBoardingDeleteEduActions(context: context, educationId: educationId));
  }

  void onNextButtonClick() {
    OnBoardingData onBoardingData = store.state.onBoardingState.onBoardingDataResponseModel.data;
    if (onBoardingData?.experience?.userId?.isNotEmpty == true) {
      Utils.navigateTo(context, RoutesConstants.onBoardingExperienceScreen);
    } else {
      Utils.navigateTo(context, RoutesConstants.onBoardingAddExperienceScreen);
    }
  }
}

class OnBoardingEducationViewModel {
  final OnBoardingState onBoardingState;

  OnBoardingEducationViewModel(this.onBoardingState);
}
