import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/payments/payments_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/payments/payments_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/payments/delete_payment_method_request.dart';
import 'package:khontext/src/models/payments/payment_method_list_model.dart';
import 'package:khontext/src/screens/payments/add_card_dialog.dart';
import 'package:khontext/src/screens/payments/collapsing_view.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class PaymentMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        const SizedBox(height: 10.0),
        _cardsListWidget(),
      ],
    );
  }

  /// Widget function which will show the list of cards to the user.
  Widget _cardsListWidget() {
    return StoreConnector<AppState, PaymentMethodsViewModel>(
        converter: (store) => PaymentMethodsViewModel(paymentState: store.state.paymentState, store: store),
        builder: (context, vm) {
          if (vm?.paymentState?.isLoading == true && vm?.paymentState?.currentAction == PaymentMethodListFetchAction) {
            return BaseLoadingWidget();
          } else if (vm?.paymentState?.paymentMethodListModel?.data?.isEmpty == true) {
            return ErrorTextWidget(error: FormBuilderLocalizations.of(context).noPaymentMethodText);
          }
          return ListView.builder(
              itemCount: vm.paymentState.paymentMethodListModel.data.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _singleCardItem(context, vm.paymentState.paymentMethodListModel.data[index], index, vm);
              });
        });
  }

  /// Widget function which will give the single card item Ui
  Widget _singleCardItem(
      BuildContext context, PaymentMethodListData singleModel, int index, PaymentMethodsViewModel vm) {
    ClientAddressData cardAddress = singleModel.cardAddress;
    String address = Utils().getSeparatedAddress([
      cardAddress.line1,
      cardAddress.line2,
      cardAddress.city,
      cardAddress.county,
      cardAddress.country,
      cardAddress.zipCode,
    ]);
    return CollapsingView(
      isEdit: true,
      update: () => updatePaymentMethodCard(context, index: index, singleModel: singleModel),
      delete: () => deletePaymentMethod(context, vm, singleModel: singleModel),
      titleMessage: '${FormBuilderLocalizations.of(context).cardEndingText} ${singleModel.last4Digit}',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _cardDataRow(FormBuilderLocalizations.of(context).cardHolderText, singleModel.accountHolderName),
            const SizedBox(height: 5.0),
            _cardDataRow(FormBuilderLocalizations.of(context).cardNumberText,
                '${FormBuilderLocalizations.of(context).cardEndingText} ${singleModel.last4Digit}'),
            const SizedBox(height: 5.0),
            _cardDataRow(FormBuilderLocalizations.of(context).cardExpiryText,
                singleModel.expireMonth.toString() + "/" + singleModel.expireYear.toString()),
            const SizedBox(height: 5.0),
            _cardDataRow(FormBuilderLocalizations.of(context).addressText, address),
            const SizedBox(height: 8.0),
            _editAddressWidget(context, vm, addressModel: singleModel.cardAddress),
          ],
        ),
      ),
    );
  }

  /// Widget function which will give the separate UI for the single row of the payment history.
  /// For eg. this widget will provide the UI for the Name and its value of a single payment history
  /// This have been used for the code optimizations and better performance.
  Widget _cardDataRow(String title, String message) {
    return Row(
      children: [
        Expanded(
          child: FormBuilderText(message: title, textStyle: Styles.customTextStyle(textSize: 16.0)),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: FormBuilderText(
              message: message, textStyle: Styles.customTextStyle(textSize: 16.0, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }

  /// Widget function which will give user the edit address text, along with the tap events.
  Widget _editAddressWidget(BuildContext context, PaymentMethodsViewModel vm, {ClientAddressData addressModel}) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => editAddressTap(context, addressModel, vm),
      child: Align(
        alignment: Alignment.centerRight,
        child: FormBuilderText(
          message: FormBuilderLocalizations.of(context).editAddressText,
          textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor, textSize: 16.0),
        ),
      ),
    );
  }

  /// Function for the edit address tap. Will open up a modal which will let user edit the current address and update
  /// it wherever used.
  void editAddressTap(BuildContext context, ClientAddressData addressModel, PaymentMethodsViewModel vm) {
    AddCardDialog().showEditAddressDialog(context, currentModel: addressModel);
  }

  /// Function which will open up the modal for the payment method card in the edit mode for the user to edit the
  /// payment method.
  void updatePaymentMethodCard(BuildContext context, {int index, PaymentMethodListData singleModel}) {
    AddCardDialog().showAddCardDialog(
      context,
      USERTYPE.CLIENT,
      isUpdate: true,
      creditCardModel: singleModel,
      index: index,
    );
  }

  /// Function which will call the event for deleting the particular payment method.
  void deletePaymentMethod(BuildContext context, PaymentMethodsViewModel vm, {PaymentMethodListData singleModel}) {
    vm.store.dispatch(DeletePaymentMethodAction(
        userType: USERTYPE.CLIENT,
        deletePaymentMethodRequestModel: DeletePaymentMethodRequestModel(
            userId: singleModel.userId, sourceId: singleModel.sourceId, type: singleModel.sourceType)));
  }
}

class PaymentMethodsViewModel {
  final PaymentState paymentState;
  final Store<AppState> store;

  PaymentMethodsViewModel({this.paymentState, this.store});
}
