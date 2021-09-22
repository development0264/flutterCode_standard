import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorearnings/fetch_billing_methods_type.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_earnings_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorearnings/bank_transfer_layout.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorearnings/card_transfer_layout.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorearnings/pay_to_layout.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:redux/redux.dart';

class BillingMethodDetails extends StatefulWidget {
  final USERTYPE usertype;
  const BillingMethodDetails({Key key,@required this.usertype}) : super(key: key);

  @override
  _BillingMethodDetailsState createState() => _BillingMethodDetailsState();
}

class _BillingMethodDetailsState extends State<BillingMethodDetails> {
  /// Variable which gives the currently selected method.
  String selectedPaymentMethod = 'Debit Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, BillingMethodsViewModel>(
        converter: (store) => BillingMethodsViewModel(store: store, earningsState: store.state.translateEarningsState),
        onInit: (store) => store.dispatch(TranslateBillingTypeFetchAction()),
        builder: (context, vm) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderText(
                        message: FormBuilderLocalizations.of(context).billingMethodsText,
                        textStyle: Styles.customTextStyle(textSize: 16.0),
                      ),
                      const SizedBox(height: 15.0),
                      FormBuilderDropdown<String>(
                        name: Constants.billingType,
                        allowClear: false,
                        initialValue: selectedPaymentMethod,
                        onChanged: (val) {
                          setState(() {
                            selectedPaymentMethod = val;
                          });
                        },
                        decoration: Styles.textInputDecoration(),
                        items: vm.earningsState.billingMethodList
                            .map((method) => _commonDropDownItem(value: method, message: method))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                _methodSelectionUI(selectedPaymentMethod),
                const SizedBox(height: 10.0),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Widget function which calls the UI on the base of the method selection
  Widget _methodSelectionUI(String selectedPaymentMethod) {
    switch (selectedPaymentMethod) {
      case 'Debit Card':
        return CardTransferLayout(userType: widget.usertype);
        break;
      case 'PayPal':
        return _payPalLayout();
        break;
      case 'Bank Transfer':
        return BankTransferLayout(usertype: widget.usertype);
        break;
      default:
        return PayToLayout();
        break;
    }
  }

  Widget _payPalLayout() {
    return Container(
      height: 200,
      child: Center(
        child: FormBuilderText(
          message: 'PayPal link will go here.',
        ),
      ),
    );
  }

  /// Widget function for the common drop down item.
  DropdownMenuItem<String> _commonDropDownItem({String value, String message}) {
    return DropdownMenuItem<String>(
      value: value,
      child: FormBuilderText(
        message: message,
        textStyle: Styles.customTextStyle(textSize: 18.0),
      ),
    );
  }
}

class BillingMethodsViewModel {
  final TranslateEarningsState earningsState;
  final Store<AppState> store;

  BillingMethodsViewModel({this.earningsState, this.store});
}
