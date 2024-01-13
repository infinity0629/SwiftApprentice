import Cocoa

//let yes: Bool = true
//let no: Bool = false
let yes = true
let no = false



let doesOneEqualTwo = (1 == 2)
let doesOneNotEqualTwo = (1 != 2)
let alsoTrue = !(1 == 2)
let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)



let and = true && true
let or = true || false

let andTrue = 1 < 2 && 4 > 3
let andFalse = 1 < 2 && 3 > 4
let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4

let andOr = (1 < 2 && 3 > 4) || 1 < 4
//1. (1 < 2 && 3 > 4) || 1 < 4
//2. (true && false) || true
//3. false || true
//4. true



let guess = "dog"
let dogEqualsCat = guess == "cat"
let order = "cat" < "dog"



var switchState = true
switchState.toggle()
switchState.toggle()
