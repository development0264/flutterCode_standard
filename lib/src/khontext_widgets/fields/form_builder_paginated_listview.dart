import 'package:flutter/material.dart';

/// The widget which will manage the pagination for the listview. It uses the custom widget [PagedListView] for
/// completing the pagination functionality.
// ignore: must_be_immutable
class FormBuilderPaginatedListView extends StatefulWidget {
  final Function fetchData;
  final Function itemBuilder;
  final List<dynamic> itemList;

  FormBuilderPaginatedListView({Key key, this.fetchData, this.itemBuilder, this.itemList}) : super(key: key);

  @override
  _FormBuilderPaginatedListViewState createState() => _FormBuilderPaginatedListViewState();
}

class _FormBuilderPaginatedListViewState extends State<FormBuilderPaginatedListView> {
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() => widget.fetchData(_scrollController));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.zero,
      itemCount: widget.itemList.length,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (_, index) => widget.itemBuilder(widget.itemList[index], index),
    );
  }
}
