import Cocoa

class Pastry {
    let flavor: String
    var numberOnHand: Int

    init(flavor: String, numberOnHand: Int) {
        self.flavor = flavor
        self.numberOnHand = numberOnHand
    }
}

enum BakeryError: Error {
    case tooFew(numberOnHand: Int), doNotSell, wrongFlavor
    case inventory, noPower
}

class Bakery {
    var itemsForSale = [
        "Cookie": Pastry(flavor: "ChocolateChip", numberOnHand: 20),
        "PopTart": Pastry(flavor: "WildBerry", numberOnHand: 13),
        "Donut" : Pastry(flavor: "Sprinkles", numberOnHand: 24),
        "HandPie": Pastry(flavor: "Cherry", numberOnHand: 6)
    ]
  
    func open(_ shouldOpen: Bool = Bool.random()) throws -> Bool {
        guard shouldOpen else {
            throw Bool.random() ? BakeryError.inventory : BakeryError.noPower
        }
        return shouldOpen
    }

    func orderPastry(item: String, amountRequested: Int, flavor: String)  throws  -> Int {
        guard let pastry = itemsForSale[item] else {
            throw BakeryError.doNotSell
        }

        guard flavor == pastry.flavor else {
            throw BakeryError.wrongFlavor
        }
        
        guard amountRequested <= pastry.numberOnHand else {
            throw BakeryError.tooFew(numberOnHand: pastry.numberOnHand)
        }
        pastry.numberOnHand -= amountRequested

        return pastry.numberOnHand
    }
}

let bakery = Bakery()
//bakery.open() // Call can throw but is not marked with 'try'
//bakery.orderPastry(item: "Albatross", amountRequested: 1, flavor: "AlbatrossFlavor") // Call can throw but is not marked with 'try'
try bakery.open()
try bakery.orderPastry(item: "Albatross", amountRequested: 1, flavor: "AlbatrossFlavor") // 可以执行，但是产生异常的时候会崩溃。
