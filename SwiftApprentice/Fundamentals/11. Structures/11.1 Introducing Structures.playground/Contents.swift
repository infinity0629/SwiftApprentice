import Cocoa

let restaurantLocation = (3, 3)
let restaurantRange = 2.5

let otherRestaurantLocation = (8, 8)
let otherRestaurantRange = 2.5

func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

//func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
//  let deliveryDistance = distance(from: location, to: restaurantLocation)
//  return deliveryDistance < restaurantRange
//}

// 每一次添加新的地址就需要添加逻辑
func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
    let deliveryDistance = distance(from: location, to: restaurantLocation)
    let secondDeliveryDistance = distance(from: location, to: otherRestaurantLocation)
    return deliveryDistance < restaurantRange || secondDeliveryDistance < otherRestaurantRange
}

isInDeliveryRange(location: (x: 5, y: 5))



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
