//
//  ViewController.swift
//  SupportMe
//
//  Created by Michal Wojtysiak on 06/07/16.
//  Copyright © 2016 Michal Wojtysiak. All rights reserved.
//

import UIKit
import Intents
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        INPreferences.requestSiriAuthorization { (status) in
                var message = ""
                switch status{
                case .authorized:
                    message = "Authorized"
                case .denied:
                    message = "Denied"
                case .restricted:
                    message = "Restricted"
                default:
                    message = "Not determined"
                }
            DispatchQueue.main.async(execute: {
                print(message)
            })
        }
    }
}

