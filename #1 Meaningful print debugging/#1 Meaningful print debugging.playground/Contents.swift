//: Playground - noun: a place where people can play

import UIKit

class Wheel {
    var spokes:Int = 0
    var diameter:Double = 0.0
    
    init(spokes:Int = 32, diameter:Double = 26.0) {
        self.spokes = spokes
        self.diameter = diameter
    }
    
    func removeSpoke() {
        spokes = spokes > 0 ? spokes-- : spokes
    }
}

extension Wheel:CustomStringConvertible, CustomDebugStringConvertible {
    var description:String {
        return "Wheel has \(spokes) spokes"
    }
    var debugDescription:String {
        return "Wheel has \(spokes) spokes and \(diameter) inches"
    }
}

var wheel = Wheel(spokes: 36, diameter: 29)
print(wheel) // Wheel
debugPrint(wheel) //Wheel


var wheel1 = Wheel(spokes: 36, diameter: 29)
var wheel2 = Wheel()

class WheelsViewController:UIViewController {
    var wheels = [Wheel]()
}

extension WheelsViewController {
    override var description:String{
        return "WheelsViewController has \(wheels.count) wheels"
    }
}

var wheelsViewController = WheelsViewController()
print(wheelsViewController)
wheelsViewController.wheels = [wheel1, wheel2]
print(wheelsViewController)









