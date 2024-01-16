import Cocoa

//func makeValueRandomly() -> some FixedWidthInteger { // Function declares an opaque return type 'some FixedWidthInteger', but the return statements in its body do not have matching underlying types
//    if Bool.random() {
//        return Int(42)
//    }
//    else {
//        return Int8(24)
//    }
//}

func makeValueRandomly() -> some FixedWidthInteger {
    if Bool.random() {
        return Int(42)
    }
    else {
        return Int(24)
    }
}



func makeEquatableNumericInt() -> some Numeric & Equatable { 1 }
func makeEquatableNumericDouble() -> some Numeric & Equatable { 1.0 }

let value1 = makeEquatableNumericInt()
let value2 = makeEquatableNumericInt()

print(value1 == value2)
print(value1 + value2)
//print(value1 > value2) // Binary operator '>' cannot be applied to two 'some Numeric' operands

//makeEquatableNumericInt() == makeEquatableNumericDouble() // Cannot convert value of type 'some Numeric' (result of 'makeEquatableNumericDouble()') to expected argument type 'some Numeric' (result of 'makeEquatableNumericInt()')



var someCollection: some Collection = [1, 2, 3]
print(type(of: someCollection))
//someCollection.append(4) // Value of type 'some Collection' has no member 'append'
// 注意：如果你想编译 someCollection.append(4) ，你需要将其声明为 some RangeReplaceableCollection<Int> ，其中包含了 append(: Int) 方法。

var intArray = [1, 2, 3]
var intSet = Set([1, 2, 3])
//var arrayOfSome: [some Collection] = [intArray, intSet] // Conflicting arguments to generic parameter 'τ_0_0' ('[Int]' vs. 'Set<Int>')
var arrayOfAny: [any Collection] = [intArray, intSet]

var someArray: some Collection = intArray
var someSet: some Collection = intSet
//someArray = someSet // Cannot assign value of type 'some Collection' (type of 'someSet') to type 'some Collection' (type of 'someArray')
//someSet = someArray // Cannot assign value of type 'some Collection' (type of 'someArray') to type 'some Collection' (type of 'someSet')
var anyElement: any Collection = intArray
anyElement = intSet

var intArray2 = [1, 2, 3]
var someArray2: some Collection = intArray2
//someArray = someArray2 // Cannot assign value of type 'some Collection' (type of 'someArray2') to type 'some Collection' (type of 'someArray')



//func product<C: Collection>(_ input: C) -> Double where C.Element == Double {
//    input.reduce(1, *)
//}
func product(_ input: some Collection<Double>) -> Double {
    input.reduce(1, *)
}

product([1,2,3,4])
