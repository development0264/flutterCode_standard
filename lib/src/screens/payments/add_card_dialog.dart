import 'package:flutter/material.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/payments/payment_method_list_model.dart';
import 'package:khontext/src/screens/payments/add_card_dialog_widget.dart';
import 'package:khontext/src/screens/payments/update_address_widget.dart';
import 'package:khontext/utils/enums.dart';

class AddCardDialog {
  void showAddCardDialog(BuildContext context, USERTYPE usertype,
      {@required bool isUpdate, PaymentMethodListData creditCardModel, int index: -1}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return DialogWidget(
          isUpdate: isUpdate,
          creditCardModel: creditCardModel,
          index: index,
          userType: usertype,
        );
      },
    );
  }

  void showEditAddressDialog(BuildContext context, {ClientAddressData currentModel}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return UpdateAddressWidget(
          cardAddressModel: currentModel,
        );
      },
    );
  }
}
