import UIKit
import Flutter
import Stripe
import TwilioConversationsClient

private var paymentChannel = "com.khontext.app/payment_token"
private var chatChannel = "com.khontext.app/chat_bridge"
private var chatMethodChannel: FlutterMethodChannel? = nil
private var paymentMethodChannel: FlutterMethodChannel? = nil
private var PAYMENT_LOG : String = "PAYMENT_LOG :-> "
private var stripe: StripeAPI? = nil
private var paymentToken : String = "PAYMENT_TOKEN"
private var conversationsManager = ConversationsManager()

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, ConversationsManagerDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        initiatePayment()
        conversationsManager.delegate = self
        let chatController : FlutterViewController = window?.rootViewController as! FlutterViewController
        let paymentController : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        chatMethodChannel = FlutterMethodChannel(name: chatChannel, binaryMessenger: chatController.binaryMessenger)
        paymentMethodChannel = FlutterMethodChannel(name: paymentChannel,binaryMessenger: paymentController.binaryMessenger)
        
        paymentsChannel()
        conversationsChannel()
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    /// Function which initiates payment
    private func initiatePayment(){
        StripeAPI.defaultPublishableKey = ProcessInfo.processInfo.environment[paymentToken]
    }
    
    /// Function which maintains the payments channel.
    private func paymentsChannel(){
        paymentMethodChannel?.setMethodCallHandler(	{
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            NSLog(PAYMENT_LOG + "Current Payment method :-> \(call.method)")
            switch (call.method){
            case "InitiatePaymentCard":
                let args = call.arguments as! Dictionary<String, Any>
                let cardParams = STPCardParams()
                cardParams.number = args["CardNumber"] as? String
                cardParams.expMonth = args["CardExpiryMonth"] as? UInt ?? 0
                cardParams.expYear = args["CardExpiryYear"] as? UInt ?? 0
                cardParams.cvc = args["CardCVC"] as? String
                cardParams.name = args["CardHolder"] as? String
                cardParams.currency = "usd"
                NSLog(PAYMENT_LOG + "Initiate payment by card is called :-> \(cardParams)")
                self.getTokenForCard(stpCardParams : cardParams, result : result)
                break
            case "InitiatePaymentBank":
                //                let args = call.arguments as! Dictionary<String, Any>
                //                let bankAccParams = STPBankAccount()
                //                cardParams.number = args["CardNumber"] as? String
                //                cardParams.expMonth = args["CardExpiryMonth"] as? UInt ?? 0
                //                cardParams.expYear = args["CardExpiryYear"] as? UInt ?? 0
                //                cardParams.cvc = args["CardCVC"] as? String
                //                cardParams.name = args["CardHolder"] as? String
                //                NSLog(PAYMENT_LOG + "Initiate payment by card is called :-> \(cardParams)")
                //                self.getTokenForBankAccount(stpBankAccount: <#T##STPBankAccount#>, result: result)
                break
            default:
                NSLog(PAYMENT_LOG + "The default payment method is call.")
            }
        })
    }
    
    /// Function to get token on the base of the card
    private func getTokenForCard(stpCardParams : STPCardParams, result: @escaping FlutterResult){
        STPAPIClient.shared.createToken(withCard: stpCardParams) { (token : STPToken?, error : Error?) in
            if let error = error {
                print(error)
            }else{
                result(token?.tokenId)
            }
        }
    }
    
    /// Function to get token on the base of the bank account
    private func getTokenForBankAccount(stpBankAccount : STPBankAccountParams, result: @escaping FlutterResult){
        STPAPIClient.shared.createToken(withBankAccount: stpBankAccount) { (token : STPToken?, error : Error?) in
            if let error = error {
                print(error)
            }else{
                result(token?.tokenId)
            }
        }
    }
    
    /// Function which maintains the conversation channel.
    private func conversationsChannel(){
        chatMethodChannel?.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            NSLog(PAYMENT_LOG + "Current Chat method :-> \(call.method)")
            let args = call.arguments as! Dictionary<String, Any>
            switch(call.method){
            case "InitiateChat":
                conversationsManager.loginWithAccessToken((args["AccessToken"] as? String)!)
                break;
            case "NewConversation":
                conversationsManager.newUserConversation(conversationName: (args["RoomName"] as? String)!,
                                                         fromUser: (args["FromUser"] as? String)!,
                                                         toUser: (args["ToUser"] as? String)!)
                break;
            case "SingleMessage":
                conversationsManager.sendMessage((args["Message"] as? String)!)
                break;
            case "JoinConversation":
                conversationsManager.changeConversation(conversationId: (args["ConversationSid"] as? String)!)
                break;
            default:
                break;
            }
        })
    }
    
    func receivedNewMessage(message : TCHMessage){
        print("Message received ---> \(message)")
        var arguments = Dictionary<String, Any>()
        
        let json : UserChat = UserChat(
            message: message.body!,
            messageType: message.messageType == TCHMessageType.text ? "text" : "media",
            dateCreated: message.dateCreated!,
            dateUpdated: message.dateUpdated!,
            senderID: message.participant?.identity! ?? "",
            sid: message.sid!,
            conversationSid: ""
        )
        
        let dataJson = try! JSONEncoder().encode(json)
        let dataString = String(data: dataJson, encoding: .utf8)!
        
        arguments["\"SingleMessageData\""] = dataString
        chatMethodChannel?.invokeMethod("SingleMessage", arguments: arguments)
    }
    
    func reloadMessages(messageList : [TCHMessage], currentConversation : TCHConversation){
        var dataList = [UserChat]()
        for message : TCHMessage in messageList {
            let json : UserChat = UserChat(
                message: message.body!,
                messageType: message.messageType == TCHMessageType.text ? "text" : "media",
                dateCreated: message.dateCreated!,
                dateUpdated: message.dateUpdated!,
                senderID: message.participant?.identity! ?? "",
                sid: message.sid!,
                conversationSid: currentConversation.sid!
            )
            dataList.append(json)
        }
        
        let dataListJson = try! JSONEncoder().encode(dataList)
        let dataListString = String(data: dataListJson, encoding: .utf8)!

        let conversationIdJson = try! JSONEncoder().encode(currentConversation.sid)
        let conversationIdString = String(data: conversationIdJson, encoding: .utf8)!
        
        var arguments = Dictionary<String, Any>()
        arguments["\"MessageListData\""] = dataListString
        arguments["\"ConversationSid\""] = conversationIdString
        chatMethodChannel?.invokeMethod("MessagesList", arguments: arguments)
    }
    
    func conversationManagerUp() {
        var arguments = Dictionary<String, Any>()
        arguments["IsSuccess"] = false
        chatMethodChannel?.invokeMethod("InitiateSuccess", arguments: arguments)
    }
    
    func newConversationCreated(newConversation: TCHConversation, fromUser: String, toUser: String) {
        var arguments = Dictionary<String, Any>()
        arguments["ConversationSid"] = newConversation.sid
        arguments["FromUser"] = fromUser
        arguments["ToUser"] = toUser
        chatMethodChannel?.invokeMethod("NewConversation",arguments: arguments)
    }
    
    func messageSentCallback() {
        print("Message sent successfully.")
    }
}

struct UserChat : Encodable{
    let message, messageType, dateCreated, dateUpdated: String
    let senderID, sid, conversationSid: String
    
    enum CodingKeys: String, CodingKey {
        case message, messageType, dateCreated, dateUpdated
        case senderID = "senderId"
        case sid, conversationSid
    }
}
