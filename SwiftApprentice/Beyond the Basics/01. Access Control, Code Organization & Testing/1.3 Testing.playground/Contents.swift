import Cocoa
import XCTest

class BankingTests: XCTestCase {
    
    var checkingAccount: CheckingAccount!

    // 每个（一个函数是一个）测试之前执行，其目的是初始化测试运行所需的状态。
    override func setUp() {
        super.setUp()
        print("================================= setUp ==================================")
        checkingAccount = CheckingAccount()
    }
    
    // 每个（一个函数是一个）测试后运行执行。无论测试通过还是失败，它都无关紧要。当你需要释放获取的资源或重置对象的状态时，它非常有用。
    override func tearDown() {
        print("================================ tearDown ================================")
        checkingAccount.withdraw(amount: checkingAccount.balance)
        super.tearDown()
    }
    
    func testNewAccountBalanceZero() {
        XCTAssertEqual(checkingAccount.balance, 0)
    }

    func testCheckOverBudgetFails() {
        let check = checkingAccount.writeCheck(amount: 100)
        XCTAssertNil(check)
    }
    
    func testNewAPIXCTFail() {
        guard #available(macOS 15.0, *) else {
            XCTFail("Only available in macOS 15.0 and above")
            return
        }
    }

    func testNewAPIXCTSkip() throws {
        guard #available(macOS 15.0, *) else {
            throw XCTSkip("Only available in macOS 15.0 and above")
        }
    }
}

BankingTests.defaultTestSuite.run()
