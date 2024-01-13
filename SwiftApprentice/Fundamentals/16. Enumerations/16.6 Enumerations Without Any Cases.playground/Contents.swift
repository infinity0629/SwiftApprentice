import Cocoa

//struct Math {
//    static func factorial(of number: Int) -> Int {
//        (1...number).reduce(1, *)
//    }
//}

enum Math {
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
}

let factorial = Math.factorial(of: 6)

//let math = Math() // 'Math' cannot be constructed because it has no accessible initializers
