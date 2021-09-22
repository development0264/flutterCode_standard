package com.khontext

import android.content.Context
import android.util.Log
import com.twilio.conversations.*
import com.twilio.conversations.ConversationsClient.ConnectionState
import java.util.*

internal interface ConversationsManagerListener {
    fun receivedNewMessage(message: Message)
    fun messageSentCallback()
    fun reloadMessages(result: List<Message>, currentConversation: Conversation)
    fun userConversations(myConversations: List<Conversation>)
    fun conversationManagerUp()
    fun newConversationCreated(newConversation: Conversation, fromUser: String, toUser: String)
}

internal class ConversationsManager {
    val messages = ArrayList<Message>()
    private var conversationsClient: ConversationsClient? = null
    private var conversation: Conversation? = null
    private var conversationsManagerListener: ConversationsManagerListener? = null

    fun initializeWithAccessToken(context: Context?, token: String?) {
        val props = ConversationsClient.Properties.newBuilder().createProperties()
        ConversationsClient.create(context!!, token!!, props, mConversationsClientCallback)
    }

    fun sendMessage(messageBody: String?) {
        if (conversation != null) {
            val options = Message.options().withBody(messageBody)
            Log.e(MainActivity.TAG, "Message created")
            conversation!!.sendMessage(options) {
                if (conversationsManagerListener != null) {
                    conversationsManagerListener!!.messageSentCallback()
                }
            }
        }
    }

    fun newUserConversation(conversationName: String, fromUser: String, toUser: String) {
        if (conversationsClient == null || conversationsClient!!.myConversations == null) {
            return
        }

        conversationsClient!!.getConversation(conversationName, object : CallbackListener<Conversation?> {
            override fun onSuccess(conversation: Conversation?) {
                if (conversation != null) {
                    if (conversation.status == Conversation.ConversationStatus.JOINED
                            || conversation.status == Conversation.ConversationStatus.NOT_PARTICIPATING) {
                        Log.e(MainActivity.TAG, "Already Exists in Conversation: $conversationName")
                        this@ConversationsManager.conversation = conversation
                        this@ConversationsManager.conversation!!.addListener(mDefaultConversationListener)
                        loadPreviousMessages(conversation)
                    } else {
                        Log.e(MainActivity.TAG, "Joining Conversation: $conversationName")
                        joinConversation(conversation)
                    }
                }
            }

            override fun onError(errorInfo: ErrorInfo) {
                Log.e(MainActivity.TAG, "Error retrieving conversation: " + errorInfo.message)
                createConversation(conversationName, fromUser, toUser)
            }
        })
    }

    private fun createConversation(conversationName: String, fromUser: String, toUser: String) {
        Log.e(MainActivity.TAG, "Creating Conversation: $conversationName")
        if(this@ConversationsManager.conversation!=null){
            this@ConversationsManager.conversation?.removeAllListeners()
        }
        conversationsClient!!.createConversation(conversationName,
                object : CallbackListener<Conversation?> {
                    override fun onSuccess(conversation: Conversation?) {
                        if (conversation != null) {
                            Log.e(MainActivity.TAG, "Joining Conversation: $conversationName ${conversation.sid}")
                            conversation.addParticipantByIdentity(toUser, Attributes(), object : StatusListener {
                                override fun onSuccess() {
                                    conversation.setUniqueName(conversationName, object : StatusListener {
                                        override fun onSuccess() {
                                            conversationsManagerListener!!.newConversationCreated(conversation, fromUser, toUser)
                                            joinConversation(conversation)
                                        }

                                        override fun onError(errorInfo: ErrorInfo?) {
                                            super.onError(errorInfo)
                                            Log.e(MainActivity.TAG, "Error setting unique name of Conversation: ${errorInfo?.message}")
                                        }
                                    })
                                }

                                override fun onError(errorInfo: ErrorInfo?) {
                                    super.onError(errorInfo)
                                    Log.e(MainActivity.TAG, "Add Participant error --> ${errorInfo?.message} ----- ${errorInfo?.code}")
                                }
                            })
                        }
                    }

                    override fun onError(errorInfo: ErrorInfo) {
                        Log.e(MainActivity.TAG, "Error creating conversation: " + errorInfo.message)
                    }
                })
    }

     fun changeConversation(conversationId: String) {
         if(this@ConversationsManager.conversation!=null){
             this@ConversationsManager.conversation?.removeAllListeners()
         }

        conversationsClient!!.getConversation(conversationId, object : CallbackListener<Conversation> {
            override fun onSuccess(conversation: Conversation?) {
                if (conversation != null) {
                    if (conversation.status == Conversation.ConversationStatus.JOINED
                            || conversation.status == Conversation.ConversationStatus.NOT_PARTICIPATING) {
                        Log.e(MainActivity.TAG, "Change conversation ---> ${conversation.friendlyName}")
                        this@ConversationsManager.conversation = conversation
                        this@ConversationsManager.conversation!!.addListener(mDefaultConversationListener)
                        loadPreviousMessages(conversation)
                    } else {
                        Log.e(MainActivity.TAG, "Joining new Conversation: ${conversation.friendlyName}")
                        joinConversation(conversation)
                    }
                }
            }

            override fun onError(errorInfo: ErrorInfo?) {
                super.onError(errorInfo)

            }
        })
    }

    private fun joinConversation(conversation: Conversation) {
        Log.e(MainActivity.TAG, "Joining Conversation: " + conversation.uniqueName)
        if (conversation.status == Conversation.ConversationStatus.JOINED) {
            this@ConversationsManager.conversation = conversation
            Log.e(MainActivity.TAG, "Already joined default conversation")
            this@ConversationsManager.conversation!!.addListener(mDefaultConversationListener)
            return
        }

        conversation.join(object : StatusListener {
            override fun onSuccess() {
                this@ConversationsManager.conversation = conversation
                Log.e(MainActivity.TAG, "Joined default conversation")
                this@ConversationsManager.conversation!!.addListener(mDefaultConversationListener)
                loadPreviousMessages(conversation)
            }

            override fun onError(errorInfo: ErrorInfo) {
                Log.e(MainActivity.TAG, "Error joining conversation: " + errorInfo.message)
            }
        })
    }

    private fun loadPreviousMessages(conversation: Conversation) {
        conversation.getLastMessages(100, object : CallbackListener<List<Message>> {
            override fun onSuccess(result: List<Message>) {
//                messages.addAll(result!!)
                Log.e(MainActivity.TAG, "Message fetch successful : " + result.size)
                if (conversationsManagerListener != null) {
                    conversationsManagerListener!!.reloadMessages(result, conversation)
                }
            }

            override fun onError(errorInfo: ErrorInfo?) {
                super.onError(errorInfo)
                Log.e(MainActivity.TAG, "Error loading messaged -> " + errorInfo?.message)
            }
        })
    }

    fun loadMoreMessages(indexNumber : Long){
        conversation!!.getMessagesAfter(indexNumber, 10, object : CallbackListener<List<Message>>{
            override fun onSuccess(result: List<Message>?) {
                messages.addAll(result!!)
                Log.e(MainActivity.TAG, "Message fetch successful : " + result.size)
                if (conversationsManagerListener != null) {
                    conversationsManagerListener!!.reloadMessages(messages, conversation!!)
                }
            }

            override fun onError(errorInfo: ErrorInfo?) {
                super.onError(errorInfo)
                Log.e(MainActivity.TAG, "Error loading new messages -> " + errorInfo?.message)
            }
        })
    }

    private val mConversationsClientListener: ConversationsClientListener = object : ConversationsClientListener {
        override fun onConversationAdded(conversation: Conversation) {}
        override fun onConversationUpdated(conversation: Conversation, updateReason: Conversation.UpdateReason) {}
        override fun onConversationDeleted(conversation: Conversation) {}
        override fun onConversationSynchronizationChange(conversation: Conversation) {}
        override fun onError(errorInfo: ErrorInfo) {}
        override fun onUserUpdated(user: User, updateReason: User.UpdateReason) {}
        override fun onUserSubscribed(user: User) {}
        override fun onUserUnsubscribed(user: User) {}
        override fun onClientSynchronization(synchronizationStatus: ConversationsClient.SynchronizationStatus) {
            if (synchronizationStatus == ConversationsClient.SynchronizationStatus.COMPLETED) {
                conversationsManagerListener!!.conversationManagerUp()
            }
        }

        override fun onNewMessageNotification(s: String, s1: String, l: Long) {}
        override fun onAddedToConversationNotification(s: String) {}
        override fun onRemovedFromConversationNotification(s: String) {}
        override fun onNotificationSubscribed() {}
        override fun onNotificationFailed(errorInfo: ErrorInfo) {}
        override fun onConnectionStateChange(connectionState: ConnectionState) {}
        override fun onTokenExpired() {}
        override fun onTokenAboutToExpire() {}
    }
    private val mConversationsClientCallback: CallbackListener<ConversationsClient> = object : CallbackListener<ConversationsClient> {
        override fun onSuccess(conversationsClient: ConversationsClient) {
            this@ConversationsManager.conversationsClient = conversationsClient
            conversationsClient.addListener(mConversationsClientListener)
            Log.e(MainActivity.TAG, "Success creating Twilio Conversations Client")
        }

        override fun onError(errorInfo: ErrorInfo) {
            Log.e(MainActivity.TAG, "Error creating Twilio Conversations Client: " + errorInfo.message)
        }
    }

    private val mDefaultConversationListener: ConversationListener = object : ConversationListener {
        override fun onMessageAdded(message: Message) {
            Log.e(MainActivity.TAG, "Message added")
            messages.add(message)
            if (conversationsManagerListener != null) {
                conversationsManagerListener!!.receivedNewMessage(message)
            }
        }

        override fun onMessageUpdated(message: Message, updateReason: Message.UpdateReason) {
            Log.e(MainActivity.TAG, "Message updated: " + message.messageBody)
        }

        override fun onMessageDeleted(message: Message) {
            Log.e(MainActivity.TAG, "Message deleted")
        }

        override fun onParticipantAdded(participant: Participant) {
            Log.e(MainActivity.TAG, "Participant added: " + participant.identity)
        }

        override fun onParticipantUpdated(participant: Participant, updateReason: Participant.UpdateReason) {
            Log.e(MainActivity.TAG, "Participant updated: " + participant.identity + " " + updateReason.toString())
        }

        override fun onParticipantDeleted(participant: Participant) {
            Log.e(MainActivity.TAG, "Participant deleted: " + participant.identity)
        }

        override fun onTypingStarted(conversation: Conversation, participant: Participant) {
            Log.e(MainActivity.TAG, "Started Typing: " + participant.identity)
        }

        override fun onTypingEnded(conversation: Conversation, participant: Participant) {
            Log.e(MainActivity.TAG, "Ended Typing: " + participant.identity)
        }

        override fun onSynchronizationChanged(conversation: Conversation) {}
    }

    fun setListener(listener: ConversationsManagerListener?) {
        conversationsManagerListener = listener
    }
}