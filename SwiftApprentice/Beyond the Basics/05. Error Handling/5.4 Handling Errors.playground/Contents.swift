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

// 推荐使用！！！！！！
// 将 try 包含在 do {} 里，就可以在后续的 catch {} 中捕获到异常。（不会像直接使用 try 那样遇到异常导致程序直接崩溃了。）
do {
    try bakery.open()
    try bakery.orderPastry(item: "Albatross", amountRequested: 1, flavor: "AlbatrossFlavor")
} catch BakeryError.inventory, BakeryError.noPower {
    print("Sorry, the bakery is now closed.")
} catch BakeryError.doNotSell {
    print("Sorry, but we don’t sell this item.")
} catch BakeryError.wrongFlavor {
    print("Sorry, but we don’t carry this flavor.")
} catch BakeryError.tooFew {
    print("Sorry, we don’t have enough items to fulfill your order.")
}

// 如果你不关心错误细节，可以使用  try?  将函数(或方法)的结果封装在可选中，如果函数内部抛出错误，则返回  nil  ，在这种情况下，就不需要设置  do {} catch {}  块。
// 缺点是如果请求失败，你无法获得任何细节，这可能对你的用例来说没问题，但如果想知道具体失败原因，请确保使用  do {} catch {}  块。
let open = try? bakery.open(false)
let remaining = try? bakery.orderPastry(item: "Albatross", amountRequested: 1, flavor: "AlbatrossFlavor")

// 确信代码不会失败，可以使用  try!  。
// try!  很像强制取消可选参数的包装。就像强制取消可选参数的包装一样，你应该小心使用  try! 。只有在你想让程序在调用抛出时终止时才使用它。避免在生产代码中使用它。
try! bakery.open(true)
try! bakery.orderPastry(item: "Cookie", amountRequested: 1, flavor: "ChocolateChip")

