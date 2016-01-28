//
//  CBCentralManager+Extension.swift
//  CBCentralManagerUnCrash
//
//  Created by Maciej Piotrowski on 28/01/16.
//  Copyright © 2016 swifting.io. All rights reserved.
//

import CoreBluetooth

extension CBCentralManager {
    class func descriptionForState(state: CBCentralManagerState) -> NSString {
        var msg = ""
        switch(state) {
        case .PoweredOn: msg = "powered on"
        case .PoweredOff: msg = "powered off"
        case .Unauthorized: msg = "unauthorized"
        case .Unsupported: msg = "unsupported"
        case .Unknown: msg = "unknown"
        case .Resetting: msg = "resetting"
        }
        msg = "Bluetooth Central is " + msg + "."
        return msg
    }
}

