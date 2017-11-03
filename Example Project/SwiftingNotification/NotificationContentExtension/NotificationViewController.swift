//
//  NotificationViewController.swift
//  NotificationContentExtension
//
//  Created by woroninb on 25/07/16.
//  Copyright © 2016 roche. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = Bundle.main.path(forResource: "matrix", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)!
        webView.load(gif as Data, mimeType: "image/gif", textEncodingName: String(), baseURL: URL(string: filePath!)!)
        webView.isUserInteractionEnabled = false;
    }
    
    func didReceive(_ notification: UNNotification) {
        
    }
}
