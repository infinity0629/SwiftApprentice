import Cocoa

infix operator **

//func **(base: Int, power: Int) -> Int {
//    precondition(power >= 2)
//    var result = base
//    for _ in 2...power {
//        result *= base
//    }
//    return result
//}

func **<T: BinaryInteger>(base: T, power: Int) -> T {
    precondition(power >= 2)
    var result = base
    for _ in 2...power {
        result *= base
    }
    return result
}

let base = 2
let exponent = 2
let result = base ** exponent



infix operator **=

//func **=(lhs: inout Int, rhs: Int) {
//    lhs = lhs ** rhs
//}

func **=<T: BinaryInteger>(lhs: inout T, rhs: Int) {
    lhs = lhs ** rhs
}

var number = 2
number **= exponent



let unsignedBase: UInt = 2
let unsignedResult = unsignedBase ** exponent

let base8: Int8 = 2
let result8 = base8 ** exponent

let unsignedBase8: UInt8 = 2
let unsignedResult8 = unsignedBase8 ** exponent

let base16: Int16 = 2
let result16 = base16 ** exponent

let unsignedBase16: UInt16 = 2
let unsignedResult16 = unsignedBase16 ** exponent

let base32: Int32 = 2
let result32 = base32 ** exponent

let unsignedBase32: UInt32 = 2
let unsignedResult32 = unsignedBase32 ** exponent

let base64: Int64 = 2
let result64 = base64 ** exponent

let unsignedBase64: UInt64 = 2
let unsignedResult64 = unsignedBase64 ** exponent



//2 * 2 ** 3 ** 2 // Adjacent operators are in non-associative precedence group 'DefaultPrecedence'
2 * (2 ** (3 ** 2))

// 为幂运算符创建了一个优先级组，告诉Swift它是右结合的，优先级高于乘法运算符。才可以直接不用括号运算。
//precedencegroup ExponentiationPrecedence {
//    associativity: right
//    higherThan: MultiplicationPrecedence
//}
//infix operator **: ExponentiationPrecedence
