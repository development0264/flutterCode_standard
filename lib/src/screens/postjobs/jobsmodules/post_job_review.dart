import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/post_job_review_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_review_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/postjobs/jobreview/job_review_response_model.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class PostJobReview extends StatefulWidget {
  final String jobId;
  final Function editJob;

  const PostJobReview({Key key, this.jobId, this.editJob}) : super(key: key);

  @override
  _PostJobReviewState createState() => _PostJobReviewState();
}

class _PostJobReviewState extends State<PostJobReview> {
  /// Store instance to use further
  Store<AppState> store;

  JobDescriptionData jobDescriptionData;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    jobDescriptionData = store.state.postJobDescriptionState.postJobDescriptionResponseModel.data;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PostJobReviewViewModel>(
      converter: (store) => PostJobReviewViewModel(store.state.postJobReviewState),
      onInit: (store) => store.dispatch(PostJobReviewFetchAction(
          jobId: widget.jobId != null
              ? widget.jobId
              : store
                  ?.state?.postJobDescriptionState?.postJobDescriptionResponseModel?.data?.jobId)),
      builder: (context, vm) {
        if (vm.postJobReviewState.isLoading) {
          return BaseLoadingWidget();
        }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Utils.screenHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reviewDetailsLayout(context, vm?.postJobReviewState?.jobReviewResponseModel?.data),
                const SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Utils.screenWidth * 0.05),
                  child: BaseButtonWidget(
                    minWidth: Utils.screenWidth,
                    btnChild: FormBuilderText(
                        message: 'Post Job',
                        textStyle: Styles.customTextStyle(textColor: Colors.white)),
                    onPressed: () {
                      store.dispatch(
                        SetJobReviewAction(
                          jobId: widget.jobId != null ? widget.jobId : jobDescriptionData.jobId,
                          context: context,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget reviewDetailsLayout(BuildContext context, ReviewData reviewData) {
    if (reviewData == null) {
      return Center(
          child: FormBuilderText(message: FormBuilderLocalizations.of(context).noReviewText));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _commonCardWidget(
          onCardTap: () {},
          children: [
            _jobHeader(FormBuilderLocalizations.of(context).descriptionText, 0),
            const SizedBox(height: 15.0),
            _singleItem(
                FormBuilderLocalizations.of(context).titleText, reviewData.description.title),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).descriptionText,
                reviewData.description.description),
          ],
        ),
        const SizedBox(height: 15.0),
        _commonCardWidget(
          onCardTap: () {},
          children: [
            _jobHeader(FormBuilderLocalizations.of(context).languageText, 1),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).sourceLanguageText,
                reviewData.language.fromLanguage.name),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).destinationLanguageText,
                reviewData.language.toLanguage.name),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).specializationsText,
                reviewData.language.specializations.map((e) => e.name).join(', ')),
          ],
        ),
        const SizedBox(height: 15.0),
        _commonCardWidget(
          onCardTap: () {},
          children: [
            _jobHeader(FormBuilderLocalizations.of(context).placeText, 2),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).placeText,
                getFullAddress(reviewData.location)),
          ],
        ),
        const SizedBox(height: 15.0),
        _commonCardWidget(
          onCardTap: () {},
          children: [
            _jobHeader(FormBuilderLocalizations.of(context).visibilityText, 3),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).boundaryText,
                reviewData.visibility.geographicalBoundary.map((e) => e.name).join(', ')),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).specialityText,
                reviewData.visibility.languageSpecialties.map((e) => e.name).join(', ')),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).proficiencyText,
                reviewData.visibility.proficiencyLevel.name),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).experienceText,
                reviewData.visibility.minimumExperience.toString()),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).ratingsText,
                reviewData.visibility.minimumRatings.toString()),
            const SizedBox(height: 15.0),
            _singleItem(FormBuilderLocalizations.of(context).reviewsText,
                reviewData.visibility.minimumReviews),
          ],
        ),
        const SizedBox(height: 15.0),
        _commonCardWidget(
          onCardTap: () {},
          children: [
            _jobHeader(FormBuilderLocalizations.of(context).scheduleText, 4),
            const SizedBox(height: 15.0),
            _singleItem(
                '${FormBuilderLocalizations.of(context).fromText} - ${FormBuilderLocalizations.of(context).toText}',
                reviewData.schedule.scheduleDateTimes
                    .map((e) => '${getDateTime(e.fromDateTime)} - ${getDateTime(e.toDateTime)}')
                    .join('\n')),
          ],
        ),
      ],
    );
  }

  /// Widget function which will give the base card view.
  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return FormBuilderCard(
      onCardTap: onCardTap,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }

  /// Widget function which will give the header of the card.
  Widget _jobHeader(String title, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FormBuilderText(
          message: title,
          textStyle: Styles.customTextStyle(textSize: 18.0),
        ),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () => widget.editJob(index),
          child: Icon(
            Icons.edit,
            size: 18.0,
          ),
        ),
      ],
    );
  }

  /// Widget function which gives the UI for the single item row.
  Widget _singleItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderText(message: title, textStyle: Styles.customTextStyle(textSize: 16.0)),
        const SizedBox(height: 5.0),
        FormBuilderText(
            message: value,
            textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.w500)),
      ],
    );
  }

  /// Function which takes location and returns full address.
  String getFullAddress(ClientAddressData location) {
    List<String> tempList = [
      location.streetNumber,
      location.streetName,
      location.line1,
      location.line2,
      location.city,
      location.county,
      location.country,
      location.zipCode,
    ];
    return Utils().getSeparatedAddress(tempList);
  }

  String getDateTime(DateTime time) {
    return '${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}';
  }
}

class PostJobReviewViewModel {
  final PostJobReviewState postJobReviewState;

  PostJobReviewViewModel(this.postJobReviewState);
}
