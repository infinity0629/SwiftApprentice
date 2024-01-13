import Cocoa

let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

struct SimpleDate {
    var month: String
    var day: Int
    
    init() {
        month = "January"
        day = 1
    }
    
    init(month: String, day: Int) {
        self.month = month
        self.day = day
    }
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
}

// 如果结构体“没有实现” init() 就会报错：Missing argument for parameter 'month' in call
//let date = SimpleDate()

// 如果结构体“只实现” init() 就会报错：Argument passed to call that takes no arguments
//let date = SimpleDate(month: "October")

let date = SimpleDate()
date.month
date.monthsUntilWinterBreak()

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month
valentinesDay.day



// 有一个更简单的方法来创建无参数初始化器。当为参数设置默认值时，自动成员初始化器将使用它们。
struct SimpleDateDefaultValuesAndInitializers {
    var month = "January"
    var day = 1

    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
}

let newYearsDayDefault = SimpleDateDefaultValuesAndInitializers()
newYearsDayDefault.month
newYearsDayDefault.day

let valentinesDayDefault = SimpleDateDefaultValuesAndInitializers(month: "February", day: 14)
valentinesDayDefault.month
valentinesDayDefault.day
