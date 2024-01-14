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
