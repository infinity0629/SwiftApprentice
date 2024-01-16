import Cocoa

struct Color: CustomStringConvertible {
    var red, green, blue: Double
  
    var description: String {
        "r: \(red) g: \(green) b: \(blue)"
    }
}

extension Color {
    static var black = Color(red: 0, green: 0, blue: 0)
    static var white = Color(red: 1, green: 1, blue: 1)
    static var blue  = Color(red: 0, green: 0, blue: 1)
    static var green = Color(red: 0, green: 1, blue: 0)
}

class Bucket {
    var color: Color
    var isRefilled = false
  
    init(color: Color) {
        self.color = color
    }
  
    func refill() {
        isRefilled = true
    }
}

extension Color {
    mutating func darken() {
        red *= 0.9; green *= 0.9; blue *= 0.9
    }
}

@propertyWrapper
struct CopyOnWriteColor {
    private var bucket: Bucket

    init(wrappedValue: Color) {
        self.bucket = Bucket(color: wrappedValue)
    }

    var wrappedValue: Color {
        get {
            bucket.color
        }
        set {
            if isKnownUniquelyReferenced(&bucket) {
                bucket.color = newValue
            } else {
                bucket = Bucket(color:newValue)
            }
        }
    }
}

struct PaintingPlan {
    var accent = Color.white
    @CopyOnWriteColor var bucketColor = .blue
    @CopyOnWriteColor var bucketColorForDoor = .blue
    @CopyOnWriteColor var bucketColorForWalls = .blue
}

let artPlanCOW = PaintingPlan()
var housePlanCOW = artPlanCOW
artPlanCOW.bucketColor
housePlanCOW.bucketColor = .green
artPlanCOW.bucketColor
