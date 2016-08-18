//
//  File.swift
//  SwiftingNotification
//
//  Created by woroninb on 15/08/16.
//  Copyright © 2016 roche. All rights reserved.
//

import Foundation
import UserNotifications

final class NotificationContent: UNMutableNotificationContent {
    init(title: String, subTitle: String, body: String) {
        super.init()
        self.title = title
        self.subtitle = subTitle
        self.body = body
        self.sound = UNNotificationSound.default()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
