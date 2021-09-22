import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorcontracts/fetch_translator_contracts.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_contracts_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_paginated_listview.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text_field.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator_contracts_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class TranslatorContractsPage extends StatefulWidget {
  const TranslatorContractsPage({Key key}) : super(key: key);

  @override
  _TranslatorContractsPageState createState() => _TranslatorContractsPageState();
}

class _TranslatorContractsPageState extends State<TranslatorContractsPage> {
  /// [TextEditingController] for the search of the contracts.
  final TextEditingController _searchController = TextEditingController();

  /// App Store object
  Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    store = StoreProvider.of<AppState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: Utils.screenWidth * 0.05,
            top: Utils.screenHeight * 0.03,
            right: Utils.screenWidth * 0.05,
          ),
          child: searchLayout(),
        ),
        const SizedBox(height: 10.0),
        Expanded(child: _translateContractsListWidget()),
      ],
    );
  }

  /// Widget function which will give the payment history list.
  Widget _translateContractsListWidget() {
    return StoreConnector<AppState, TranslatorContractViewModel>(
        converter: (store) => TranslatorContractViewModel(translateContractsState: store.state.translateContractsState),
        onInit: (store) => store.dispatch(TranslateContractsFetchAction()),
        builder: (BuildContext context, TranslatorContractViewModel vm) {
          if (vm.translateContractsState.isLoading && vm.translateContractsState.translateContractsList.isEmpty) {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
          return FormBuilderPaginatedListView(
            itemList: vm.translateContractsState.translateContractsList,
            itemBuilder: (item, index) {
              if (vm.translateContractsState.isLoading &&
                  vm.translateContractsState.translateContractsList.length - 1 == index) {
                return Container(
                  height: 50,
                  child: Center(
                    child: Theme(
                      data: Theme.of(context).copyWith(accentColor: Colors.blue),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              return singleContractsItem(model: item);
            },
            fetchData: (ScrollController scrollController) {},
          );
        });
  }

  Widget searchLayout() {
    return Row(
      children: [
        Expanded(
          child: FormBuilderTextField(
            name: Constants.translateContracts,
            controller: _searchController,
            textInputAction: TextInputAction.done,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).searchContractText),
            onChanged: (searchValue) {},
          ),
        ),
        const SizedBox(width: 10.0),
        BaseButtonWidget(
          minWidth: Utils.screenWidth * 0.08,
          height: Utils.screenWidth * 0.14,
          btnChild: Icon(
            Icons.search,
            size: Utils.screenWidth * 0.06,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  /// Widget function which gives the single list item for the contracts.
  Widget singleContractsItem({TranslatorContractsModel model}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _commonCardWidget(
          children: [
            FormBuilderText(
              message: '${model.title} - \$ ${model.contractBudget}',
              textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.bold),
            ),
            FormBuilderText(
              message: '${FormBuilderLocalizations.of(context).byText} ${model.owner}',
              textStyle: Styles.customTextStyle(textSize: 14.0, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 5.0),
            FormBuilderText(
              message: '${model.service} - ${model.serviceType}',
              textStyle: Styles.customTextStyle(textSize: 14.0),
            ),
            FormBuilderText(
              message: model.description,
              textStyle: Styles.customTextStyle(textSize: 16.0),
            ),
          ],
          onCardTap: () {
            Navigator.of(context).pushNamed(RoutesConstants.translateContractDetailsPage,
                arguments: {RoutesConstantsArguments.contractModelArgs: model});
          },
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return FormBuilderCard(
      onCardTap: onCardTap,
      shadowColor: Palette.AppThemeColor,
      child: Row(
        children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children)),
          PopupMenuButton(
            onSelected: (selectedValue) {},
            itemBuilder: (context) => [
              PopupMenuItem(
                value: CONTRACTS_ENUM.SEND_CONTRACT_MESSAGE,
                child: FormBuilderText(message: FormBuilderLocalizations.of(context).sendContractMessageText),
              ),
              PopupMenuItem(
                value: CONTRACTS_ENUM.PROPOSE_NEW,
                child: FormBuilderText(message: FormBuilderLocalizations.of(context).proposeText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TranslatorContractViewModel {
  final TranslateContractsState translateContractsState;

  TranslatorContractViewModel({this.translateContractsState});
}
