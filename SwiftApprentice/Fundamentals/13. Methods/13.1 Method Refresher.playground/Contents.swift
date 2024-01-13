import Cocoa

var numbers = [1, 2, 3]
numbers.removeLast()
numbers



let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

struct SimpleDate {
    var month: String
    
    func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
        months.firstIndex(of: "December")! - months.firstIndex(of: date.month)!
    }
}

//func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
//    months.firstIndex(of: "December")! - months.firstIndex(of: date.month)!
//}

let date = SimpleDate(month: "October")
date.monthsUntilWinterBreak(from: date)

//date.monthsUntilWinterBreak() // Missing argument for parameter 'from' in call
