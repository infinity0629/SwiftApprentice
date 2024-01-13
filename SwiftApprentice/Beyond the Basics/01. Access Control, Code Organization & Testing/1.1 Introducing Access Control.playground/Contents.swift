import Cocoa

let account = BasicAccount()
account.deposit(amount: 10.00)
account.withdraw(amount: 5.00)
//account.balance = 1000000.00 // Cannot assign to property: 'balance' setter is inaccessible


let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.00)
johnChecking.balance

let check = johnChecking.writeCheck(amount: 200.0)!
let janeChecking = CheckingAccount()
janeChecking.deposit(check)
janeChecking.balance

janeChecking.deposit(check)
janeChecking.balance


class SavingsAccount: BasicAccount {
    var interestRate: Double

    init(interestRate: Double) {
        self.interestRate = interestRate
    }

    func processInterest() {
        let interest = balance * interestRate
        deposit(amount: interest)
    }
    
//    override func deposit(amount: Dollars) { // Overriding non-open instance method outside of its defining module
//        super.deposit(amount: 1_000_000.00)
//    }

}
