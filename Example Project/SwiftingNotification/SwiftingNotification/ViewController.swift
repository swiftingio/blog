//
//  ViewController.swift
//  SwiftingNotification
//
//  Created by woroninb on 24/07/16.
//  Copyright © 2016 roche. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

final class ViewController: UIViewController {
    
    private var localNotButton: UIButton!
    private var localActionNotButton: UIButton!
    private var localAttachementNotButton: UIButton!
    private var localCustomContentNotButton: UIButton!
    private var localDelayedNotButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localNotButton = NotificationButton(title: "Show rich notification", action: showSimpleLocalNototification)
        localActionNotButton = NotificationButton(title: "Show actionable notification", action: showCustomActionsLocalNototification)
        localAttachementNotButton = NotificationButton(title: "Show media notification", action: showMediaAttachememnt)
        localCustomContentNotButton = NotificationButton(title: "Show custom content notification", action: showCustomContentNotification)
        localDelayedNotButton = NotificationButton(title: "Show delayed notification", action: showDelayedNotification)
        
        view.addSubview(localNotButton)
        view.addSubview(localActionNotButton)
        view.addSubview(localAttachementNotButton)
        view.addSubview(localCustomContentNotButton)
        view.addSubview(localDelayedNotButton)
        
        setUpConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setUpConstraints() {
        
        let views = ["localNotButton": localNotButton!,
                     "localActionNotButton": localActionNotButton!,
                     "localAttachementNotButton": localAttachementNotButton!,
                     "localCustomContentNotButton": localCustomContentNotButton!,
                     "localDelayedNotButton": localDelayedNotButton!]
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[localNotButton]-|",
                options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[localActionNotButton]-|",
                options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[localAttachementNotButton]-|",
                options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[localCustomContentNotButton]-|",
                options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[localDelayedNotButton]-|",
                options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-50-[localNotButton]-10-[localActionNotButton]-10-[localAttachementNotButton]-10-[localCustomContentNotButton]-10-[localDelayedNotButton]-(>=10)-|",
                options: [.alignAllCenterX], metrics: nil, views: views))
        
    }
    
    func showSimpleLocalNototification() {
        let content = NotificationContent(title: "SwiftingNotifications", subTitle: "Swifting.io presents", body: "Rich notifications")
        let request = UNNotificationRequest(identifier: Consts.requestIdentifier, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
        UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
    
    func showCustomActionsLocalNototification() {
        let content = NotificationContent(title: "SwiftingNotifications", subTitle: "Swifting.io presents", body: "Actionable notifications")
        content.categoryIdentifier = Consts.categoryIdentifier
        let request = UNNotificationRequest(identifier: Consts.requestIdentifier, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
    
    func showMediaAttachememnt() {
        
        let content = NotificationContent(title: "SwiftingNotifications", subTitle: "Swifting.io presents", body: "Media notifications")
        
        guard let url = Helpers.saveImage(name: "skrzypce.jpg") else {
            return
        }
        
        let attachment = try? UNNotificationAttachment(identifier: Consts.imageIdentifier,
                                                       url: url,
                                                       options: [:])
        
        if let attachment = attachment {
            content.attachments.append(attachment)
        }
        
        let request = UNNotificationRequest(identifier: Consts.requestIdentifier, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
    
    func showCustomContentNotification() {

        let content = NotificationContent(title: "SwiftingNotifications", subTitle: "Swifting.io presents", body: "Custom notifications")
        
        content.categoryIdentifier = Consts.customContentIdentifier
        
        let request = UNNotificationRequest(identifier: Consts.requestIdentifier, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
    
    func showDelayedNotification() {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let content = NotificationContent(title: "SwiftingNotifications", subTitle: "Swifting.io presents", body: "Delayed notifications")
        let request = UNNotificationRequest(identifier: Consts.requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
}

extension UIViewController: UNUserNotificationCenterDelegate {
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void) {
        completionHandler( [.alert, .badge, .sound])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        print("Tapped in notification")
    }
}
