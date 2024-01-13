import Cocoa

//enum Month: Int {
//    case january = 1, february = 2, march = 3, april = 4, may = 5, june = 6, july = 7, august = 8, september = 9, october = 10, november = 11, december = 12
//}

enum Month: Int {
    case january = 1, february, march, april, may, june, july, august, september, october, november, december
}

func monthsUntilWinterBreak(from month: Month) -> Int {
    Month.december.rawValue - month.rawValue
}
monthsUntilWinterBreak(from: .april)

let fifthMonth = Month(rawValue: 5)
//monthsUntilWinterBreak(from: fifthMonth) // Value of optional type 'Month?' must be unwrapped to a value of type 'Month'
monthsUntilWinterBreak(from: fifthMonth!)



enum Icon: String {
    case music
    case sports
    case weather

    var filename: String {
        "\(rawValue).png"
    }
}

let icon = Icon.weather
icon.filename



enum Coin: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let coin = Coin.quarter
coin.rawValue

let aSmallCoin = Coin.dime
coin.rawValue > aSmallCoin.rawValue

aSmallCoin.rawValue + coin.rawValue
