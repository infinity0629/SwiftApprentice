import Cocoa

let values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0): \($0*$0)")
}



var prices = [1.5, 10, 4.99, 2.30, 8.19]

// 按条件找到满足的所有值
let largePrices = prices.filter {
    $0 > 5
}

// 按条件找到满足的一个值（从第一个开始）
let largePrice1 = prices.first {
    $0 > 5
}

// 按条件找到满足的一个值（从最后一个开始）
let largePrice2 = prices.last {
    $0 > 5
}



let userInput = ["0", "11", "haha", "42"]

// 改变每一个，包括 nil
let numbers1 = userInput.map {
    Int($0)
}

// 改变每一个，不包括 nil（去除 nil ）
let numbers2 = userInput.compactMap {
    Int($0)
}

let userInputNested = [["0", "1"], ["a", "b", "c"], ["🐕"]]

// 将数组的数组（二维数组）拉平，变成独立数组（一维数组）。
let allUserInput = userInputNested.flatMap {
    $0
}



let sum = prices.reduce(0) {
    $0 + $1
}

let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0) {
    $0 + $1.key * Double($1.value)
}

let farmAnimals = ["🐎": 5, "🐄": 10, "🐑": 50, "🐶": 1]
let allAnimals = farmAnimals.reduce(into: []) { (result, this: (key: String, value: Int)) in
    for _ in 0 ..< this.value {
        result.append(this.key)
    }
}



let removeFirst = prices.dropFirst()
let removeFirstTwo = prices.dropFirst(2)

let removeLast = prices.dropLast()
let removeLastTwo = prices.dropLast(2)

let firstTwo = prices.prefix(2)
let lastTwo = prices.suffix(2)

prices.removeAll() { $0 > 2 }
prices.removeAll()



func isPrime(_ number: Int) -> Bool {
    if number == 1 { return false }
    if number == 2 || number == 3 { return true }

    for i in 2...Int(Double(number).squareRoot()) {
        if number % i == 0 { return false }
    }

    return true
}

//var primes: [Int] = []
//var i = 1
//while primes.count < 10 {
//    if isPrime(i) {
//        primes.append(i)
//    }
//    i += 1
//}
//primes.forEach { print($0) }

/**
 获取前10个质数的方法是，先创建一个包含所有质数的序列，然后使用 prefix()  获取前10个质数。然而，如何才能创建一个无限长的序列并获取它的 prefix()  呢？这时，可以使用 lazy  操作，告诉Swift在需要时按需创建集合。
 */
let primes = (1...).lazy
    .filter { isPrime($0) }
    .prefix(10)
primes.forEach { print($0) }
