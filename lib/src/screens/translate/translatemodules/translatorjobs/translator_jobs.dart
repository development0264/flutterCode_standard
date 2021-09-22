import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorjobs/translator_jobs_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_jobs_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_paginated_listview.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text_field.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/posted_jobs_filter_model.dart';
import 'package:khontext/src/models/posted_jobs_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_fav_job_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_jobs_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_jobs_response.dart';
import 'package:khontext/src/screens/postedjobs/jobs_filter.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class TranslatorJobsPage extends StatefulWidget {
  const TranslatorJobsPage({Key key}) : super(key: key);

  @override
  _TranslatorJobsPageState createState() => _TranslatorJobsPageState();
}

class _TranslatorJobsPageState extends State<TranslatorJobsPage> {
  /// [ScrollController] passed to the paginated list view and will provide the functionality for the pagination of the
  /// list.
  ScrollController _scrollController = ScrollController();

  /// Page size for the pagination.
  static const _pageSize = 5;

  /// Page number
  int _pageNumber = 1;

  /// [bool] which gives the state of the filter menu. [true/false]
  bool isFilterOpen = false;

  /// [TextEditingController] for the search of the posted jobs.
  final TextEditingController _searchController = TextEditingController();

  /// Total list of the page.
  List<PostedJobsModel> postedJobsList = [];

  /// App Store object
  Store<AppState> store;

  /// Filter model
  PostedJobsFilterModel filterModel = PostedJobsFilterModel.initial();

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
        filterLayout(),
        const SizedBox(height: 10.0),
        Expanded(child: _translateJobsListWidget()),
      ],
    );
  }

  /// Widget function which will give the payment history list.
  Widget _translateJobsListWidget() {
    return StoreConnector<AppState, TranslatorJobsViewModel>(
        converter: (store) => TranslatorJobsViewModel(jobsState: store.state.translateJobsState),
        onInit: (store) => store.dispatch(
              TranslateJobsFetchAction(
                translatorJobsRequest: TranslatorJobsRequest(
                  searchQuery: '',
                  queryList: [],
                  page: _pageNumber,
                  pageSize: _pageSize,
                ),
              ),
            ),
        builder: (BuildContext context, TranslatorJobsViewModel vm) {
          if (vm.jobsState.isLoading && vm.jobsState.translateJobsList.isEmpty) {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
          return FormBuilderPaginatedListView(
            itemList: vm.jobsState.translateJobsList,
            itemBuilder: (item, index) {
              if (vm.jobsState.isLoading && vm.jobsState.translateJobsList.length - 1 == index) {
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
              return singleJobsItem(model: item);
            },
            fetchData: (ScrollController scrollController) {
              this._scrollController = scrollController;
              if (!vm.jobsState.isLoading) {
                fetchNewData(scrollController);
              }
            },
          );
        });
  }

  /// Widget function which gives the layout for the search field and search button.
  /// On click of the search button, the searched list is shown in the below.
  /// The [PagingController] is updated and refreshed on every button click so that the data does not conflicts.
  Widget searchLayout() {
    return Row(
      children: [
        Expanded(
          child: FormBuilderTextField(
            name: Constants.translatorJobs,
            controller: _searchController,
            textInputAction: TextInputAction.done,
            decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).searchJobsText),
            onChanged: (searchValue) {
              if (searchValue == '') {
                refreshPage(null);
              } else {
                filterModel.search = searchValue;
              }
            },
          ),
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
          onPressed: () {
            toggleFilterOption();
          },
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
        const SizedBox(width: 10.0),
        BaseButtonWidget(
          minWidth: Utils.screenWidth * 0.08,
          height: Utils.screenWidth * 0.14,
          btnChild: Icon(
            Icons.favorite_outlined,
            size: Utils.screenWidth * 0.06,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pushNamed(RoutesConstants.translatorFavoriteJobs),
        ),
      ],
    );
  }

  /// Widget function which gives the single list item for the posted job.
  Widget singleJobsItem({JobRecord model}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _commonCardWidget(
          model: model,
          children: [
            FormBuilderText(
              message: model.title,
              textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.bold),
            ),
            FormBuilderText(
              message: model.description,
              textStyle: Styles.customTextStyle(textSize: 16.0),
            ),
          ],
          onCardTap: () {},
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  Widget _commonCardWidget({List<Widget> children, Function onCardTap, JobRecord model}) {
    return FormBuilderCard(
      onCardTap: onCardTap,
      shadowColor: Palette.AppThemeColor,
      child: Row(
        children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children)),
          PopupMenuButton(
              onSelected: (selectedValue) {
                String userId = Utils.getStringFromPrefs(Constants.userToken);
                if (selectedValue == JOBS_ENUM.ADD_FAV) {
                  store.dispatch(
                    AddFavoriteJobsAction(
                      addFavJobRequest: AddFavJobRequest(
                        userId: userId,
                        jobId: model.id,
                        isFavorite: true,
                      ),
                    ),
                  );
                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: JOBS_ENUM.SEND_MESSAGE,
                      child: FormBuilderText(
                          message: FormBuilderLocalizations.of(context).sendMessageText),
                    ),
                    PopupMenuItem(
                      value: JOBS_ENUM.COPY_LINK,
                      child: FormBuilderText(
                          message: FormBuilderLocalizations.of(context).copyLinkText),
                    ),
                    PopupMenuItem(
                      value: JOBS_ENUM.ADD_FAV,
                      child: FormBuilderText(message: "Add To favorites"),
                    ),
                  ]),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              RoutesConstants.applyJobsPage,
              arguments: {RoutesConstantsArguments.jobData: model},
            ),
            child: FormBuilderText(
              message: 'Apply',
              textStyle: Styles.customTextStyle(
                textColor: Palette.AppThemeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget function which gives the ui for the filter layout.
  Widget filterLayout() {
    return Visibility(
      visible: isFilterOpen,
      child: Expanded(
        child: JobsFilter(
          onCancelPress: () => toggleFilterOption(),
          model: PostedJobsFilterModel(toLanguage: '', search: '', fromLanguage: ''),
          onSaveButtonPress: (PostedJobsFilterModel model) {
            print("The model ---> ${model.fromLanguage}");
            refreshPage(model);
            toggleFilterOption();
          },
        ),
      ),
    );
  }

  /// Function which fetches new data and passed the data to the [PagingController] to get and load data in the list.
  void fetchNewData(ScrollController scrollController) async {
    try {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        store.dispatch(
          TranslateJobsFetchAction(
            translatorJobsRequest: TranslatorJobsRequest(
              searchQuery: '',
              queryList: [],
              page: _pageNumber + 1,
              pageSize: _pageSize,
            ),
          ),
        );
      }
    } catch (error) {
      print("The error ==> $error");
    }
  }

  /// Function used for refreshing the page when a new value enters.
  void refreshPage(PostedJobsFilterModel filterModel) {
    List<QueryList> queryList = [];
    if (filterModel?.toLanguage?.isNotEmpty == true) {
      queryList.add(QueryList(param: 'ToLanguage', value: filterModel.toLanguage));
    }
    if (filterModel?.fromLanguage?.isNotEmpty == true) {
      queryList.add(QueryList(param: 'FromLanguage', value: filterModel.fromLanguage));
    }
    _pageNumber = 1;
    store.dispatch(
      TranslateJobsFetchAction(
        translatorJobsRequest: TranslatorJobsRequest(
          searchQuery: filterModel.search != null ? filterModel.search : '',
          queryList: queryList,
          page: _pageNumber,
          pageSize: _pageSize,
        ),
      ),
    );
  }

  void toggleFilterOption() {
    setState(() {
      isFilterOpen = !isFilterOpen;
    });
  }
}

class TranslatorJobsViewModel {
  final TranslateJobsState jobsState;

  TranslatorJobsViewModel({this.jobsState});
}
