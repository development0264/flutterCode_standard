package com.khontext

import android.util.Log
import com.google.gson.Gson
import com.stripe.android.ApiResultCallback
import com.stripe.android.Stripe
import com.stripe.android.model.BankAccountTokenParams
import com.stripe.android.model.CardParams
import com.stripe.android.model.Token
import com.twilio.conversations.Conversation
import com.twilio.conversations.Message
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.*
import kotlin.collections.ArrayList
import kotlin.collections.set


class MainActivity : FlutterActivity() {
    private val chatChannel = "com.khontext.app/chat_bridge"
    private val paymentChannel = "com.khontext.app/payment_token"
    private val conversationsManager = ConversationsManager()
    private lateinit var chatMethodChannel: MethodChannel
    private lateinit var paymentMethodChannel: MethodChannel
    private lateinit var stripe: Stripe

    companion object {
        @JvmField
        var TAG: String = "TwilioConversations"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        initiatePayment()
        conversationsManager.setListener(conversationsManagerListener)
        chatMethodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, chatChannel)
        paymentMethodChannel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, paymentChannel)
        paymentsChannel()
        conversationsChannel()
    }

    /// Function which initiates payment
    private fun initiatePayment() {
        Log.e(TAG, "The payment token --> ${BuildConfig.PAYMENT_TOKEN}")
        stripe = Stripe(applicationContext, BuildConfig.PAYMENT_TOKEN)
    }

    /// Function which maintains the conversations channel.
    private fun paymentsChannel() {
        paymentMethodChannel.setMethodCallHandler { call, result2 ->
            when (call.method) {
                "InitiatePaymentCard" -> {
                    Log.e(TAG, "The argument --> ${call.arguments}")
                    val cardParams = CardParams(
                        call.argument<String>("CardNumber")!!,
                        call.argument<Int>("CardExpiryMonth")!!,
                        call.argument<Int>("CardExpiryYear")!!,
                        call.argument<String>("CardCVC"),
                        call.argument<String>("CardHolder"),
                        null,
                        "usd",
                        null,
                    )
                    getTokenForCard(result2, cardParams)
                }
                "InitiatePaymentBank" -> {
                    getTokenForBank(result2, call.arguments)
                }
            }
        }
    }

    /// Function to get token on the base of the card
    private fun getTokenForCard(result: MethodChannel.Result, cardParams: CardParams) {
        stripe.createCardToken(
            cardParams,
            null,
            null,
            object : ApiResultCallback<Token> {
                override fun onError(e: Exception) {
                    Log.e(TAG, "The payment token issue --> ${e.message}")
                }

                override fun onSuccess(resultToken: Token) {
                    Log.e(TAG, "The result token is --> ${resultToken.id}")
                    result.success(resultToken.id)
                }
            })
    }

    /// Function to get token on the base of the bank
    private fun getTokenForBank(result: MethodChannel.Result, arguments: Any) {
        stripe.createBankAccountToken(
            BankAccountTokenParams("In", "INR", "15000852151200"),
            null,
            null,
            object : ApiResultCallback<Token> {
                override fun onError(e: Exception) {
                    Log.e(TAG, "The bank token issue --> ${e.message}")
                }

                override fun onSuccess(resultToken: Token) {
                    Log.e(TAG, "The bank token is --> ${resultToken.id}")
                    result.success(resultToken.id)
                }
            })
    }

    /// Function which maintains the conversations channel.
    private fun conversationsChannel() {
        chatMethodChannel.setMethodCallHandler { call, _ ->
            Log.e(TAG, "The method --> " + call.method)
            when (call.method) {
                "InitiateChat" -> {
                    Log.e(TAG, "The arguments --> " + call.arguments)
                    conversationsManager.initializeWithAccessToken(
                        this@MainActivity,
                        call.argument("AccessToken"),
                    )
                }
                "NewConversation" -> {
                    Log.e(TAG, "The new conversation arguments --> " + call.arguments)
                    conversationsManager.newUserConversation(
                        call.argument("RoomName")!!,
                        call.argument("FromUser")!!,
                        call.argument("ToUser")!!
                    )
                }
                "SingleMessage" -> {
                    conversationsManager.sendMessage(call.argument("Message"))
                }
                "JoinConversation" -> {
                    conversationsManager.changeConversation(call.argument("ConversationSid")!!)
                }
            }
        }
    }

    /// Function which maintains the chat conversations event listener.
    private var conversationsManagerListener = object : ConversationsManagerListener {
        override fun receivedNewMessage(message: Message) {
            Log.e(TAG, "New Message Received --> ${message.type}")
            val userMessage = UserChat(
                message.messageBody,
                message.type,
                message.dateCreated,
                message.dateUpdated,
                message.participant.identity,
                message.sid,
                message.conversationSid,
            )
            val arguments = HashMap<String, Any>()
            arguments["\"SingleMessageData\""] = Gson().toJson(userMessage)
            chatMethodChannel.invokeMethod("SingleMessage", arguments)
        }

        override fun messageSentCallback() {
            Log.e(TAG, "messageSentCallback")
        }

        override fun reloadMessages(result: List<Message>, currentConversation: Conversation) {
            Log.e(TAG, "The messages list --> ${result.size}")
            val dataList: ArrayList<UserChat> = ArrayList()
            for (i in result.indices) {
                dataList.add(
                    UserChat(
                        result[i].messageBody,
                        result[i].type,
                        result[i].dateCreated,
                        result[i].dateUpdated,
                        result[i].participant.identity,
                        result[i].sid,
                        result[i].conversationSid,
                    )
                )

                if (i == result.size - 1) {
                    Log.e(TAG, "The data -> ${Gson().toJson(dataList)}")
                    val arguments = HashMap<String, Any>()
                    arguments["\"MessageListData\""] = Gson().toJson(dataList)
                    arguments["\"ConversationSid\""] = Gson().toJson(currentConversation.sid)
                    chatMethodChannel.invokeMethod("MessagesList", arguments)
                }
            }
        }

        override fun userConversations(myConversations: List<Conversation>) {}

        override fun conversationManagerUp() {
            val arguments = HashMap<String, Any>()
            arguments["IsSuccess"] = false
            chatMethodChannel.invokeMethod("InitiateSuccess", arguments)
        }

        override fun newConversationCreated(
            newConversation: Conversation,
            fromUser: String,
            toUser: String
        ) {
            val arguments = HashMap<String, Any>()
            arguments["ConversationSid"] = newConversation.sid
            arguments["FromUser"] = fromUser
            arguments["ToUser"] = toUser
            chatMethodChannel.invokeMethod("NewConversation", arguments)
        }
    }
}