import Cocoa

var age: Int?
age = 17
age = nil

switch age {
case .none:
    print("No value")
case .some(let value):
    print("Got a value: \(value)")
}



let optionalNil: Int? = .none
optionalNil == nil
optionalNil == .none
