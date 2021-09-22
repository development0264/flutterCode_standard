import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:khontext/redux/actions/paymenthistory/payment_history_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/paymenthistory/payment_history_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_paginated_listview.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text_field.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/payment_history_filter_model.dart';
import 'package:khontext/src/models/payment_history_model.dart';
import 'package:khontext/src/screens/paymenthistory/payment_history_filter.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  /// Loading the dummy data for showing.
  List<PaymentHistoryData> paymentHistoryData = [];

  /// Global key for maintaining the state of the form.
  final _paymentHistoryFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the search of the posted jobs.
  final TextEditingController _searchController = TextEditingController();

  /// [PageController] passed to the paginated list view and will provide the functionality for the pagination of the
  /// list.
  ScrollController _scrollController = ScrollController();

  /// [bool] which gives the state of the filter menu. [true/false]
  bool isFilterOpen = false;

  /// Searching model.
  PaymentHistoryFilterModel currentModel = PaymentHistoryFilterModel();

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
                  message: FormBuilderLocalizations.of(context).paymentHistoryText,
                  textStyle: Styles.customTextStyle(textSize: 16.0),
                ),
                const SizedBox(height: 15.0),
                searchLayout(),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Visibility(
            visible: isFilterOpen,
            child: Expanded(
              child: PaymentHistoryFilter(
                formKey: _paymentHistoryFormKey,
                onCancelPress: () {
                  toggleFilterOption();
                },
                model: currentModel ??
                    PaymentHistoryFilterModel(
                        amountEnd: null, amountStart: null, paidOnEnd: null, paidOnStart: null, paymentStatus: null),
                onSaveButtonPress: (PaymentHistoryFilterModel model) {
                  this.currentModel.paymentStatus = model.paymentStatus;
                  this.currentModel.amountStart = model.amountStart;
                  this.currentModel.amountEnd = model.amountEnd;
                  this.currentModel.paidOnStart = model.paidOnStart;
                  this.currentModel.paidOnEnd = model.paidOnEnd;
                  refreshPage();
                  toggleFilterOption();
                },
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Visibility(visible: !isFilterOpen, child: Expanded(child: _paymentListWidget())),
        ],
      ),
    );
  }

  /// Widget function which will give the payment history list.
  Widget _paymentListWidget() {
    return StoreConnector<AppState, PaymentHistoryViewModel>(
        converter: (store) => PaymentHistoryViewModel(
            state: store.state.paymentHistoryState,
            getData: (limit, currentLastId) =>
                store.dispatch(PaymentHistoryFetchAction(limit: limit, startingAfter: currentLastId))),
        onInit: (store) => store.dispatch(PaymentHistoryFetchAction(limit: 10, startingAfter: null)),
        builder: (BuildContext context, PaymentHistoryViewModel vm) {
          if (vm.state.isLoading && vm.state.paymentHistoryModel.data.isEmpty) {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
          return FormBuilderPaginatedListView(
            itemList: vm.state.paymentHistoryModel.data,
            itemBuilder: (item, index) {
              if (vm.state.isLoading && vm.state.paymentHistoryModel.data.length - 1 == index) {
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
              return _singlePaymentItem(index: index, paymentModel: item);
            },
            fetchData: (ScrollController scrollController) {
              this._scrollController = scrollController;
              fetchNewData(vm, scrollController);
            },
          );
        });
  }

  Widget searchLayout() {
    return Row(
      children: [
        Expanded(
          child: FormBuilderTextField(
            name: Constants.postedJobsSearch,
            controller: _searchController,
            textInputAction: TextInputAction.done,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).searchPaymentText),
            onChanged: (searchValue) {
              this.currentModel.paymentSearch = searchValue;
              if (searchValue == '') {
                refreshPage();
              }
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
          onPressed: () {
            refreshPage();
          },
        ),
        const SizedBox(width: 10.0),
        BaseButtonWidget(
          minWidth: Utils.screenWidth * 0.08,
          height: Utils.screenWidth * 0.14,
          btnChild: Icon(
            Icons.filter_alt_outlined,
            size: Utils.screenWidth * 0.06,
            color: Colors.white,
          ),
          onPressed: () => toggleFilterOption(),
        ),
      ],
    );
  }

  /// Widget function which will give the single payment history item
  /// It contains four different values, 'name', 'amount', 'paid date', 'status'
  Widget _singlePaymentItem({int index, PaymentHistoryData paymentModel}) {
    return Column(
      children: [
        _commonCardWidget(
          children: [
            _paymentRow(FormBuilderLocalizations.of(context).nameText, paymentModel.description),
            const SizedBox(height: 5.0),
            _paymentRow(FormBuilderLocalizations.of(context).amountText,
                '${paymentModel.currency} ${paymentModel.amount.toString()}'),
            const SizedBox(height: 5.0),
            _paymentRow(FormBuilderLocalizations.of(context).paidDateText,
                ('${DateTime.fromMillisecondsSinceEpoch(paymentModel.availableOn).year}-${DateTime.fromMillisecondsSinceEpoch(paymentModel.availableOn).month}-${DateTime.fromMillisecondsSinceEpoch(paymentModel.availableOn).day}')),
            const SizedBox(height: 5.0),
            _paymentRow(FormBuilderLocalizations.of(context).statusText, paymentModel.status ?? ''),
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

  /// Widget function which will give the separate UI for the single row of the payment history.
  /// For eg. this widget will provide the UI for the Name and its value of a single payment history
  /// This have been used for the code optimizations and better performance.
  Widget _paymentRow(String title, String message) {
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

  /// Function which fetches new data and passed the data to the [PagingController] to get and load data in the list.
  void fetchNewData(PaymentHistoryViewModel vm, ScrollController scrollController) async {
    try {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        var store = StoreProvider.of<AppState>(context);
        var state = store.state.paymentHistoryState;

        List<PaymentHistoryData> tempData = state.paymentHistoryModel.data ?? [];

        if (state.paymentHistoryModel.hasMore) {
          store.dispatch(PaymentHistoryFetchAction(
              limit: 10, startingAfter: tempData.isNotEmpty ? tempData[tempData.length - 1].id : null));
        }
      }
    } catch (error) {
      print("The error ==> $error");
    }
  }

  void toggleFilterOption() {
    setState(() {
      isFilterOpen = !isFilterOpen;
    });
  }

  /// Function used for refreshing the page when a new value enters.
  void refreshPage() {
    // fetchNewData(this._scrollController);
  }
}

class PaymentHistoryViewModel {
  final PaymentHistoryState state;
  final void Function(int limit, String lastTaskId) getData;

  PaymentHistoryViewModel({this.state, this.getData});
}
