//
//  Object.swift
//  CBCentralManagerUnCrash
//
//  Created by Maciej Piotrowski on 28/01/16.
//  Copyright © 2016 swifting.io. All rights reserved.
//

import CoreBluetooth

class Object: NSObject {
    
    let centralManager: CBCentralManager
    
    init(centralManager: CBCentralManager) {
        self.centralManager = centralManager
        super.init()
        self.centralManager.delegate = self
    }
    
    deinit  {
        //TODO: Ucomment line below to un-crash ! :)
        //centralManager.delegate = nil
    }
}

extension Object: CBCentralManagerDelegate {
    @objc func centralManagerDidUpdateState(central: CBCentralManager){
        print(CBCentralManager.descriptionForState(central.state))
    }
}

