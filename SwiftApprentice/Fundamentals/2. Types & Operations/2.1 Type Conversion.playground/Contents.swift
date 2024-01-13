import Cocoa

var integer: Int = 100
var decimal: Double = 12.5
//integer = decimal // Cannot assign value of type 'Double' to type 'Int'
integer = Int(decimal)



let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
//let totalCost: Double = hourlyRate * hoursWorked // Cannot convert value of type 'Int' to expected argument type 'Double'
let totalCost: Double = hourlyRate * Double(hoursWorked)



let typeInferredInt = 42
let typeInferredDouble = 3.14159



let wantADouble = 3
print(type(of: wantADouble))
let actuallyDouble1 = Double(3)
let actuallyDouble2: Double = 3
let actuallyDouble3 = 3 as Double
print(type(of: actuallyDouble1))
print(type(of: actuallyDouble2))
print(type(of: actuallyDouble3))
