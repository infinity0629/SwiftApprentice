import Cocoa

protocol Pet {
    associatedtype Food
    var name: String { get }
}

struct DogFood {}

struct Dog: Pet {
    typealias Food = DogFood
    var name: String
}

var pet: any Pet = Dog(name: "Mattie")



protocol WeightCalculatable {
    associatedtype WeightType
    var weight: WeightType { get }
}

class Truck: WeightCalculatable {
//    typealias WeightType = Int
    var weight: Int { 100 }
}

class Flower: WeightCalculatable {
//    typealias WeightType = Double
    var weight: Double { 0.0025 }
}

// 问题：关联的类型是完全不受约束的，可以是任何你想要的类型，没有任何限制可以阻止你将 WeightType 定义为字符串或其他类型。
class StringWeightThing: WeightCalculatable {
//  typealias WeightType = String
    var weight: String { "Superheavy" }
}

class DogWeightThing: WeightCalculatable {
//  typealias WeightType = Dog
    var weight: Dog { Dog(name: "Rufus") }
}



protocol WeightCalculatableConstrain {
    associatedtype WeightType: Numeric
    var weight: WeightType { get }
}

class TruckConstrain: WeightCalculatableConstrain {
    var weight: Int { 100 }
}

class FlowerConstrain: WeightCalculatableConstrain {
    var weight: Double { 0.0025 }
}

//class StringWeightThingConstrain: WeightCalculatableConstrain { // Type 'StringWeightThingConstrain' does not conform to protocol 'WeightCalculatableConstrain'
//    var weight: String { "Superheavy" }
//}

//class DogWeightThingConstrain: WeightCalculatableConstrain { // Type 'DogWeightThingConstrain' does not conform to protocol 'WeightCalculatableConstrain'
//    var weight: Dog { Dog(name: "Rufus") }
//}



extension WeightCalculatableConstrain {
    static func + (left: Self, right: Self) -> WeightType {
        left.weight + right.weight
    }
}

var heavyTruck1 = TruckConstrain()
var heavyTruck2 = TruckConstrain()
heavyTruck1 + heavyTruck2

var lightFlower1 = FlowerConstrain()
//heavyTruck1 + lightFlower1 // Cannot convert value of type 'FlowerConstrain' to expected argument type 'TruckConstrain'



protocol Product {}

protocol ProductionLine  {
    func produce() -> any Product
}

protocol Factory {
    var productionLines: [any ProductionLine] { get }
}

extension Factory {
    func produce() -> [any Product] {
        var items: [any Product] = []
        productionLines.forEach { items.append($0.produce()) }
        print("Finished Production")
        print("-------------------")
        return items
    }
}

struct Car: Product {
    init() {
        print("Car 🚘")
    }
}

struct CarProductionLine: ProductionLine {
    func produce() -> any Product {
        Car()
    }
}

struct CarFactory: Factory {
    var productionLines: [any ProductionLine] = []
}

var carFactory = CarFactory()
carFactory.productionLines = [CarProductionLine(), CarProductionLine()]
carFactory.produce()

struct Chocolate: Product {
    init() {
        print("Chocolate bar 🍫")
    }
}

struct ChocolateProductionLine: ProductionLine {
    func produce() -> any Product {
        Chocolate()
    }
}

var oddCarFactory = CarFactory()
oddCarFactory.productionLines = [CarProductionLine(), ChocolateProductionLine()]
oddCarFactory.produce() // 问题：本应该 CarFactory 只能生产 Car。实际可以直接在 CarFactory 生产 Chocolate。



protocol ProductConstrain {
    init()
}

protocol ProductionLineConstrain {
    associatedtype ProductType: ProductConstrain
    func produce() -> ProductType
}

protocol FactoryConstrain {
    associatedtype ProductType: ProductConstrain
    associatedtype LineType: ProductionLineConstrain
    var productionLines: [LineType] { get }
    func produce() -> [ProductType]
}

extension FactoryConstrain where ProductType == LineType.ProductType {
    func produce() -> [ProductType] {
        var newItems: [ProductType] = []
        productionLines.forEach { newItems.append($0.produce()) }
        print("Finished Production")
        print("-------------------")
        return newItems
    }
}

struct CarConstrain: ProductConstrain {
    init() {
        print("Car 🚘")
    }
}

struct ChocolateConstrain: ProductConstrain {
    init() {
        print("Chocolate bar 🍫")
    }
}

struct GenericProductionLine<P: ProductConstrain>: ProductionLineConstrain {
    func produce() -> P {
        P()
    }
}

struct GenericFactory<P: ProductConstrain>: FactoryConstrain {
    typealias ProductType = P
    var productionLines: [GenericProductionLine<P>] = []
}

var carFactoryConstrain = GenericFactory<CarConstrain>()
carFactoryConstrain.productionLines = [GenericProductionLine<CarConstrain>(), GenericProductionLine<CarConstrain>()]
carFactoryConstrain.produce()

//carFactoryConstrain.productionLines = [GenericProductionLine<CarConstrain>(), GenericProductionLine<ChocolateConstrain>()] // Cannot convert value of type 'GenericProductionLine<ChocolateConstrain>' to expected element type 'Array<GenericProductionLine<CarConstrain>>.ArrayLiteralElement' (aka 'GenericProductionLine<CarConstrain>')
