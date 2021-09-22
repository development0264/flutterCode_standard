import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var store = StoreProvider.of<AppState>(context);
    CompleteProfileResponseModel responseModel = store.state.signUpState.completeProfileResponseModel.data != null
        ? store.state.signUpState.completeProfileResponseModel
        : store.state.signInState.completeProfileResponseModel;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(responseModel.data.firstName + " " + responseModel.data.lastName)
            ),
            const SizedBox(height: 10),
            BaseButtonWidget(
              minWidth: Utils.screenWidth,
              btnChild: FormBuilderText(
                  message: 'Request a Translator',
                  textStyle: Styles.customTextStyle(textColor: Colors.white)),
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesConstants.requestTranslatorPage);
              },
            ),
            const SizedBox(height: 10),
            BaseButtonWidget(
              minWidth: Utils.screenWidth,
              btnChild: FormBuilderText(
                  message: 'Chats',
                  textStyle: Styles.customTextStyle(textColor: Colors.white)),
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesConstants.userChatPage);
              },
            ),
            const SizedBox(height: 10.0),
            BaseButtonWidget(
              minWidth: Utils.screenWidth,
              btnChild: FormBuilderText(
                  message: FormBuilderLocalizations.of(context).translatorProfileText,
                  textStyle: Styles.customTextStyle(textColor: Colors.white)),
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesConstants.translatePage);
              },
            ),
            const SizedBox(height: 10.0),
            BaseButtonWidget(
              minWidth: Utils.screenWidth,
              btnChild: FormBuilderText(
                  message: FormBuilderLocalizations.of(context).paymentText,
                  textStyle: Styles.customTextStyle(textColor: Colors.white)),
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesConstants.payment);
              },
            ),
            const SizedBox(height: 10.0),
            BaseButtonWidget(
              minWidth: Utils.screenWidth,
              btnChild: FormBuilderText(
                  message: "Applied Translator Jobs",
                  textStyle: Styles.customTextStyle(textColor: Colors.white)),
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesConstants.appliedJobsPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
