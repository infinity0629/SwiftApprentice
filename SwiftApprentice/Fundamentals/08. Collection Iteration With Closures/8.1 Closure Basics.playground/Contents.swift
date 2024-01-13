import Cocoa

var multiplyClosure: (Int, Int) -> Int
multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}
multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}
multiplyClosure = { a, b in
    a * b
}
multiplyClosure = {
    $0 * $1
}
let result = multiplyClosure(4, 2)



func operateOnNumbers(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    print(result)
    return result
}

let addClosure = { (a: Int, b: Int) in
    a + b
}
operateOnNumbers(4, 2, operation: addClosure)

operateOnNumbers(4, 2, operation: { (a: Int, b: Int) -> Int in
    return a + b
})

operateOnNumbers(4, 2, operation: { $0 + $1 })

operateOnNumbers(4, 2, operation: +)

operateOnNumbers(4, 2) {
    $0 + $1
}



func sequenced(first: ()->Void, second: ()->Void) {
    first()
    second()
}

sequenced {
    print("Hello, ", terminator: "")
} second: {
    print("world.")
}



let voidClosure: () -> Void = {
  print("Swift Apprentice is awesome!")
}
voidClosure()



var counter = 0
let incrementCounter = {
  counter += 1
}
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
print(counter)

func countingClosure() -> () -> Int {
    var counter = 0
    let incrementCounter: () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}
let counter1 = countingClosure()
let counter2 = countingClosure()
counter1()
counter2()
counter1()
counter1()
counter2()
