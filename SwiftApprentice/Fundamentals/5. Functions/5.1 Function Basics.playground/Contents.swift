import Cocoa

func printMyName() {
    print("My name is Matt Galloway.")
}
printMyName()



func printMultipleOfFive(value: Int) {
    print("\(value) * 5 = \(value * 5)")
}
printMultipleOfFive(value: 10)

func printMultipleOf(multiplier: Int, andValue: Int) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipleOf(multiplier: 4, andValue: 2)



func printMultipleOf(multiplier: Int, and value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(multiplier: 4, and: 2)



func printMultipleOf(_ multiplier: Int, and value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, and: 2)

func printMultipleOf(_ multiplier: Int, _ value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, 2)



//func multiply(_ number: Int, by multiplier: Int) -> Int {
//    return number * multiplier
//}
func multiply(_ number: Int, by multiplier: Int) -> Int {
    number * multiplier
}
let result = multiply(4, by: 2)

//func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
//    return (number * factor, number / factor)
//}
func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
    (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient



//func incrementAndPrint(_ value: Int) {
//    value += 1 // Left side of mutating operator isn't mutable: 'value' is a 'let' constant
//    print(value)
//}
func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}
var value = 5
incrementAndPrint(&value)
print(value)



func getValue() -> Int {
    31
}

func getValue() -> String {
    "Matt Galloway"
}

//let value = getValue() // Ambiguous use of 'getValue()'
let valueInt: Int = getValue()
let valueString: String = getValue()
