package com.khontext

import com.twilio.conversations.Message

data class UserChat(
        var message: String?,
        var messageType: Message.Type?,
        var dateCreated: String?,
        var dateUpdated: String?,
        var senderId: String?,
        var sid: String?,
        var conversationSid: String?,
)
