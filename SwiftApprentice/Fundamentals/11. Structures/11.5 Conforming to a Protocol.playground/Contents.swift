import Cocoa

struct Location {
    let x: Int
    let y: Int
}

struct DeliveryArea: CustomStringConvertible {
    
    let center: Location
    var radius: Double
    
    var description: String {
            """
            Area with center: (x: \(center.x), y: \(center.y)),
            radius: \(radius)
            """
    }
    
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

var area1 = DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5)
var area2 = area1
area1.radius = 4
print(area1)
print(area2)
