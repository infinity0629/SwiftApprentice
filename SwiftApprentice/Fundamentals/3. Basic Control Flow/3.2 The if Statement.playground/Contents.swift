import Cocoa

if 2 > 1 {
    print("Yes, 2 is greater than 1.")
}

let animal = "Zebra"
if animal == "Cat" || animal == "Dog" {
    print("Animal is a house pet.")
} else {
    print("Animal is not a house pet.")
}

let hourOfDay = 12
var timeOfDay: String
if hourOfDay < 6 {
    timeOfDay = "Early morning"
} else if hourOfDay < 12 {
    timeOfDay = "Morning"
} else if hourOfDay < 17 {
    timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
    timeOfDay = "Evening"
} else if hourOfDay < 24 {
    timeOfDay = "Late evening"
} else {
    timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)



var name = "Matt Galloway"
if 1 > 2 && name == "Matt Galloway" {
    print(name)
}

name = ""
if 1 < 2 || name == "Matt Galloway" {
    print("Short-Circuiting")
}



var hoursWorked = 45
var price = 0
if hoursWorked > 40 {
    let hoursOver40 = hoursWorked - 40
    price += hoursOver40 * 50
    hoursWorked -= hoursOver40
}
price += hoursWorked * 25
print(price)
//print(hoursOver40) // Cannot find 'hoursOver40' in scope



let a = 5
let b = 10

//let min: Int
//if a < b {
//    min = a
//} else {
//    min = b
//}
//
//let max: Int
//if a > b {
//    max = a
//} else {
//    max = b
//}

let min = a < b ? a : b
let max = a > b ? a : b
