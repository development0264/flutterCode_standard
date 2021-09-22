import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/signin/sign_in_state.dart';
import 'package:khontext/redux/states/userchat/user_chat_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/userchats/chat_list_model.dart';
import 'package:khontext/src/screens/userchat/message_bubble.dart';
import 'package:khontext/utils/chat_utils.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class UserChatRoomPage extends StatefulWidget {
  final String userName;
  final String conversationId;

  const UserChatRoomPage({Key key, @required this.userName, this.conversationId}) : super(key: key);

  @override
  _UserChatRoomPageState createState() => _UserChatRoomPageState();
}

class _UserChatRoomPageState extends State<UserChatRoomPage> {
  /// List which holds the current message list of the particular chat room.
  List<SingleMessageData> userChatList;

  /// Message controller to get the current messages types by the user
  TextEditingController messageController = TextEditingController();

  /// Sign in state to get the current user logged in
  SignInState userSignInState;

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    userChatList = [];
    store = StoreProvider.of<AppState>(context, listen: false);
    userSignInState = store.state.signInState;
    if (widget.conversationId?.isNotEmpty == true) {
      ChatUtils.chatBridgePlatform
          .invokeMethod(Constants.joinConversation, {Constants.conversationSid: widget.conversationId});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      backgroundColor: Palette.HeaderBgColor,
      body: StoreConnector<AppState, UserChatRoomViewModel>(
        converter: (store) => UserChatRoomViewModel(store.state.userChatState),
        builder: (context, vm) {
          return Column(
            children: [
              Expanded(child: _chatRoomPageLayout(vm)),
              _typeLayout(),
            ],
          );
        },
      ),
    );
  }

  /// Function widget which gives the app bar widget for the chats page.
  AppBar _appBarWidget() {
    return AppBar(title: FormBuilderText(message: widget.userName));
  }

  /// Chat room layout which gives the base UI for the chat
  Widget _chatRoomPageLayout(UserChatRoomViewModel vm) {
    if (vm?.userChatState?.isLoading == true) {
      return BaseLoadingWidget();
    } else if (vm?.userChatState?.chatListModel?.messageListData?.isEmpty == true) {
      return Container(
        child: Center(
          child: FormBuilderText(
            message: FormBuilderLocalizations.of(context).startNewConversationText,
            textStyle: Styles.customTextStyle(textSize: 18.0),
          ),
        ),
      );
    }

    userChatList = vm?.userChatState?.chatListModel?.messageListData;

    return _messagesView(vm);
  }

  /// Gives the UI for the chat list, will be executed only if there is a chat.
  Widget _messagesView(UserChatRoomViewModel vm) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return false;
      },
      child: ListView.builder(
        reverse: true,
        padding: EdgeInsets.zero,
        itemCount: userChatList.length,
        itemBuilder: (context, index) {
          return _singleMessageView(userChatList[index]);
        },
      ),
    );
  }

  Widget _singleMessageView(SingleMessageData model) {
    Message message = Message(
      owner: model.senderId == userSignInState.completeProfileResponseModel.data.userId
          ? MessageOwner.other
          : MessageOwner.myself,
      text: model.message,
    );
    return MessageBubble(
      message: message,
      child: FormBuilderText(
        message: message.text,
        textStyle: Styles.customTextStyle(textSize: 16),
      ),
    );
  }

  Widget _typeLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Palette.AppThemeColor, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black54),
                  hintText: FormBuilderLocalizations.of(context).writeMessageText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          SizedBox(
            height: 50,
            width: 50,
            child: FloatingActionButton(
              onPressed: () {
                ChatUtils.chatBridgePlatform
                    .invokeMethod(Constants.singleMessage, {Constants.message: messageController.text});
                setState(() {
                  messageController.clear();
                });
              },
              child: Icon(Icons.send, color: Colors.white, size: 16),
              backgroundColor: Colors.blue,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class UserChatRoomViewModel {
  final UserChatState userChatState;

  UserChatRoomViewModel(this.userChatState);
}
