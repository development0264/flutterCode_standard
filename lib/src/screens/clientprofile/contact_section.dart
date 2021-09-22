import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/clientprofile/change_edit_status_action.dart';
import 'package:khontext/redux/actions/clientprofile/client_address_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/clientprofile/client_address_state.dart';
import 'package:khontext/redux/states/clientprofile/client_profile_local_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/address/address_return_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_request_model.dart';
import 'package:khontext/src/models/clientprofile/client_profile_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/address_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';
import 'package:toast/toast.dart';

class ContactSection extends StatefulWidget {
  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  /// Global key for maintaining the state of the form.
  final _contactLocationFormKey = GlobalKey<FormBuilderState>();

  /// [ClientAddressData] for the usage of showing the data.
  ClientAddressData clientAddressData;

  /// Store instance to use further
  Store<AppState> store;

  AddressReturnModel addressReturnModel;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(ClientAddressFetchAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ClientProfileViewModel>(
      converter: (store) => ClientProfileViewModel(
        store.state.clientAddressState,
        store.state.clientProfileLocalState,
      ),
      builder: (context, vm) {
        if (vm.clientAddressState.isLoading) {
          return BaseLoadingWidget();
        } else if (!Utils.isProfileDataAdded(vm.clientAddressState.clientAddressResponseModel) &&
            vm.clientProfileLocalState.editStatus != ProfilePageEditStatus.CONTACT_EDIT_MODE) {
          return addContactDataButton();
        }

        return contactSectionUI(vm);
      },
    );
  }

  /// Widget function for the add company data button UI
  Widget addContactDataButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: BaseButtonWidget(
          minWidth: Utils.screenWidth * 0.5,
          btnChild: FormBuilderText(
            message: FormBuilderLocalizations.of(context).addContactText,
            textStyle: Styles.customTextStyle(textColor: Colors.white),
          ),
          onPressed: () => addContactButtonClick(),
        ),
      ),
    );
  }

  Widget contactSectionUI(ClientProfileViewModel vm) {
    if (vm.clientProfileLocalState.editStatus == ProfilePageEditStatus.CONTACT_EDIT_MODE) {
      return editModeWidgets(vm);
    }

    return nonEditModeWidgets(vm);
  }

  /// Widget function for the case [ProfilePageEditStatus.COMPANY_EDIT_MODE], this will have the edit mode
  /// functionality along with buttons like cancel/save.
  Widget editModeWidgets(ClientProfileViewModel vmO) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseAddressWidget(
          locationFormKey: _contactLocationFormKey,
          clientAddressData: clientAddressData,
          onAddressChanged: (AddressReturnModel address) {
            setState(() {
              this.addressReturnModel = address;
            });
          },
        ),
        const SizedBox(height: 15.0),
        _actionButtons(vmO),
        const SizedBox(height: 15.0),
      ],
    );
  }

  /// Widget function for the buttons of cancel/save when the user is in the edit mode.
  Widget _actionButtons(ClientProfileViewModel vm) {
    return Row(
      children: [
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            backgroundColor: Colors.white,
            btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).cancelText,
              textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor),
            ),
            onPressed: () => cancelButtonClick(),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            backgroundColor:
                this.addressReturnModel != null ? Palette.AppThemeColor : Palette.DisabledBorderColor,
            btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).saveText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: () => this.addressReturnModel != null ? saveButtonClick(vm) : null,
          ),
        ),
      ],
    );
  }

  /// Widget function whenever the user is in [ProfilePageEditStatus.IDLE_MODE] state, this is a informatory widget.
  Widget nonEditModeWidgets(ClientProfileViewModel vm) {
    if (errorShow(vm).isNotEmpty) {
      return ErrorTextWidget(
        error: errorShow(vm) != null
            ? errorShow(vm)
            : FormBuilderLocalizations.of(context).dataLoadText,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonTextLayout(
          title: FormBuilderLocalizations.of(context).addressText,
          message: Utils().getSeparatedAddress([
            clientAddressData.streetNumber,
            clientAddressData.streetName,
            clientAddressData.line1,
            clientAddressData.line2,
            clientAddressData.city,
            clientAddressData.county,
            clientAddressData.country,
            clientAddressData.zipCode,
          ]),
        ),
        const SizedBox(height: 15.0),
        commonTextLayout(
            title: FormBuilderLocalizations.of(context).timeZoneText,
            message: clientAddressData.timezone),
      ],
    );
  }

  /// Common function which will return the title layout, carried out for the code optimization.
  Widget commonTextLayout({String title, String message}) {
    return Column(
      children: [
        FormBuilderText(
          message: title,
          textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.w500),
        ),
        FormBuilderText(
          message: message,
          textStyle: Styles.customTextStyle(textSize: 18.0),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  bool checkAllValidations() {
    return _contactLocationFormKey.currentState.validate() &&
        this.addressReturnModel?.selectedTimeZone?.isNotEmpty == true;
  }

  /// Function which takes in the [ClientProfileViewModel] and provides the [String] error,
  /// it also set the [ClientProfileData] if there is no error.
  String errorShow(ClientProfileViewModel vm) {
    if (vm.clientAddressState != null && vm.clientAddressState.error.isNotEmpty) {
      return vm.clientAddressState.error;
    } else if (vm.clientAddressState != null &&
        vm.clientAddressState.clientAddressResponseModel != null &&
        vm.clientAddressState.clientAddressResponseModel.data == null) {
      return FormBuilderLocalizations.of(context).addressLoadText;
    }
    clientAddressData = vm.clientAddressState.clientAddressResponseModel.data;
    return '';
  }

  /// Function which is called when click of the buttons.
  void addContactButtonClick() {
    store.dispatch(
        ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.CONTACT_EDIT_MODE));
  }

  void cancelButtonClick() {
    store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
  }

  void saveButtonClick(ClientProfileViewModel vm) {
    if (checkAllValidations()) {
      List<String> address = [
        addressReturnModel.subLocality2,
        addressReturnModel.subLocality1,
        addressReturnModel.locality
      ];
      AddressCreateRequestModel addressCreateRequestModel = AddressCreateRequestModel(
        streetNumber: addressReturnModel.streetNumber,
        streetName: addressReturnModel.streetRoute,
        line1: addressReturnModel.subLocality3,
        line2: Utils().getSeparatedAddress(address),
        addressType: Constants.mailingText,
        city: addressReturnModel.city,
        county: addressReturnModel.state,
        zipCode: addressReturnModel.postalCode,
        timezone: addressReturnModel.selectedTimeZone,
        country: addressReturnModel.country,
      );

      if (vm.clientAddressState?.clientAddressResponseModel?.data?.addressId?.isNotEmpty == true) {
        addressCreateRequestModel.addressId =
            vm.clientAddressState?.clientAddressResponseModel?.data?.addressId;
      }

      if (!Utils.isProfileDataAdded(vm.clientAddressState.clientAddressResponseModel)) {
        store.dispatch(
          ClientAddAddressAction(addressCreateRequestModel: addressCreateRequestModel),
        );
      } else {
        store.dispatch(
          ClientUpdateAddressAction(addressCreateRequestModel: addressCreateRequestModel),
        );
      }
    } else {
      Toast.show(FormBuilderLocalizations.of(context).addAllDetailsErrorText, context);
    }
  }
}

class ClientProfileViewModel {
  final ClientAddressState clientAddressState;
  final ClientProfileLocalState clientProfileLocalState;

  ClientProfileViewModel(this.clientAddressState, this.clientProfileLocalState);
}
