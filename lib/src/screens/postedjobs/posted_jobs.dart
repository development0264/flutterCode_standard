import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:khontext/data.dart';
import 'package:khontext/redux/actions/postedjobs/posted_job_list_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postedjobs/posted_jobs_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_description_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_paginated_listview.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/posted_jobs_filter_model.dart';
import 'package:khontext/src/models/posted_jobs_model.dart';
import 'package:khontext/src/models/postedjobs/post_jobs_list_request_model.dart';
import 'package:khontext/src/models/postedjobs/post_jobs_list_response_model.dart';
import 'package:khontext/src/screens/postedjobs/jobs_filter.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class PostedJobsPage extends StatefulWidget {
  @override
  _PostedJobsPageState createState() => _PostedJobsPageState();
}

class _PostedJobsPageState extends State<PostedJobsPage> {
  /// Loading the dummy data for showing.
  List<PostedJobsModel> postedJobsData = Data.postedJobsData;

  /// [ScrollController] passed to the paginated list view and will provide the functionality for the pagination of the
  /// list.
  ScrollController _scrollController = ScrollController();

  /// [TextEditingController] for the search of the posted jobs.
  final TextEditingController _searchController = TextEditingController();

  /// [bool] which gives the state of the filter menu. [true/false]
  bool isFilterOpen = false;

  /// Searching model.
  PostedJobsFilterModel currentModel = PostedJobsFilterModel();

  /// Total list of the page.
  List<JobsListData> postedJobsList = [];

  /// Store instance to use further
  Store<AppState> store;

  /// Page size for the pagination.
  static const _pageSize = 10;

  /// Page number
  int _pageNumber = 1;

  /// [String] for getting the user id from the shared preferences.
  String userId = '';

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    userId = Utils.getStringFromPrefs(Constants.userToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, PostedJobViewModel>(
        converter: (store) => PostedJobViewModel(store.state.postedJobsListState),
        onInit: (store) => store.dispatch(
          PostedJobListFetchAction(
            postedJobsRequestModel: PostedJobsRequestModel(
              queryList: [],
              pageNumber: _pageNumber,
              pageSize: _pageSize,
              userId: userId,
            ),
          ),
        ),
        builder: (context, vm) {
          postedJobsList =
              vm?.postedJobsListState?.jobReviewResponseModel?.data?.jobReviewResponses ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerLayout(),
              filterLayout(),
              const SizedBox(height: 15.0),
              Expanded(child: jobsListLayout(vm)),
            ],
          );
        },
      ),
    );
  }

  /// Widget function which gives the ui for the header of the jobs list page
  Widget headerLayout() {
    return Padding(
      padding: EdgeInsets.only(
        left: Utils.screenWidth * 0.05,
        top: Utils.screenHeight * 0.06,
        right: Utils.screenWidth * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: FormBuilderText(
                  message: FormBuilderLocalizations.of(context).postedJobsText,
                  textStyle: Styles.customTextStyle(textSize: 18.0),
                ),
              ),
              BaseButtonWidget(
                minWidth: Utils.screenWidth * 0.08,
                height: Utils.screenWidth * 0.12,
                btnChild: Icon(
                  Icons.add,
                  size: Utils.screenWidth * 0.06,
                  color: Colors.white,
                ),
                onPressed: () {
                  store.state.postJobDescriptionState = PostJobDescriptionState.initial();
                  store.state.postJobsState = PostJobsState.initial();
                  Navigator.of(context).pushNamed(RoutesConstants.postJobs);
                },
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          searchLayout(),
          const SizedBox(height: 15.0),
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
          model:
              currentModel ?? PostedJobsFilterModel(fromLanguage: '', search: '', toLanguage: ''),
          onSaveButtonPress: (PostedJobsFilterModel model) {
            refreshPage();
            toggleFilterOption();
          },
        ),
      ),
    );
  }

  Widget jobsListLayout(PostedJobViewModel vm) {
    return Visibility(
      visible: !isFilterOpen,
      child: FormBuilderPaginatedListView(
        itemList: postedJobsList,
        itemBuilder: (item, index) {
          if (vm.postedJobsListState.isLoading &&
              vm.postedJobsListState.jobReviewResponseModel.data.jobReviewResponses.isEmpty) {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
          if (vm.postedJobsListState.isLoading &&
              vm.postedJobsListState.jobReviewResponseModel.data.jobReviewResponses.length - 1 ==
                  index) {
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
          fetchNewData(scrollController);
        },
      ),
    );
  }

  /// Widget function which gives the layout for the search field and search button.
  /// On click of the search button, the searched list is shown in the below.
  /// The [PagingController] is updated and refreshed on every button click so that the data does not conflicts.
  Widget searchLayout() {
    return Row(
      children: [
        Expanded(
          child: FormBuilderTextField(
            name: Constants.postedJobsSearch,
            controller: _searchController,
            textInputAction: TextInputAction.done,
            decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).searchJobsText),
            onChanged: (searchValue) {
              this.currentModel.search = searchValue;
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
          onPressed: () {
            toggleFilterOption();
          },
        ),
      ],
    );
  }

  /// Widget function which gives the single list item for the posted job.
  Widget singleJobsItem({JobsListData model}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _commonCardWidget(
            children: [
              FormBuilderText(
                message: model.description.title,
                textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.bold),
              ),
              FormBuilderText(
                message: model.description.description,
                textStyle: Styles.customTextStyle(textSize: 16.0),
              ),
            ],
            onCardTap: () {
              Navigator.of(context).pushNamed(
                RoutesConstants.postedJobsDetails,
                arguments: {RoutesConstantsArguments.jobModelArgs: model},
              );
            }),
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
          Icon(Icons.arrow_forward_outlined, color: Palette.TextColor, size: 25.0),
        ],
      ),
    );
  }

  /// Function which fetches new data and passed the data to the [PagingController] to get and load data in the list.
  void fetchNewData(ScrollController scrollController) async {
    try {
      print(
          "The scroll ---> ${_scrollController.position.pixels} and ${_scrollController.position.maxScrollExtent}");
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        store.dispatch(
          PostedJobListFetchAction(
            postedJobsRequestModel: PostedJobsRequestModel(
              userId: userId,
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

  void toggleFilterOption() {
    setState(() {
      isFilterOpen = !isFilterOpen;
    });
  }

  /// Function used for refreshing the page when a new value enters.
  void refreshPage() {
    postedJobsList.clear();
    fetchNewData(_scrollController);
  }
}

class PostedJobViewModel {
  final PostedJobsListState postedJobsListState;

  PostedJobViewModel(this.postedJobsListState);
}
