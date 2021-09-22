import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorearnings/fetch_translator_earnings.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_earnings_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator_earnings_model.dart';
import 'package:khontext/src/screens/payments/payment_header.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorearnings/translator_payment_methods.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/add_module_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class TranslatorEarningsPage extends StatefulWidget {
  const TranslatorEarningsPage({Key key}) : super(key: key);

  @override
  _TranslatorEarningsPageState createState() => _TranslatorEarningsPageState();
}

class _TranslatorEarningsPageState extends State<TranslatorEarningsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          _commonCardWidget(
            children: [
              PaymentHeader(
                  headerTitle: FormBuilderLocalizations.of(context).earningsText,
                  headerWidget: withdrawalButton()),
              const SizedBox(height: 10.0),
              earningsList(),
            ],
            onCardTap: () {},
          ),
          const SizedBox(height: 8.0),
          _commonCardWidget(
            children: [
              PaymentHeader(
                  headerTitle: FormBuilderLocalizations.of(context).billingMethodsText,
                  headerWidget: addCardWidget()),
              const SizedBox(height: 10.0),
              TranslatorBillingMethods(),
            ],
            onCardTap: () {},
          ),
          const SizedBox(height: 15.0),
          earningsHistoryButton(),
        ],
      ),
    );
  }

  /// Widget function which will give the UI for the withdrawal button.
  Widget withdrawalButton() {
    return BaseButtonWidget(
      btnChild: FormBuilderText(
        message: FormBuilderLocalizations.of(context).withdrawalText,
        textStyle: Styles.customTextStyle(textColor: Colors.white),
      ),
      onPressed: () {},
    );
  }

  /// Widget function which will give the UI for the withdrawal button.
  Widget earningsHistoryButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BaseButtonWidget(
        minWidth: Utils.screenWidth,
        btnChild: FormBuilderText(
          message: FormBuilderLocalizations.of(context).earningsHistoryText,
          textStyle: Styles.customTextStyle(textColor: Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(RoutesConstants.earningsHistoryPage);
        },
      ),
    );
  }

  /// Widget function which will give the common card layout for each of the section
  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return FormBuilderCard(
      onCardTap: () => onCardTap(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  /// Widget function which will give the
  Widget earningsList() {
    return StoreConnector<AppState, TranslatorEarningViewModel>(
      converter: (store) => TranslatorEarningViewModel(
          store: store, translateEarningsState: store.state.translateEarningsState),
      onInit: (store) => store.dispatch(TranslateEarningsFetchAction()),
      builder: (context, vm) {
        return ListView.builder(
          itemCount: vm.translateEarningsState.translateEarningsList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return singleEarningItem(vm.translateEarningsState.translateEarningsList[index]);
          },
        );
      },
    );
  }

  /// Single item for the earning section.
  Widget singleEarningItem(TranslatorEarningsModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        _singleDataView(FormBuilderLocalizations.of(context).descriptionText, model.description,
            maxLines: 1),
        const SizedBox(height: 8.0),
        Row(
          children: [
            _singleDataView(FormBuilderLocalizations.of(context).amountText, '\$ ${model.amount}',
                maxLines: 1),
            const SizedBox(width: 15.0),
            _singleDataView(
                FormBuilderLocalizations.of(context).commissionText, '\$ ${model.commission}',
                maxLines: 1),
          ],
        ),
        const SizedBox(height: 8.0),
        _singleDataView(
            FormBuilderLocalizations.of(context).paidOutText, model.paidOutDate.toString(),
            maxLines: 1),
        const SizedBox(height: 8.0),
        Divider(height: 1, color: Colors.black),
      ],
    );
  }

  /// Earning section single item's data view.
  Widget _singleDataView(String title, String value, {int maxLines}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderText(message: title, textStyle: Styles.customTextStyle(textSize: 16.0)),
        FormBuilderText(
          message: value,
          textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.w500),
          maxLines: maxLines,
        ),
      ],
    );
  }

  /// Widget function which gives functionality for the add card
  Widget addCardWidget() {
    return AddModuleWidget(
      moduleText: FormBuilderLocalizations.of(context).addMethodText,
      onAddClick: () => Navigator.of(context).pushNamed(RoutesConstants.billingDetailsPage,
          arguments: {RoutesConstantsArguments.userTypeArgs: USERTYPE.TRANSLATOR}),
    );
  }
}

class TranslatorEarningViewModel {
  final TranslateEarningsState translateEarningsState;
  final Store<AppState> store;

  TranslatorEarningViewModel({this.translateEarningsState, this.store});
}
