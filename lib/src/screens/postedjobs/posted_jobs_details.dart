import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/postedjobs/post_jobs_list_response_model.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';

class PostedJobsDetailsPage extends StatefulWidget {
  final JobsListData jobsModel;

  const PostedJobsDetailsPage({Key key, this.jobsModel}) : super(key: key);

  @override
  _PostedJobsDetailsPageState createState() => _PostedJobsDetailsPageState();
}

class _PostedJobsDetailsPageState extends State<PostedJobsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Utils.screenWidth * 0.05,
                top: Utils.screenHeight * 0.06,
                right: Utils.screenWidth * 0.05,
              ),
              child: FormBuilderText(
                message: FormBuilderLocalizations.of(context).jobsDetailsText,
                textStyle: Styles.customTextStyle(textSize: 16.0),
              ),
            ),
            const SizedBox(height: 15.0),
            _commonCardWidget(
              onCardTap: () {},
              children: [
                _jobHeader(FormBuilderLocalizations.of(context).descriptionText),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).titleText,
                    widget.jobsModel.description.title),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).descriptionText,
                    widget.jobsModel.description.description),
              ],
            ),
            const SizedBox(height: 15.0),
            _commonCardWidget(
              onCardTap: () {},
              children: [
                _jobHeader(FormBuilderLocalizations.of(context).languageText),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).sourceLanguageText,
                    widget.jobsModel.language.fromLanguage.name),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).destinationLanguageText,
                    widget.jobsModel.language.toLanguage.name),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).specializationsText,
                    widget.jobsModel.language.specializations.map((e) => e.name).join(', ')),
              ],
            ),
            const SizedBox(height: 15.0),
            _commonCardWidget(
              onCardTap: () {},
              children: [
                _jobHeader(FormBuilderLocalizations.of(context).placeText),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).placeText,
                    getFullAddress(widget.jobsModel.location)),
              ],
            ),
            const SizedBox(height: 15.0),
            _commonCardWidget(
              onCardTap: () {},
              children: [
                _jobHeader(FormBuilderLocalizations.of(context).visibilityText),
                const SizedBox(height: 15.0),
                _singleItem(
                    FormBuilderLocalizations.of(context).boundaryText,
                    widget.jobsModel.visibility.geographicalBoundary
                        ?.map((e) => e.name)
                        ?.join(', ')),
                const SizedBox(height: 15.0),
                _singleItem(
                    FormBuilderLocalizations.of(context).specialityText,
                    widget.jobsModel.visibility.languageSpecialties
                        ?.map((e) => e.name)
                        ?.join(', ')),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).proficiencyText,
                    widget.jobsModel.visibility.proficiencyLevel?.name),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).experienceText,
                    widget.jobsModel.visibility.minimumExperience?.toString()),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).ratingsText,
                    widget.jobsModel.visibility.minimumRatings?.toString()),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).reviewsText,
                    widget.jobsModel.visibility.minimumReviews),
              ],
            ),
            const SizedBox(height: 15.0),
            _commonCardWidget(
              onCardTap: () {},
              children: [
                _jobHeader(FormBuilderLocalizations.of(context).scheduleText),
                const SizedBox(height: 15.0),
                _singleItem(
                    '${FormBuilderLocalizations.of(context).fromText} - ${FormBuilderLocalizations.of(context).toText}',
                    widget.jobsModel.schedule.scheduleDateTimes
                        .map((e) => '${getDateTime(e.fromDateTime)} - ${getDateTime(e.toDateTime)}')
                        .join('\n')),
              ],
            ),
            const SizedBox(height: 15),
            BaseButtonWidget(
              minWidth: Utils.screenWidth,
              btnChild: FormBuilderText(
                  message: 'Offers', textStyle: Styles.customTextStyle(textColor: Colors.white)),
              onPressed: onOffersButtonClicked,
            ),
          ],
        ),
      ),
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
  Widget _jobHeader(String title) {
    return FormBuilderText(
      message: title,
      textStyle: Styles.customTextStyle(textSize: 18.0),
    );
  }

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

  void onOffersButtonClicked() {
    Navigator.of(context).pushNamed(RoutesConstants.acceptJobsPage, arguments: {
      RoutesConstantsArguments.jobData: widget.jobsModel,
    });
  }
}
