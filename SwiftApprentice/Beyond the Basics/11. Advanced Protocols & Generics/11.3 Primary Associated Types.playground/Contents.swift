import Cocoa

protocol Product {
    init()
}

// 协议声明添加 <ProductType>
// 注意：Swift 5.7 引入了主关联类型，现在许多标准库类型都利用了这个特性，例如，与其只指定一个  Collection  协议，你还可以约束特定的元素类型，例如： any Collection<Double> 。
protocol ProductionLine<ProductType> {
    associatedtype ProductType: Product
    func produce() -> ProductType
}

protocol Factory {
    associatedtype ProductType: Product
    associatedtype LineType: ProductionLine
    var productionLines: [LineType] { get }
    func produce() -> [ProductType]
}

extension Factory where ProductType == LineType.ProductType {
    func produce() -> [ProductType] {
        var newItems: [ProductType] = []
        productionLines.forEach { newItems.append($0.produce()) }
        print("Finished Production")
        print("-------------------")
        return newItems
    }
}

struct Car: Product {
    init() {
        print("Car 🚘")
    }
}

struct Chocolate: Product {
    init() {
        print("Chocolate bar 🍫")
    }
}

struct GenericProductionLine<P: Product>: ProductionLine {
    func produce() -> P {
        P()
    }
}

struct GenericFactory<P: Product>: Factory {
    typealias ProductType = P
    var productionLines: [GenericProductionLine<P>] = []
}



func produceCars(line: any ProductionLine<Car>, count: Int) -> [Car] {
    (1...count).map { _ in line.produce() }
}
produceCars(line: GenericProductionLine<Car>(), count: 5)

