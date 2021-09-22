import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/data.dart';
import 'package:khontext/redux/actions/clientprofile/change_edit_status_action.dart';
import 'package:khontext/redux/actions/clientprofile/client_profile_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/clientprofile/client_profile_local_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/clientprofile/client_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_profile_model.dart';
import 'package:khontext/src/models/translator_profile_model.dart';
import 'package:khontext/src/screens/clientprofile/account_section.dart';
import 'package:khontext/src/screens/clientprofile/contact_section.dart';
import 'package:khontext/src/screens/clientprofile/profile_header.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:redux/redux.dart';

class TranslatorProfilePage extends StatefulWidget {
  @override
  _TranslatorProfilePageState createState() => _TranslatorProfilePageState();
}

class _TranslatorProfilePageState extends State<TranslatorProfilePage> {
  /// Flag maintained for showing the edit icon for different sections, will be setting Modes.
  ProfilePageEditStatus editStatus = ProfilePageEditStatus.IDLE_MODE;

  /// Flags for the toggling mode maintenance of all sections
  bool isAccountSectionOpen = true;
  bool isContactSectionOpen = false;

  /// [ClientProfileData] and [ClientProfileImageData] for the usage of showing the data.
  ClientProfileData clientProfileData;
  ClientProfileImageData clientProfileImageData;

  /// Loading the dummy data for showing.
  TranslatorProfileModel model = Data.translatorProfileModel;

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    print("This is called.....");
    // store.dispatch(ClientProfileFetchAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TranslatorProfileViewModel>(
      converter: (store) => TranslatorProfileViewModel(store, store.state.clientProfileLocalState),
      builder: (context, vm) {
        editStatus = vm.clientProfileLocalState.editStatus;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          editAccountSection();
        });
        return _translatorProfileUI(vm);
      },
    );
  }

  Widget _translatorProfileUI(TranslatorProfileViewModel vm) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Utils.screenWidth * 0.05,
              top: Utils.screenHeight * 0.06,
              right: Utils.screenWidth * 0.05,
            ),
            child: FormBuilderText(
              message: FormBuilderLocalizations.of(context).profileTitleText,
              textStyle: Styles.customTextStyle(textSize: 16.0),
            ),
          ),
          const SizedBox(height: 15.0),
          _commonCardWidget(children: [
            ProfileHeader(
              headerTitle: FormBuilderLocalizations.of(context).accountTitleText,
              onEditTap: () => vm.store.dispatch(ChangeEditStatusSuccessAction(
                  editStatus: ProfilePageEditStatus.ACCOUNT_EDIT_MODE)),
              showIcon: editStatus == ProfilePageEditStatus.IDLE_MODE,
            ),
            Visibility(visible: isAccountSectionOpen, child: const SizedBox(height: 15.0)),
            Visibility(visible: isAccountSectionOpen, maintainState: true, child: AccountSection()),
          ], onCardTap: () => accountCardTapped()),
          const SizedBox(height: 15.0),
          _commonCardWidget(children: [
            ProfileHeader(
              headerTitle: FormBuilderLocalizations.of(context).contactTitleText,
              onEditTap: () => vm.store.dispatch(ChangeEditStatusSuccessAction(
                  editStatus: ProfilePageEditStatus.CONTACT_EDIT_MODE)),
              showIcon: editStatus == ProfilePageEditStatus.IDLE_MODE,
            ),
            Visibility(visible: isContactSectionOpen, child: const SizedBox(height: 15.0)),
            Visibility(visible: isContactSectionOpen, maintainState: true, child: ContactSection()),
          ], onCardTap: () => contactCardTapped()),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return FormBuilderCard(
        onCardTap: () => onCardTap(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children));
  }

  /// Function used for toggling the account section edit icon.
  void editAccountSection() {
    switch (editStatus) {
      case ProfilePageEditStatus.ACCOUNT_EDIT_MODE:
        isAccountSectionOpen = true;
        isContactSectionOpen = false;
        break;
      case ProfilePageEditStatus.CONTACT_EDIT_MODE:
        isAccountSectionOpen = false;
        isContactSectionOpen = true;
        break;
      default:
        break;
    }
  }

  /// Function which will give the common card margin used for each of the three main section cards.
  EdgeInsets cardMargin() {
    return EdgeInsets.only(
      left: Utils.screenWidth * 0.05,
      right: Utils.screenWidth * 0.05,
    );
  }

  /// Function which will give the common card padding used for each of the three main section cards.
  EdgeInsets cardPadding() {
    return EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 15.0,
    );
  }

  void accountCardTapped() {
    if (editStatus == ProfilePageEditStatus.IDLE_MODE) {
      setState(() {
        isAccountSectionOpen = !isAccountSectionOpen;
      });
    }
  }

  void contactCardTapped() {
    if (editStatus == ProfilePageEditStatus.IDLE_MODE) {
      setState(() {
        isContactSectionOpen = !isContactSectionOpen;
      });
    }
  }
}

class TranslatorProfileViewModel {
  final Store<AppState> store;
  final ClientProfileLocalState clientProfileLocalState;

  TranslatorProfileViewModel(this.store, this.clientProfileLocalState);
}
