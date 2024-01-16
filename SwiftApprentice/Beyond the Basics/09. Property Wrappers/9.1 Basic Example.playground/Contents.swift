import Cocoa

@propertyWrapper
struct ZeroToOne {
    private var value: Double

    private static func clamped(_ input: Double) -> Double {
        min(max(input, 0), 1)
    }

    init(wrappedValue: Double) {
        value = Self.clamped(wrappedValue)
    }

    var wrappedValue: Double {
        get { value }
        set { value =  Self.clamped(newValue) }
    }
}

struct Color {
    @ZeroToOne var red: Double
    @ZeroToOne var green: Double
    @ZeroToOne var blue: Double
}

var superRed = Color(red: 2, green: 0, blue: 0)
print(superRed)
superRed.blue = -2
print(superRed)

func printValue(@ZeroToOne _ value: Double) {
    print("The wrapped value is", value)
}
printValue(3.14)



@propertyWrapper
struct ZeroToOneV2 {
    private var value: Double

    init(wrappedValue: Double) {
        value = wrappedValue
    }

    var wrappedValue: Double {
        get { min(max(value, 0), 1) }
        set { value = newValue }
    }

    var projectedValue: Double { value }
}

func printValueV2(@ZeroToOneV2 _ value: Double) {
    print("The wrapped value is", value)
    print("The projected value is", $value)
}
printValueV2(3.14)



//@propertyWrapper
//struct ZeroTo {
//    private var value: Double
//    let upper: Double
//
//    init(wrappedValue: Double, upper: Double) {
//        value = wrappedValue
//        self.upper = upper
//    }
//
//    var wrappedValue: Double {
//        get { min(max(value, 0), upper) }
//        set { value = newValue }
//    }
//
//    var projectedValue: Double { value }
//}

@propertyWrapper
struct ZeroTo<Value: Numeric & Comparable> {
    private var value: Value
    let upper: Value

    init(wrappedValue: Value, upper: Value) {
        value = wrappedValue
        self.upper = upper
    }

    var wrappedValue: Value {
        get { min(max(value, 0), upper) }
        set { value = newValue }
    }

    var projectedValue: Value { value }
}

func printValueV3(@ZeroTo(upper: 10) _ value: Double) {
    print("The wrapped value is", value)
    print("The projected value is", $value)
}
printValueV3(42)




