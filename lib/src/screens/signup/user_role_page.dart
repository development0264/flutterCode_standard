import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/signup/complete_user_profile_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/signup/sign_up_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/models/signup/user_profile_response_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:toast/toast.dart';

class UserRolePage extends StatefulWidget {
  const UserRolePage({Key key}) : super(key: key);

  @override
  _UserRolePageState createState() => _UserRolePageState();
}

class _UserRolePageState extends State<UserRolePage> {
  /// [int] which gives the currently selected value
  int translatorSelected = -1;
  int hireSelected = -1;

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter userRoleState;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      baseChild: StoreConnector<AppState, CompleteProfileViewModel>(
        converter: (store) => CompleteProfileViewModel(store.state.signUpState),
        builder: (context, vm) {
          checkError(vm);
          return Stack(
            children: [
              _workTranslatorForm(),
              if (vm.signUpState.isLoading) ...[
                BaseLoadingWidget(),
              ],
            ],
          );
        },
      ),
    );
  }

  /// Widget function which gives the work as a translator form.
  Widget _workTranslatorForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).chooseRoleText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _selectAnyOneRole(),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        BaseButtonWidget(
          minWidth: Utils.screenWidth,
          btnChild: FormBuilderText(
            message: FormBuilderLocalizations.of(context).finishText,
            textStyle: Styles.customTextStyle(textColor: Colors.white),
          ),
          onPressed: () => finishButtonClick(),
        ),
      ],
    );
  }

  /// Widget function which gives the UI for two different roles of users.
  Widget _selectAnyOneRole() {
    return StatefulBuilder(
      builder: (context, setState) {
        this.userRoleState = setState;
        return  Column(
          children: [
            InkWell(
              onTap: () => selectValue(0),
              child: Container(
                height: Utils.screenHeight * 0.15,
                width: Utils.screenWidth,
                decoration: BoxDecoration(
                  color: translatorSelected == 0 ? Palette.AppThemeColor : Palette.LightGrayColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: FormBuilderText(
                    message: FormBuilderLocalizations.of(context).translatorText,
                    textStyle: Styles.customTextStyle(
                      textSize: Palette.extraLargeFontSize,
                      textColor: translatorSelected == 0 ? Colors.white : Palette.DarkTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
            InkWell(
              onTap: () => selectValue(1),
              child: Container(
                height: Utils.screenHeight * 0.15,
                width: Utils.screenWidth,
                decoration: BoxDecoration(
                  color: translatorSelected == 1 ? Palette.AppThemeColor : Palette.LightGrayColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: FormBuilderText(
                    message: FormBuilderLocalizations.of(context).hireText,
                    textStyle: Styles.customTextStyle(
                      textSize: Palette.extraLargeFontSize,
                      textColor: translatorSelected == 1 ? Colors.white : Palette.DarkTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Group of functions which gives the functionalities like change of state, click events.
  void finishButtonClick() {
    if (translatorSelected == 0 || hireSelected == 0) {
      var store = StoreProvider.of<AppState>(context);
      UserProfileResponseModel responseModel = store.state.signUpState.userProfileResponseModel;
      store.dispatch(
        CompleteUserProfileAction(
          context: context,
          completeUserProfileModel: CompleteUserProfileModel(
            userId: responseModel.data,
            roleCode: translatorSelected == 0 ? Constants.translatorType : Constants.clientType,
          ),
        ),
      );
    } else {
      Toast.show(FormBuilderLocalizations.of(context).selectValueText, context);
    }
  }

  void selectValue(int value) {
    this.userRoleState(() {
      translatorSelected = value;
      hireSelected = -1;
    });
  }

  void selectHireValue(int value) {
    this.userRoleState(() {
      hireSelected = value;
    });
  }

  void checkError(CompleteProfileViewModel vm) {
    if (vm?.signUpState?.error?.isNotEmpty == true &&
        vm?.signUpState?.currentAction == CompleteUserProfileErrorAction) {
      Utils.showToast(context: context, message: vm.signUpState.error);
    } else if (vm?.signUpState?.currentAction == CompleteUserProfileSuccessAction) {
      Utils.setStringToPrefs(
          Constants.userToken, vm.signUpState.completeProfileResponseModel.data.userId);
      Utils.navigateTo(context, RoutesConstants.welcomeScreen);
    }
  }
}

class CompleteProfileViewModel {
  final SignUpState signUpState;

  CompleteProfileViewModel(this.signUpState);
}
