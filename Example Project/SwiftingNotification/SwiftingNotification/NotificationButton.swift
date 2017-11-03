//
//  NotificationButton.swift
//  SwiftingNotification
//
//  Created by woroninb on 15/08/16.
//  Copyright © 2016 roche. All rights reserved.
//

import UIKit

final class NotificationButton: UIButton {
    
    private var pressedAction: () -> ()
    
    init(title: String, action: @escaping () -> ()) {
        self.pressedAction = action
        super.init(frame: .zero)
        self.setTitleColor(UIColor.blue, for: .normal)
        self.setTitle(title, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapped(sender: AnyObject) {
        pressedAction()
    }
}
