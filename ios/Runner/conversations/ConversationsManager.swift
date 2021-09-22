import Foundation
import TwilioConversationsClient

protocol ConversationsManagerDelegate: AnyObject {
    func receivedNewMessage(message : TCHMessage)
    func reloadMessages(messageList : [TCHMessage], currentConversation : TCHConversation)
    func conversationManagerUp()
    func newConversationCreated(newConversation: TCHConversation, fromUser: String, toUser: String)
    func messageSentCallback()
}

class ConversationsManager: NSObject, TwilioConversationsClientDelegate {
    weak var delegate: ConversationsManagerDelegate?
    private var client: TwilioConversationsClient?
    private var conversation: TCHConversation?
    private(set) var messages: [TCHMessage] = []
    
    func loginWithAccessToken(_ token: String) {
        TwilioConversationsClient.conversationsClient(withToken: token,
                                                      properties: nil, delegate: self) { (result, client) in
            self.client = client
        }
    }
    
    func sendMessage(_ messageText: String) {
        let messageOptions = TCHMessageOptions().withBody(messageText)
        conversation?.sendMessage(with: messageOptions, completion: { (result, message) in
            if(result.isSuccessful){
                self.delegate?.messageSentCallback()
            }else{
                print("Error in sending message.")
            }
        })
    }
    
    func conversationsClient(_ client: TwilioConversationsClient, synchronizationStatusUpdated status: TCHClientSynchronizationStatus) {
        if(status == TCHClientSynchronizationStatus.completed){
            delegate?.conversationManagerUp()
        }
        guard status == .completed else {
            return
        }
    }
    
    func conversationsClient(_ client: TwilioConversationsClient, conversation: TCHConversation,
                             messageAdded message: TCHMessage) {
        messages.append(message)
        
        // Changes to the delegate should occur on the UI thread
        DispatchQueue.main.async {
            if let delegate = self.delegate {
                delegate.receivedNewMessage(message: message)
            }
        }
    }
    
    private func createConversation(conversationName: String, fromUser: String, toUser: String) {
        guard let client = client else {
            return
        }
        let options: [String: Any] = [
            TCHConversationOptionUniqueName: conversationName
        ]
        
        client.createConversation(options: options) { (result, conversation) in
            if result.isSuccessful {
                print("Conversation created.")
                conversation?.addParticipant(byIdentity: toUser, attributes: nil){
                    (result) in
                    if(result.isSuccessful){
                        conversation?.setUniqueName(conversationName){
                            (uniqueNameResult) in
                            if(uniqueNameResult.isSuccessful){
                                self.delegate?.newConversationCreated(newConversation: conversation!, fromUser: fromUser, toUser: toUser)
                                self.joinConversation(conversation!)
                            }else{
                                print("Unable to set unique name --> \(uniqueNameResult.error as Optional)")
                            }
                        }
                    }else{
                        print("Add participant error ---> \(result.error as Optional)")
                    }
                }
            } else {
                print(result.error?.localizedDescription ?? "")
                print("Conversation NOT created.")
            }
        }
    }
    
    private func joinConversation(_ conversation: TCHConversation) {
        self.conversation = conversation
        if conversation.status == .joined {
            print("Current user already exists in conversation")
            self.loadPreviousMessages(conversation)
        } else {
            conversation.join(completion: { result in
                print("Result of conversation join: \(result.resultText ?? "No Result")")
                if result.isSuccessful {
                    self.loadPreviousMessages(conversation)
                }
            })
        }
    }
    
    func newUserConversation(conversationName: String, fromUser: String, toUser: String){
        guard let client = client else {
            print("Client gaurd issue. Returned.")
            return
        }
        if (client.myConversations() == nil) {
            print("Client or conversations null.")
            return
        }
        
        client.conversation(withSidOrUniqueName: conversationName) { (result, conversation) in
            if(result.isSuccessful){
                if(conversation != nil && (conversation?.status == TCHConversationStatus.joined
                                            || conversation?.status == TCHConversationStatus.notParticipating)){
                    self.conversation = conversation
                    self.loadPreviousMessages(conversation!)
                }else{
                    self.joinConversation(conversation!)
                }
            }else{
                self.createConversation(conversationName: conversationName, fromUser: fromUser, toUser: toUser)
            }
        }
    }
    
    func changeConversation(conversationId : String){
        guard let client = client else {
            print("Client gaurd issue. Returned.")
            return
        }
        
        client.conversation(withSidOrUniqueName: conversationId) { (result, conversation) in
            if(result.isSuccessful){
                if(conversation != nil && (conversation?.status == TCHConversationStatus.joined
                                            || conversation?.status == TCHConversationStatus.notParticipating)){
                    self.conversation = conversation
                    self.loadPreviousMessages(conversation!)
                }else{
                    self.joinConversation(conversation!)
                }
            }else{
                print("Change conversation error ---> \(result.error as Optional)")
            }
        }
    }
    
    private func loadPreviousMessages(_ conversation: TCHConversation) {
        conversation.getLastMessages(withCount: 100) { (result, messages) in
            if let messages = messages {
                self.messages = messages
                DispatchQueue.main.async {
                    self.delegate?.reloadMessages(messageList: messages, currentConversation: conversation)
                }
            }
        }
    }
    
    func shutdown() {
        if let client = client {
            client.delegate = nil
            client.shutdown()
            self.client = nil
        }
    }
}
