package com.khontext

data class UserConversation(
        var sid : String?,
        var uniqueName : String?,
        var friendlyName : String?,
        var createdBy : String?,
        var dateCreated : String?,
        var dateUpdated : String?,
        var lastMessage : String?,
        var lastMessageSender : String?,
)
