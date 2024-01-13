import Cocoa

struct Location {
    let x: Int
    let y: Int
}

struct DeliveryArea {
    let center: Location
    var radius: Double
}

let storeLocation = Location(x: 3, y: 3)
var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)



storeArea.radius
storeArea.center.x

storeArea.radius = 3.5



let fixedArea = DeliveryArea(center: storeLocation, radius: 4)

//fixedArea.radius = 3.5 // Cannot assign to property: 'fixedArea' is a 'let' constant
