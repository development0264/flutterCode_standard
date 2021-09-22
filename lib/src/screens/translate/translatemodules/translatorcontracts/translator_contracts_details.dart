import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator_contracts_model.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';

class TranslatorContractDetails extends StatefulWidget {
  final TranslatorContractsModel singleModel;

  const TranslatorContractDetails({Key key, this.singleModel}) : super(key: key);

  @override
  _TranslatorContractDetailsState createState() => _TranslatorContractDetailsState();
}

class _TranslatorContractDetailsState extends State<TranslatorContractDetails> {
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
                message: FormBuilderLocalizations.of(context).contractDetailsText,
                textStyle: Styles.customTextStyle(textSize: 16.0),
              ),
            ),
            const SizedBox(height: 15.0),
            _commonCardWidget(
              onCardTap: () {},
              children: [
                _singleItem(FormBuilderLocalizations.of(context).titleText, widget.singleModel.title),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).byText, widget.singleModel.owner),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).budgetText, '\$ ${widget.singleModel.contractBudget}'),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).statusText, widget.singleModel.contractStatus),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).languageText,
                    '${widget.singleModel.fromLanguage} ${FormBuilderLocalizations.of(context).toText} ${widget.singleModel.toLanguage}'),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).specialityText, widget.singleModel.speciality),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).serviceText,
                    '${widget.singleModel.service} (${widget.singleModel.serviceType})'),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).descriptionText, widget.singleModel.description,
                    maxLines: 50),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).locationText, widget.singleModel.location,
                    maxLines: 15),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).scheduleText, widget.singleModel.schedule,
                    maxLines: 15),
                const SizedBox(height: 15.0),
                _singleItem(FormBuilderLocalizations.of(context).feedbackText, widget.singleModel.schedule,
                    maxLines: 15),
                const SizedBox(height: 15.0),
              ],
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

  Widget _singleItem(String title, String value, {int maxLines}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderText(message: title, textStyle: Styles.customTextStyle(textSize: 16.0)),
        const SizedBox(height: 5.0),
        FormBuilderText(
          message: value,
          textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.w500),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
