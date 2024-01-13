import Cocoa

var optionalInt: Int? = 10
//var mustHaveResult: Int
//if let unwrapped = optionalInt {
//    mustHaveResult = unwrapped
//} else {
//    mustHaveResult = 0
//}
var mustHaveResult = optionalInt ?? 0

optionalInt = nil
mustHaveResult = optionalInt ?? 0
