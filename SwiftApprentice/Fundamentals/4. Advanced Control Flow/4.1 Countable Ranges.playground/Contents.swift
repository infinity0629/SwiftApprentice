import Cocoa

let closedRange = 0...5
let halfOpenRange = 0..<5



while Int.random(in: 1...6) != 6 {
    print("Not a six")
}



let count = 10
var sum = 0
for i in 1...count {
    sum += i
}

sum = 1
var lastSum = 0
for _ in 0..<count {
    let temp = sum
    sum = sum + lastSum
    lastSum = temp
}

sum = 0
for i in 1...count where i % 2 == 1 {
    sum += i
}



sum = 0
for row in 0..<8 {
    if row % 2 == 0 {
        continue
    }

    for column in 0..<8 {
        sum += row * column
    }
}

sum = 0
rowLoop: for row in 0..<8 {
    columnLoop: for column in 0..<8 {
        if row == column {
            continue rowLoop
        }
        sum += row * column
    }
}
