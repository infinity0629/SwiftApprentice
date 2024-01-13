import Cocoa

protocol WeightCalculatable {
    associatedtype WeightType
    var weight: WeightType { get }
}

struct HeavyThing: WeightCalculatable {
    typealias WeightType = Int

    var weight: Int { 100 }
}

struct LightThing: WeightCalculatable {
    typealias WeightType = Double

    var weight: Double { 0.0025 }
}



/*
 对于不包含关联类型的协议，Swift并不严格要求你使用 any  关键字，但对于包含关联类型的协议，这是必须的.这确保你明白编译器为你做了许多工作，以隐藏底层类型的大小和实现细节.
 */

//let weightedThing: WeightCalculatable = LightThing() // Use of protocol 'WeightCalculatable' as a type must be written 'any WeightCalculatable'
let weightedThing: any WeightCalculatable = LightThing()



protocol Vehicle {
    static var maxSpeed: Double { get }
    var speed: Double { get set }

    mutating func accelerate()
    mutating func stop()
    func describe() -> String
}

extension Vehicle {
    mutating func stop() {
        speed = 0
    }
}

extension Vehicle {
    var normalizedSpeed: Double {
        speed / Self.maxSpeed
    }
}

protocol Wheeled {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get }
}

struct Car {
    static var maxSpeed: Double { 150 }
    var speed: Double  = 0
    
    mutating func accelerate() {
        speed = min(speed + 20, Self.maxSpeed)
    }
    
    func describe() -> String {
        "Car @ \(speed) mph"
    }
}

extension Car: Vehicle {}
extension Car: Wheeled {
    var numberOfWheels: Int { 4 }
    var wheelSize: Double { 17 }
}
/*
 注意：对于继承自基类并采用许多协议的类，您必须在列表中首先编写基类，然后编写它采用的所有协议。
 */



func freeze(transportation: inout any Vehicle & Wheeled) {
    transportation.stop()
    print("Stopping the rotation of \(transportation.numberOfWheels) wheel(s).")
}

//var car1 = Car()
//freeze(transportation: &car1) // Inout argument could be set to a value with a type other than 'Car'; use a value declared as type 'any Vehicle & Wheeled' instead
var car1: any Wheeled & Vehicle = Car()
freeze(transportation: &car1)

func freeze(transportation: inout some Vehicle & Wheeled) {
    transportation.stop()
    print("Stopping the rotation of \(transportation.numberOfWheels) wheel(s). --- some")
}

var car2 = Car()
freeze(transportation: &car2) // 使用 some 关键字就可以直接传入实体类型。



protocol Named {
    var name: String { get set }
}

class ClassyName: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct StructyName: Named {
    var name: String
}

var named: Named = ClassyName(name: "Classy")
var copy = named
named.name = "Still Classy"
named.name
copy.name

named = StructyName(name: "Structy")
copy = named
named.name = "Still Structy?"
named.name
copy.name



// 可以使用协议  AnyObject  来约束，只能被类 class  实现。
protocol NamedAnyObject: AnyObject {
    var name: String { get set }
}
