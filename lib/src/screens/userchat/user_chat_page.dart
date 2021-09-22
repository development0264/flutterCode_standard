import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/userchat/user_conversations_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/signin/sign_in_state.dart';
import 'package:khontext/redux/states/userchat/user_conversations_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_image.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/models/userchats/user_conversations_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class UserChatPage extends StatefulWidget {
  @override
  _UserChatPageState createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  List<ConversationDataModel> userList = [];

  /// Store instance to use further
  Store<AppState> store;

  SignInState signInState;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    signInState = store.state.signInState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      backgroundColor: Palette.HeaderBgColor,
      body: StoreConnector<AppState, UserChatViewModel>(
        converter: (store) => UserChatViewModel(store.state.userConversationState),
        onInit: (store) =>
            store.dispatch(GetUserConversationsAction(userId: signInState.completeProfileResponseModel.data.userId)),
        builder: (context, vm) {
          userList = vm.userChatState.userConversationsResponseModel.data.userConversations;
          return Stack(
            children: [
              _chatPageLayout(),
              if (vm.userChatState.isLoading) ...[
                BaseLoadingWidget(),
              ],
            ],
          );
        },
      ),
    );
  }

  /// Function widget which gives the app bar widget for the chats page.
  AppBar _appBarWidget() {
    return AppBar(
      title: FormBuilderText(message: "Chats"),
    );
  }

  /// Function widget which gives the chat page layout.
  Widget _chatPageLayout() {
    return Container(
      padding: EdgeInsets.only(top: Utils.screenHeight * 0.03),
      child: userList.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return _singleChatItem(userList[index]);
              },
            )
          : Center(
              child: FormBuilderText(
                message: "No conversations yet.",
              ),
            ),
    );
  }

  /// Function widget which gives the single chat item.
  Widget _singleChatItem(ConversationDataModel userModel) {
    return FormBuilderCard(
      shadowColor: Palette.TextColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FormBuilderImage(
            width: Utils.screenWidth * 0.1,
            height: Utils.screenWidth * 0.1,
            rounded: true,
            imageUrl: 'https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg',
            // imageBytes: getUserImage(vm),
            placeHolderPath: Constants.userPlaceholder,
          ),
          const SizedBox(width: 12.0),
          FormBuilderText(
            message: _getName(userModel.toUser),
            textStyle: Styles.customTextStyle(textSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      onCardTap: () => onUserTapped(userModel),
    );
  }

  /// Function which opens the chat room for the particular user clicked
  void onUserTapped(ConversationDataModel userModel) {
    Navigator.of(context).pushNamed(RoutesConstants.userChatRoomPage, arguments: {
      RoutesConstantsArguments.userChatName : _getName(userModel.toUser),
    RoutesConstantsArguments.userConversationId : userModel.conversationSid,
    });
  }

  String _getName(UserDataModel model) {
    List<String> tempAd = [];
    List<String> list = [model.firstName, model.lastName];
    for (int i = 0; i < list.length; i++) {
      if (list[i] != null && list[i].isNotEmpty) {
        tempAd.add(list[i]);
      }
    }

    return tempAd.join(' ');
  }
}

class UserChatViewModel {
  final UserConversationState userChatState;

  UserChatViewModel(this.userChatState);
}
