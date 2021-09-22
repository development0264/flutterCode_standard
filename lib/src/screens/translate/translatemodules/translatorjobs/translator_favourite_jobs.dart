import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorjobs/translator_jobs_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_jobs_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_paginated_listview.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_fav_jobs_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_fav_jobs_response.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class TranslatorFavouriteJobs extends StatefulWidget {
  const TranslatorFavouriteJobs({Key key}) : super(key: key);

  @override
  _TranslatorFavouriteJobsState createState() => _TranslatorFavouriteJobsState();
}

class _TranslatorFavouriteJobsState extends State<TranslatorFavouriteJobs> {
  /// [ScrollController] passed to the paginated list view and will provide the functionality for the pagination of the
  /// list.
  ScrollController _scrollController = ScrollController();

  /// Page size for the pagination.
  static const _pageSize = 5;

  /// Page number
  int _pageNumber = 1;

  /// App Store object
  Store<AppState> store;

  String userId;

  @override
  Widget build(BuildContext context) {
    userId = Utils.getStringFromPrefs(Constants.userToken);
    return Scaffold(
      appBar: _appBarTitle(),
      body: StoreConnector<AppState, FavoritesViewModel>(
        converter: (store) =>
            FavoritesViewModel(translateJobsState: store.state.translateJobsState),
        onInit: (store) => store.dispatch(
          FavoriteJobsFetchAction(
            translatorFavJobsRequest: TranslatorFavJobsRequest(
              userId: userId,
              searchJobTitle: '',
              queryList: [],
              pageNumber: _pageNumber,
              pageSize: _pageSize,
            ),
          ),
        ),
        builder: (context, vm) {
          if (vm.translateJobsState.isLoading) {
            return BaseLoadingWidget();
          } else if (!vm.translateJobsState.isLoading &&
              vm.translateJobsState.favoriteResponse.isEmpty) {
            return ErrorTextWidget(error: 'No data found');
          }
          return FormBuilderPaginatedListView(
            itemList: vm.translateJobsState.favoriteResponse,
            itemBuilder: (item, index) {
              if (vm.translateJobsState.isLoading &&
                  vm.translateJobsState.favoriteResponse.length - 1 == index) {
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
              return _singleItem(favoriteJobsResponse: item);
            },
            fetchData: (ScrollController scrollController) {
              this._scrollController = scrollController;
              if (!vm.translateJobsState.isLoading) {
                fetchNewData(scrollController);
              }
            },
          );
        },
      ),
    );
  }

  /// Widget function which gives the ui for the app bar, have the text favorites.
  Widget _appBarTitle() {
    return AppBar(
      centerTitle: true,
      title: FormBuilderText(message: 'Favorites'),
      backgroundColor: Palette.AppThemeColor,
    );
  }

  Widget _singleItem({FavoriteJobsResponse favoriteJobsResponse}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _commonCardWidget(
          children: [
            FormBuilderText(
              message: favoriteJobsResponse.jobResponse.description.title,
              textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.bold),
            ),
            FormBuilderText(
              message: favoriteJobsResponse.jobResponse.description.description,
              textStyle: Styles.customTextStyle(textSize: 16.0),
            ),
          ],
          onCardTap: () {},
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  /// Widget function which returns the ui for the card widget
  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return FormBuilderCard(
      onCardTap: onCardTap,
      shadowColor: Palette.AppThemeColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }

  /// Function which fetches new data and passed the data to the [PagingController] to get and load data in the list.
  void fetchNewData(ScrollController scrollController) async {
    try {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        store.dispatch(
          FavoriteJobsFetchAction(
            translatorFavJobsRequest: TranslatorFavJobsRequest(
              userId: userId,
              searchJobTitle: '',
              queryList: [],
              pageNumber: _pageNumber + 1,
              pageSize: _pageSize,
            ),
          ),
        );
      }
    } catch (error) {
      print("The error ==> $error");
    }
  }
}

class FavoritesViewModel {
  final TranslateJobsState translateJobsState;

  FavoritesViewModel({this.translateJobsState});
}
