import Cocoa

class SavingsAccount: BasicAccount {
    var interestRate: Double
    private let pin: Int
    
    @available(*, deprecated, message: "Use init(interestRate:pin:) instead")
    init(interestRate: Double) {
        self.interestRate = interestRate
        pin = 0;
    }

    init(interestRate: Double, pin: Int) {
        self.interestRate = interestRate
        self.pin = pin
    }

    @available(*, deprecated, message: "Use processInterest(pin:) instead")
    func processInterest() {
        let interest = balance * interestRate
        deposit(amount: interest)
    }

    func processInterest(pin: Int) {
        if pin == self.pin {
            let interest = balance * interestRate
            deposit(amount: interest)
        }
    }
}



func createAccount() -> some Account {
    CheckingAccount()
}
