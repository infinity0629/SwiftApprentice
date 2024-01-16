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



struct PaintingPlan {
    var accent = Color.white
    var bucket = Bucket(color: .blue)
}

let artPlan = PaintingPlan()
let housePlan = artPlan
artPlan.bucket.color
housePlan.bucket.color = Color.green
artPlan.bucket.color



struct PaintingPlanCopyOnWrite {
    var accent = Color.white
    private var bucket = Bucket(color: .blue)
    
    var bucketColor: Color {
        get {
            bucket.color
        }
        set {
            if isKnownUniquelyReferenced(&bucket) {
                bucket.color = bucketColor
            } else {
                bucket = Bucket(color: newValue)
            }
        }
    }
        
}

let artPlanCOW = PaintingPlanCopyOnWrite()
var housePlanCOW = artPlanCOW
artPlanCOW.bucketColor
housePlanCOW.bucketColor = .green
artPlanCOW.bucketColor
