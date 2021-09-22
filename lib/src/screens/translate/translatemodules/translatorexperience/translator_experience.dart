import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:khontext/redux/actions/translate/translatorexperience/translator_experience_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_experience_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator/translatorexperience/experience_list_response_model.dart';
import 'package:khontext/src/screens/payments/payment_header.dart';
import 'package:khontext/src/screens/translate/translate_module_dialogs.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/add_module_widget.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class TranslatorExperiencePage extends StatefulWidget {
  const TranslatorExperiencePage({Key key}) : super(key: key);

  @override
  _TranslatorExperiencePageState createState() => _TranslatorExperiencePageState();
}

class _TranslatorExperiencePageState extends State<TranslatorExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TranslatorExperienceViewModel>(
      distinct: true,
      converter: (store) => TranslatorExperienceViewModel(
          translateExperienceState: store.state.translateExperienceState, store: store),
      onInit: (store) => store.dispatch(TranslateExperienceFetchAction()),
      builder: (BuildContext context, TranslatorExperienceViewModel vm) {
        if (vm.translateExperienceState.isLoading) {
          return BaseLoadingWidget();
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Utils.screenWidth * 0.05,
                    top: Utils.screenHeight * 0.02,
                    right: Utils.screenWidth * 0.05),
                child: PaymentHeader(
                    headerTitle: FormBuilderLocalizations.of(context).experienceText,
                    headerWidget: addExperienceWidget()),
              ),
              const SizedBox(height: 15.0),
              experienceList(vm),
            ],
          ),
        );
      },
    );
  }

  /// Widget function which gives functionality for the add card
  Widget addExperienceWidget() {
    return AddModuleWidget(
      moduleText: FormBuilderLocalizations.of(context).addExperienceText,
      onAddClick: () => TranslateDialog().showTranslateExperienceDialog(context, isUpdate: false),
    );
  }

  /// Widget function which will give the [ListView] for the experience of a translator.
  Widget experienceList(TranslatorExperienceViewModel vm) {
    if (vm?.translateExperienceState?.experienceListResponseModel?.data?.isEmpty == true) {
      return ErrorTextWidget(error: FormBuilderLocalizations.of(context).noExperienceText);
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: vm?.translateExperienceState?.experienceListResponseModel?.data?.length,
      itemBuilder: (BuildContext context, int index) {
        return singleExperienceListItem(
            vm.translateExperienceState.experienceListResponseModel.data[index], index);
      },
    );
  }

  /// Widget function which gives the UI for the single list item for the translator's experience.
  Widget singleExperienceListItem(ExperienceData item, int index) {
    String date =
        '${DateFormat('MM-dd-yyyy').format(item.fromDate)} - ${item.isCurrentWorkingHere ? FormBuilderLocalizations.of(context).presentText : DateFormat('MM-dd-yyyy').format(item.toDate)}';
    return Column(
      children: [
        _commonCardWidget(
          onCardTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              itemHeaderWidget(item, index),
              commonSpace(),
              FormBuilderText(
                  message: item.company, textStyle: Styles.customTextStyle(textSize: 15.0)),
              commonSpace(),
              FormBuilderText(
                  message: item.employmentTypeId,
                  textStyle: Styles.customTextStyle(textSize: 15.0)),
              commonSpace(),
              FormBuilderText(message: date, textStyle: Styles.customTextStyle(textSize: 15.0)),
            ],
          ),
        ),
        commonSpace(),
      ],
    );
  }

  /// Widget function which gives the single item's header, along with the edit icon.
  Widget itemHeaderWidget(ExperienceData item, int index) {
    return Row(
      children: [
        Expanded(
          child: FormBuilderText(
            message: item.company,
            textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor, textSize: 18.0),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            TranslateDialog().showTranslateExperienceDialog(context,
                isUpdate: true, dataModel: item, index: index);
          },
          child: Icon(Icons.edit, size: 18.0, color: Palette.AppThemeColor),
        ),
      ],
    );
  }

  Widget _commonCardWidget({Widget child, Function onCardTap}) {
    return FormBuilderCard(
      onCardTap: onCardTap,
      shadowColor: Palette.AppThemeColor,
      child: child,
    );
  }

  Widget commonSpace() {
    return SizedBox(height: 8.0);
  }
}

class TranslatorExperienceViewModel {
  final Store<AppState> store;
  final TranslateExperienceState translateExperienceState;

  TranslatorExperienceViewModel({this.translateExperienceState, this.store});
}
