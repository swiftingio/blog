import Intents

struct SupportMe{
    static let systems = [INPerson(personHandle: INPersonHandle(value: "MyNotes", type: INPersonHandleType.unknown), nameComponents: nil, displayName: "MyNotes", image: nil, contactIdentifier: "MyNotes", customIdentifier: "MyNotes")]
    
    static let articles = [INMessage(identifier: "MyNotesPassword", content: "Retrieving password in MyNotes app. To retrieve password use 'forgot password' button that is located below sign in button. Then type email address that your account has been assigned to and press reset password", dateSent: Date(), sender: SupportMe.systems[0], recipients: [SupportMe.systems[0]])]
}

class IntentHandler: INExtension{
}

extension IntentHandler: INSearchForMessagesIntentHandling{
    func handle(searchForMessages intent: INSearchForMessagesIntent, completion: (INSearchForMessagesIntentResponse) -> Void){
        let userActivity = NSUserActivity(activityType: String(INSearchForMessagesIntent.self))
        let response = INSearchForMessagesIntentResponse(code: .success, userActivity: userActivity)
        response.messages = [SupportMe.articles[0]]
        completion(response)
    }
}

extension IntentHandler: INSendMessageIntentHandling{
    //MARK: - INSendMessageIntentHandling
    func handle(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Swift.Void){
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INSendMessageIntent.self))
        let response = INSendMessageIntentResponse(code: .success, userActivity: userActivity)
        completion(response)
    }
    
    func confirm(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Swift.Void){
        completion(INSendMessageIntentResponse.init(code: INSendMessageIntentResponseCode.success, userActivity: nil))
    }
}
