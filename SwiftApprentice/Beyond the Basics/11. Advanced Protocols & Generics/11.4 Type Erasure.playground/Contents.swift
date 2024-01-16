import Cocoa

let array = Array(1...10)
let set = Set(1...10)
let reversedArray = array.reversed()

for e in reversedArray {
    print(e)
}

//let collection = [array, set, reversedArray] // Heterogeneous collection literal could only be inferred to '[Any]'; add explicit type annotation if this is intentional

let arrayCollections = [array, Array(set), Array(reversedArray)]

// Swift为集合提供了一种类型擦除类型，名为 AnyCollection
let collections = [AnyCollection(array), AnyCollection(set), AnyCollection(array.reversed())]
let total = collections.reduce(0) { $0 + $1.reduce(0, +) }
/*
 AnyIterator 、 AnySequence 、 AnyCollection 、 AnyHashable 是Swift标准库的一部分， AnyPublisher 是Combine框架的一部分， AnyView 是SwiftUI的一部分。
 */

let collectionsAny: [any Collection] = [array, set, reversedArray]
//let totalAny = collectionsAny.reduce(0) { $0 + $1.reduce(0, +) } // Cannot convert value of type '(Int) -> Int' to expected argument type '(Int, Any) throws -> Int'
let collectionsAnyInt: [any Collection<Int>] = [array, set, reversedArray]
let totalAnyInt = collectionsAnyInt.reduce(0) { $0 + $1.reduce(0, +) }

/*
 像 AnyCollection 这样的类型擦除类型和像 any Collection 这样的存在类型之间有一个根本的区别——协议一致性。
 AnyCollection  符合  Collection  和  Sequence  协议，而  any Collection  则不符合。
 
 通常不会注意到这个限制，因为编译器会打开存在性类型(打开框)，如果你把它作为参数传递，它会把它转换成一个具体类型。有时你可能会注意到这个限制。例如，不可能在 [any Collection] 上调用 flatMap ，因为元素 any Collection 不符合 Sequence 。 flatMap() 对 AnyCollection 来说工作得很好，因为它符合 Sequence 。
 */
