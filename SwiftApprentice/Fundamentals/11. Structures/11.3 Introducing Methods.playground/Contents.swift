import Cocoa

struct Location {
    let x: Int
    let y: Int
}

struct DeliveryArea {
    let center: Location
    var radius: Double
    
    func contains(_ location: Location) -> Bool {
        let distanceFromCenter = distance(from: (center.x, center.y), to: (location.x, location.y))
        return distanceFromCenter < radius
    }
    
    func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double {
        let distanceX = Double(source.x - target.x)
        let distanceY = Double(source.y - target.y)
        return (distanceX * distanceX + distanceY * distanceY).squareRoot()
    }
}



// 使用全局函数
let areas = [
    DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5),
    DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
]

func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(_ location: Location) -> Bool {
    for area in areas {
        let distanceToStore = distance(from: (area.center.x, area.center.y), to: (location.x, location.y))

        if distanceToStore < area.radius {
            return true
        }
    }
    return false
}

let customerLocation1 = Location(x: 5, y: 5)
let customerLocation2 = Location(x: 7, y: 7)
isInDeliveryRange(customerLocation1)
isInDeliveryRange(customerLocation2)



// 直接使用结构体里的实例方法
let area = DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
let customerLocation = Location(x: 7, y: 7)
area.contains(customerLocation)
