//
//  ViewController.swift
//  CBCentralManagerUnCrash
//
//  Created by Maciej Piotrowski on 28/01/16.
//  Copyright © 2016 swifting.io. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    @IBAction func foo(sender: AnyObject)  {
        let centralManager = CBCentralManager(delegate: nil, queue: nil)
        let _ = Object(centralManager: centralManager)
    }
}

