import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:khontext/redux/actions/translate/translatoreducation/translator_education_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_education_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator/translatoreducation/education_list_response_model.dart';
import 'package:khontext/src/screens/payments/payment_header.dart';
import 'package:khontext/src/screens/translate/translate_module_dialogs.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/add_module_widget.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class TranslatorEducationPage extends StatefulWidget {
  const TranslatorEducationPage({Key key}) : super(key: key);

  @override
  _TranslatorEducationPageState createState() => _TranslatorEducationPageState();
}

class _TranslatorEducationPageState extends State<TranslatorEducationPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TranslateEducationViewModel>(
      converter: (store) => TranslateEducationViewModel(
          translateEducationState: store.state.translateEducationState, store: store),
      onInit: (store) => store.dispatch(TranslateEducationFetchAction()),
      builder: (BuildContext context, TranslateEducationViewModel vm) {
        if (vm.translateEducationState.isLoading) {
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
                    headerTitle: FormBuilderLocalizations.of(context).educationText,
                    headerWidget: addEducationWidget()),
              ),
              const SizedBox(height: 15.0),
              educationList(vm),
            ],
          ),
        );
      },
    );
  }

  /// Widget function which gives functionality for the add card
  Widget addEducationWidget() {
    return AddModuleWidget(
      moduleText: FormBuilderLocalizations.of(context).addEducationText,
      onAddClick: () => TranslateDialog().showTranslateEducationDialog(context, isUpdate: false),
    );
  }

  /// Widget function which will give the [ListView] for the experience of a translator.
  Widget educationList(TranslateEducationViewModel vm) {
    if (vm?.translateEducationState?.translateEducationList?.data?.isEmpty == true) {
      return ErrorTextWidget(error: FormBuilderLocalizations.of(context).noEducationText);
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: vm.translateEducationState.translateEducationList.data.length,
      itemBuilder: (BuildContext context, int index) {
        return singleEducationListItem(
            vm.translateEducationState.translateEducationList.data[index], index);
      },
    );
  }

  /// Widget function which gives the UI for the single list item for the translator's experience.
  Widget singleEducationListItem(EducationData item, int index) {
    String date =
        '${DateFormat('MM/yyyy').format(item.startMonthAndYearDate)} - ${DateFormat('MM/yyyy').format(item.endMonthAndYearDate)}';
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
                  message: '${item.degree}, ${item.fieldOfStudy}, ${item.grade}',
                  textStyle: Styles.customTextStyle(textSize: 15.0)),
              commonSpace(),
              FormBuilderText(message: date, textStyle: Styles.customTextStyle(textSize: 15.0)),
              commonSpace(),
              FormBuilderText(
                  message: item.activitiesAndSocieties,
                  textStyle: Styles.customTextStyle(textSize: 15.0)),
              commonSpace(),
              FormBuilderText(
                  message: item.description, textStyle: Styles.customTextStyle(textSize: 15.0)),
            ],
          ),
        ),
        commonSpace(),
      ],
    );
  }

  /// Widget function which gives the single item's header, along with the edit icon.
  Widget itemHeaderWidget(EducationData item, int index) {
    return Row(
      children: [
        Expanded(
          child: FormBuilderText(
            message: item.schoolName,
            textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor, textSize: 18.0),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            TranslateDialog().showTranslateEducationDialog(context,
                index: index, dataModel: item, isUpdate: true);
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

class TranslateEducationViewModel {
  final Store<AppState> store;
  final TranslateEducationState translateEducationState;

  TranslateEducationViewModel({this.store, this.translateEducationState});
}
