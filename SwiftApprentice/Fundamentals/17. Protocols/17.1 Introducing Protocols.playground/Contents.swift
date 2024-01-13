import Cocoa

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


//let vehicle = Vehicle() // 'any Vehicle' cannot be constructed because it has no accessible initializers



class Unicycle: Vehicle {
    static var maxSpeed: Double { 15 }
    var speed: Double  = 0

    func accelerate() {
        speed = min(speed + 2, Self.maxSpeed)
    }
    
//    func stop() {
//        speed = 0
//    }
    
    func describe() -> String {
        "Unicycle @ \(speed) mph"
    }
}



struct Car {
    static var maxSpeed: Double { 150 }
    var speed: Double  = 0
    
    mutating func accelerate() {
        speed = min(speed + 20, Self.maxSpeed)
    }
    
//    mutating func stop() {
//        speed = 0
//    }
    
    func describe() -> String {
        "Car @ \(speed) mph"
    }
}

extension Car: Vehicle {}
/*
 注意：不能在扩展中声明存储属性，只能在原始类型声明中声明存储属性，或者在类类型的派生类中声明存储属性，这个限制可能会对实现某些类型的任意协议一致性带来挑战。
 */




enum BrakePressure {
    case light
    case normal
    case hard
}

protocol Braking {
//    mutating func brake(_ pressure: BrakePressure = .normal) // Default argument not permitted in a protocol method
    mutating func brake(_ pressure: BrakePressure)
}

// 协议方法不能有默认参数，可以用以下方法模拟一个默认参数：
extension Braking {
    mutating func brake() {
        brake(.normal)
    }
}



protocol Account {
    var value: Double { get set }
    
    init(initialAmount: Double)
    init?(transferAccount: Account)
}

// 如果  class  类型实现协议的初始化方法，那么这些初始化方法必须使用  required  关键字：
class BitcoinAccount: Account {
    var value: Double
    
    required init(initialAmount: Double) {
        value = initialAmount
    }
    
    required init?(transferAccount: Account) {
        guard transferAccount.value > 0.0 else {
            return nil
        }
        value = transferAccount.value
    }
}

// 实例化一个  BitcoinAccount ，可以像正常一样使用  BitcoinAccount(initialAmount: 30) 。
// 然而，为了证明你可以严格地通过  Account  协议创建一个  BitcoinAccount ，可以使用一个  Account  的元类型，
let accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30)
let transferAccount = accountType.init(transferAccount: account)!



protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get }
}

extension Unicycle: WheeledVehicle {
    var numberOfWheels: Int { 1 }
    var wheelSize: Double { 20.0 }
}



func stop(vehicles: [Vehicle]) {
    vehicles.forEach { vehicle in
//        vehicle.stop() // Cannot use mutating member on immutable value: 'vehicle' is a 'let' constant
    }
}

// 使用 inout  关键字使数组可修改，以便成功调用一个 mutating 方法。
func stop(vehicles: inout [Vehicle]) {
    // 使用索引循环
    vehicles.indices.forEach {
        vehicles[$0].stop()
    }
}

/*
 在新的 Swift 版本中，可以区分  Vehicle  协议和包含任何类型的  Vehicle  的盒子类型，这是通过编写  any Vehicle  而不是  Vehicle  来实现的。
 
 使用 any Vehicle 可以清楚地表明 vehicles 是一个实例化盒( any Vehicle )类型的数组。要能够处理各种 Vehicle 类型，需要付出一点运行时代价，而 any Vehicle (虽然不是必需的)突出了这一代价。未来的Swift版本可能要求你在这里使用 any ，否则可能会导致警告或错误。
 */
func stopAny(vehicles: inout [any Vehicle]) {
    vehicles.indices.forEach {
        vehicles[$0].stop()
    }
}
