import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorearnings/fetch_translator_earnings_history.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_earnings_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_paginated_listview.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator_earnings_history_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class EarningsHistoryPage extends StatefulWidget {
  @override
  _EarningsHistoryPageState createState() => _EarningsHistoryPageState();
}

class _EarningsHistoryPageState extends State<EarningsHistoryPage> {
  /// [TextEditingController] for the search of the posted jobs.
  final TextEditingController _searchController = TextEditingController();

  /// [PageController] passed to the paginated list view and will provide the functionality for the pagination of the
  /// list.
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  message: FormBuilderLocalizations.of(context).earningsHistoryText,
                  textStyle: Styles.customTextStyle(textSize: 16.0),
                ),
                const SizedBox(height: 15.0),
                searchLayout(),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(child: earningsHistoryList())
        ],
      ),
    );
  }

  /// Widget function which gives the ui for the search bar
  Widget searchLayout() {
    return Row(
      children: [
        Expanded(
          child: FormBuilderTextField(
            name: Constants.earningsHistory,
            controller: _searchController,
            textInputAction: TextInputAction.done,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).searchEarningsText),
            onChanged: (searchValue) {
              if (searchValue == '') {}
            },
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

  Widget earningsHistoryList() {
    return StoreConnector<AppState, EarningsHistoryViewModel>(
        converter: (store) => EarningsHistoryViewModel(store.state.translateEarningsState, store),
        onInit: (store) => store.dispatch(TranslateEarningsHistoryFetchAction()),
        builder: (BuildContext context, EarningsHistoryViewModel vm) {
          if (vm.earningsState.isLoading && vm.earningsState.translateEarningsHistoryList.isEmpty) {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
          return FormBuilderPaginatedListView(
            itemList: vm.earningsState.translateEarningsHistoryList,
            itemBuilder: (item, index) {
              if (vm.earningsState.isLoading && vm.earningsState.translateEarningsHistoryList.length - 1 == index) {
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
              return _singleEarningItem(index: index, earningModel: item);
            },
            fetchData: (ScrollController scrollController) {
              this._scrollController = scrollController;
            },
          );
        });
  }

  /// Widget function which will give the single earning history item
  Widget _singleEarningItem({int index, TranslatorEarningsHistoryModel earningModel}) {
    return Column(
      children: [
        _commonCardWidget(
          children: [
            _earningRow(FormBuilderLocalizations.of(context).titleText, earningModel.title),
            const SizedBox(height: 5.0),
            _earningRow(FormBuilderLocalizations.of(context).descriptionText, earningModel.description),
            const SizedBox(height: 5.0),
            _earningRow(
                FormBuilderLocalizations.of(context).transactionDateText, earningModel.transactionDate.toString()),
            const SizedBox(height: 5.0),
            _earningRow(FormBuilderLocalizations.of(context).paidOutDateText, earningModel.paidOutDate.toString()),
            const SizedBox(height: 5.0),
            _earningRow(FormBuilderLocalizations.of(context).amountPaidText, '\$ ${earningModel.amountPaid}'),
            const SizedBox(height: 5.0),
          ],
          onCardTap: () {},
        ),
        const SizedBox(height: 15.0),
      ],
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

  /// Widget function which will give the separate UI for the single row of the earning history.
  /// For eg. this widget will provide the UI for the Name and its value of a single earning history
  /// This have been used for the code optimizations and better performance.
  Widget _earningRow(String title, String message) {
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
}

class EarningsHistoryViewModel {
  final TranslateEarningsState earningsState;
  final Store<AppState> store;

  EarningsHistoryViewModel(this.earningsState, this.store);
}
