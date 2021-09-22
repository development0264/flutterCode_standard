import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/clientprofile/change_edit_status_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/clientprofile/client_profile_local_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/screens/clientprofile/account_section.dart';
import 'package:khontext/src/screens/clientprofile/company_section.dart';
import 'package:khontext/src/screens/clientprofile/contact_section.dart';
import 'package:khontext/src/screens/clientprofile/profile_header.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:redux/redux.dart';

class ClientProfilePage extends StatefulWidget {
  @override
  _ClientProfilePageState createState() => _ClientProfilePageState();
}

class _ClientProfilePageState extends State<ClientProfilePage> {
  /// Flag maintained for showing the edit icon for different sections, will be setting Modes.
  ProfilePageEditStatus editStatus = ProfilePageEditStatus.IDLE_MODE;

  /// Flags for the toggling mode maintenance of all sections
  bool isAccountSectionOpen = true;
  bool isCompanySectionOpen = false;
  bool isContactSectionOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, ChangeEditStatusViewModel>(
        converter: (store) => ChangeEditStatusViewModel(store, store.state.clientProfileLocalState),
        builder: (context, vm) {
          editStatus = vm.clientProfileLocalState.editStatus;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            editAccountSection();
          });
          return _clientProfileUI(vm);
        },
      ),
    );
  }

  Widget _clientProfileUI(ChangeEditStatusViewModel vm) {
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
              onEditTap: () =>
                  vm.store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.ACCOUNT_EDIT_MODE)),
              showIcon: editStatus == ProfilePageEditStatus.IDLE_MODE,
            ),
            Visibility(visible: isAccountSectionOpen, child: const SizedBox(height: 15.0)),
            Visibility(visible: isAccountSectionOpen, maintainState: true, child: AccountSection()),
          ], onCardTap: () => accountCardTapped()),
          const SizedBox(height: 15.0),
          _commonCardWidget(children: [
            ProfileHeader(
              headerTitle: FormBuilderLocalizations.of(context).companyTitleText,
              onEditTap: () =>
                  vm.store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.COMPANY_EDIT_MODE)),
              showIcon: editStatus == ProfilePageEditStatus.IDLE_MODE,
            ),
            Visibility(visible: isCompanySectionOpen, child: const SizedBox(height: 15.0)),
            Visibility(visible: isCompanySectionOpen, maintainState: true, child: CompanySection()),
          ], onCardTap: () => companyCardTapped()),
          const SizedBox(height: 15.0),
          _commonCardWidget(children: [
            ProfileHeader(
              headerTitle: FormBuilderLocalizations.of(context).contactTitleText,
              onEditTap: () =>
                  vm.store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.CONTACT_EDIT_MODE)),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  /// Function used for toggling the account section edit icon.
  void editAccountSection() {
    switch (editStatus) {
      case ProfilePageEditStatus.ACCOUNT_EDIT_MODE:
        isAccountSectionOpen = true;
        isCompanySectionOpen = false;
        isContactSectionOpen = false;
        break;
      case ProfilePageEditStatus.COMPANY_EDIT_MODE:
        isAccountSectionOpen = false;
        isCompanySectionOpen = true;
        isContactSectionOpen = false;
        break;
      case ProfilePageEditStatus.CONTACT_EDIT_MODE:
        isAccountSectionOpen = false;
        isCompanySectionOpen = false;
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

  void companyCardTapped() {
    if (editStatus == ProfilePageEditStatus.IDLE_MODE) {
      setState(() {
        isCompanySectionOpen = !isCompanySectionOpen;
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

class ChangeEditStatusViewModel {
  final Store<AppState> store;
  final ClientProfileLocalState clientProfileLocalState;

  ChangeEditStatusViewModel(this.store, this.clientProfileLocalState);
}
