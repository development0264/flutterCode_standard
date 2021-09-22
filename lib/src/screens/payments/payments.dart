import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/payments/payments_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/screens/payments/balance_due.dart';
import 'package:khontext/src/screens/payments/payment_header.dart';
import 'package:khontext/src/screens/payments/payment_methods.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/add_module_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class PaymentsPage extends StatefulWidget {
  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(PaymentMethodListFetchAction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _paymentsRootView());
  }

  Widget _paymentsRootView() {
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
              message: FormBuilderLocalizations.of(context).paymentTitleText,
              textStyle: Styles.customTextStyle(textSize: 16.0),
            ),
          ),
          const SizedBox(height: 15.0),
          _commonCardWidget(
            children: [
              PaymentHeader(headerTitle: FormBuilderLocalizations.of(context).balanceDueText),
              const SizedBox(height: 10.0),
              BalanceDueSection(),
            ],
            onCardTap: () {},
          ),
          const SizedBox(height: 15.0),
          _commonCardWidget(
            children: [
              PaymentHeader(
                headerTitle: FormBuilderLocalizations.of(context).paymentMethodsText,
                headerWidget: addCardWidget(),
              ),
              const SizedBox(height: 10.0),
              PaymentMethods(),
            ],
            onCardTap: () {},
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(
              left: Utils.screenWidth * 0.05,
              top: Utils.screenHeight * 0.02,
              right: Utils.screenWidth * 0.05,
            ),
            child: BaseButtonWidget(
              minWidth: Utils.screenWidth,
              btnChild: FormBuilderText(
                  message: FormBuilderLocalizations.of(context).paymentHistoryText,
                  textStyle: Styles.customTextStyle(textColor: Colors.white)),
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesConstants.paymentHistory);
              },
            ),
          ),
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

  /// Widget function which gives functionality for the add card
  Widget addCardWidget() {
    return AddModuleWidget(
      moduleText: FormBuilderLocalizations.of(context).addMethodText,
      onAddClick: () => Navigator.of(context).pushNamed(RoutesConstants.billingDetailsPage,
          arguments: {RoutesConstantsArguments.userTypeArgs: USERTYPE.CLIENT}),
      // AddCardDialog().showAddCardDialog(context, USERTYPE.CLIENT, isUpdate: false),
    );
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
}
