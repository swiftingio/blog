//
//  IntentViewController.swift
//  SiriIntentUI
//
//  Created by Michal Wojtysiak on 06/07/16.
//  Copyright © 2016 Michal Wojtysiak. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INStartWorkoutIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Start my workout using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - INUIHostedViewControlling
    //NOTE: Add IntentUI to embedded binaries in main app.
    
    // Prepare your view controller for the interaction to handle.
    func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        print(interaction.intent.identifier ?? "")
        if let sendMessageIntent =  interaction.intent as? INSendMessageIntent{
            textfield.text = sendMessageIntent.content
            label.text = sendMessageIntent.recipients?.first?.displayName
            statusLabel.text = "\(interaction.intentHandlingStatus.rawValue)"
        }else{
            textfield.text = "not sending"
                label.text = "not sending"
        }
        
        
        if let completion = completion {
            var size = self.desiredSize
            size.height = 100.0
            completion(size)
        }
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
