import Cocoa

let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

struct SimpleDate {
    var month: String
    
    func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
        months.firstIndex(of: "December")! - months.firstIndex(of: date.month)!
    }
    
    func monthsUntilWinterBreak() -> Int {
//        虽然你总是可以使用 self 来访问当前实例的属性和方法，但大多数时候你不需要这样做，在 monthsUntilWinterBreak() 中，你可以使用 month 而不是 self.month
//        months.firstIndex(of: "December")! - months.firstIndex(of: self.month)!
        months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
}

let date = SimpleDate(month: "October")
date.monthsUntilWinterBreak()

