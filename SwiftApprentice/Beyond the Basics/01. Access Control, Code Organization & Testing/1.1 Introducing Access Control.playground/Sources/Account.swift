import Foundation

protocol Account {
    associatedtype Currency

    var balance: Currency { get }
    
    func deposit(amount: Currency)
    func withdraw(amount: Currency)
}

public typealias Dollars = Double

// 必须使用 open，模块外需要继承。如果使用 public 则无法继承。
open class BasicAccount: Account {

    public private(set) var balance: Dollars = 0.0
    
    public init() {}

    public func deposit(amount: Dollars) {
        balance += amount
    }

    public func withdraw(amount: Dollars) {
        if amount <= balance {
            balance -= amount
        } else {
            balance = 0
        }
    }
}
