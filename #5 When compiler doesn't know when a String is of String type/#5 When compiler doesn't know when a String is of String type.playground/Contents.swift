protocol ClassNameConvertible {
    var className: String { get }
}

extension ClassNameConvertible where Self: AnyObject {
    var className: String {
        return String(Self)
    }
}

class Class1: ClassNameConvertible {}
class ClassN: ClassNameConvertible {}

//In this simple scenario `as String` cast is not necessary
let dictionary = [
    String(Class1) as String : "Custom string for class 1",
    String(ClassN) /*as String*/ : "Custom string for class n"
]

let class1 = Class1()
let classN = ClassN()
let s1 = class1.className
let sN = classN.className
dictionary[s1]
dictionary[sN]

