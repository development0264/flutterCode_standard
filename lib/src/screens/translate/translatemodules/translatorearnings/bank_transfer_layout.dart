import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorearnings/fetch_bank_account_source.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator/translatorearnings/bank_account_source_request.dart';
import 'package:khontext/src/models/translator/translatorearnings/plaid_token_generate_model.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorearnings/apiprovider/translator_payments_api.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:redux/redux.dart';

class BankTransferLayout extends StatefulWidget {
  final USERTYPE usertype;

  const BankTransferLayout({Key key, this.usertype}) : super(key: key);

  @override
  _BankTransferLayoutState createState() => _BankTransferLayoutState();
}

class _BankTransferLayoutState extends State<BankTransferLayout> {
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return _commonCardWidget(
      onCardTap: () {},
      children: _actionButtons(context),
    );
  }

  /// Widget function which will give the common card layout for each of the section
  Widget _commonCardWidget({Widget children, Function onCardTap}) {
    return FormBuilderCard(
      onCardTap: () => onCardTap(),
      child: children,
    );
  }

  /// Widget function for the buttons of cancel/save when the user is in the edit mode.
  Widget _actionButtons(BuildContext context) {
    return BaseButtonWidget(
      minWidth: Utils.screenWidth,
      btnChild: FormBuilderText(
        message: FormBuilderLocalizations.of(context).addMethodText,
        textStyle: Styles.customTextStyle(textColor: Colors.white),
      ),
      onPressed: () => plaidToken(),
    );
  }

  void plaidToken() async {
    PlaidTokenGenerateModel pl = await TranslatorPaymentApiCalls.getPlaidToken();
    LinkConfiguration configuration = LinkTokenConfiguration(token: pl.data.linkToken);

    PlaidLink _plaidLink = PlaidLink(
      configuration: configuration,
      onSuccess: _onSuccessCallback,
      onEvent: _onEventCallback,
      onExit: _onExitCallback,
    );

    _plaidLink.open();
  }

  void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
    print("onSuccess: $publicToken, metadata: ${metadata.description()}");
    store.dispatch(
      BankAccountSourceFetchAction(
        bankAccountSourceRequest: BankAccountSourceRequest(
          publicToken: publicToken,
          accountId: metadata.accounts[0].id,
        ),
        usertype: widget.usertype,
      ),
    );
  }

  void _onEventCallback(String event, LinkEventMetadata metadata) {
    print("onEvent: $event, metadata: ${metadata.description()}");
  }

  void _onExitCallback(LinkError error, LinkExitMetadata metadata) {
    print("onExit metadata: ${metadata.description()}");

    if (error != null) {
      print("onExit error: ${error.description()}");
    }
  }
}
