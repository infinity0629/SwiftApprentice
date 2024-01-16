import Cocoa

struct Order {
    @ValidatedDate var orderPlacedDate: String
    @ValidatedDate var shippingDate: String
    @ValidatedDate var deliveredDate: String
}

@propertyWrapper
public struct ValidatedDate {
    private var storage: Date? = nil
    private(set) var formatter = DateFormatter()

    public init(wrappedValue: String) {
        self.formatter.dateFormat = "yyyy-mm-dd"
        self.wrappedValue = wrappedValue
    }

    public var wrappedValue: String {
        get {
            if let date = self.storage {
                return formatter.string(from: date)
            } else {
                return "invalid"
            }
        }
        set {
            self.storage = formatter.date(from: newValue)
        }
    }
    
    public var projectedValue: DateFormatter {
        get { formatter }
        set { formatter = newValue }
    }
}

var o = Order(orderPlacedDate: "", shippingDate: "", deliveredDate: "")
o.orderPlacedDate = "2014-06-02"
o.orderPlacedDate

let otherFormatter = DateFormatter()
otherFormatter.dateFormat = "mm/dd/yyyy"
o.$orderPlacedDate = otherFormatter
o.orderPlacedDate
