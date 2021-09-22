import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/data.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/signin/sign_in_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_image.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator_details_model.dart';
import 'package:khontext/src/screens/voicecall/voice_call_screen.dart';
import 'package:khontext/utils/chat_utils.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:redux/redux.dart';
import 'package:twilio_voice/twilio_voice.dart';

class TranslatorListPage extends StatefulWidget {
  final String language;

  const TranslatorListPage({Key key, this.language}) : super(key: key);

  @override
  _TranslatorListPageState createState() => _TranslatorListPageState();
}

class _TranslatorListPageState extends State<TranslatorListPage> {
  List<TranslatorDetailsModel> translatorList = [];

  /// Store instance to use further
  Store<AppState> store;

  SignInState signInState;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    signInState = store.state.signInState;
    translatorList = Data.translatorList.where((e) => e.language == widget.language).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text(
            '${FormBuilderLocalizations.of(context).searchForText} ${widget.language} ${FormBuilderLocalizations.of(context).translatorsText}'),
        backgroundColor: Palette.AppThemeColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utils.screenWidth * 0.05, vertical: Utils.screenHeight * 0.02),
        child: translatorListWidget(),
      ),
    );
  }

  /// Widget function which gives the ui for the translator list
  Widget translatorListWidget() {
    return ListView.builder(
      itemCount: translatorList.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return singleItemWidget(translatorList[index]);
      },
    );
  }

  /// Widget function which gives the ui for the single item for the translator list
  Widget singleItemWidget(TranslatorDetailsModel translatorDetailsModel) {
    return FormBuilderCard(
      marginRight: 0,
      marginLeft: 0,
      child: Row(
        children: [
          FormBuilderImage(
            width: Utils.screenWidth * 0.2,
            height: Utils.screenWidth * 0.2,
            rounded: true,
            imageUrl: '',
            imageBytes: getUserImage(translatorDetailsModel.translatorImage),
            placeHolderPath: Constants.userPlaceholder,
            localImagePath: null,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderText(message: translatorDetailsModel.translatorName),
                const SizedBox(height: 8.0),
                FormBuilderText(message: translatorDetailsModel.description),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          _actionButtons(translatorDetailsModel),
        ],
      ),
    );
  }

  /// Widget function which gives the action button message and call for the single item of the translator list.
  Widget _actionButtons(TranslatorDetailsModel translatorDetailsModel) {
    return Column(
      children: [
        BaseButtonWidget(
          minWidth: Utils.screenWidth * 0.2,
          height: 35,
          padding: 0,
          borderRadius: 8,
          btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).messageText,
              textStyle: Styles.customTextStyle(textColor: Colors.white)),
          onPressed: () {
            var list = [signInState.completeProfileResponseModel.data.userId, translatorDetailsModel.translatorId];
            list.sort();
            ChatUtils.chatBridgePlatform.invokeMethod(Constants.newConversation, {
              Constants.roomName: list.join("_"),
              Constants.fromUser: signInState.completeProfileResponseModel.data.userId,
              Constants.toUser: translatorDetailsModel.translatorId,
            });
            Navigator.of(context).pushNamed(RoutesConstants.userChatRoomPage, arguments: {
              RoutesConstantsArguments.userChatName : translatorDetailsModel.translatorName
            });
          },
        ),
        BaseButtonWidget(
          minWidth: Utils.screenWidth * 0.2,
          height: 35,
          padding: 0,
          borderRadius: 8,
          btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).callText,
              textStyle: Styles.customTextStyle(textColor: Colors.white)),
          onPressed: () => makeVoiceCall(translatorDetailsModel),
        ),
      ],
    );
  }

  /// Function which takes in the [String] imageData and provides the [Uint8List] image bytes if the
  /// condition matches.
  Uint8List getUserImage(String imageData) {
    return Base64Decoder().convert(imageData);
  }

  /// Function which is used to make a voice call.
  void makeVoiceCall(TranslatorDetailsModel translatorDetailsModel) async {
    bool permissionStatus = await Utils.checkPermissionAndRequest(Permission.microphone);
    String accessToken = Utils.getStringFromPrefs(Constants.accessToken);
    if (permissionStatus && accessToken?.isNotEmpty == true) {
      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => VoiceCallScreen()));
      TwilioVoice.instance.call.place(
        to: translatorDetailsModel.translatorId,
        from: _getFromName(signInState),
      );
    }
  }

  String _getFromName(SignInState signInState, {bool isName: false}) {
    List<String> tempAd = [];
    List<String> list = [
      signInState?.completeProfileResponseModel?.data?.firstName,
      signInState?.completeProfileResponseModel?.data?.lastName
    ];
    for (int i = 0; i < list.length; i++) {
      if (list[i] != null && list[i].isNotEmpty) {
        tempAd.add(list[i]);
      }
    }

    if (isName) {
      return tempAd.join(' ');
    }
    return tempAd.join('_');
  }
}
