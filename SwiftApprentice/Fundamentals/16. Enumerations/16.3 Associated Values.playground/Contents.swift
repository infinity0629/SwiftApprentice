import Cocoa

enum WithdrawalResult {
    case success(newBalance: Int)
    case error(message: String)
}

var balance = 100

func withdraw(amount: Int) -> WithdrawalResult {
    if amount <= balance {
        balance -= amount
        return .success(newBalance: balance)
    } else {
        return .error(message: "Not enough money!")
    }
}

let result = withdraw(amount: 99)

switch result {
case .success(let newBalance):
    print("Your new balance is: \(newBalance)")
case .error(let message):
    print(message)
}



enum HTTPMethod {
    case get
    case post(body: String)
}

let request = HTTPMethod.post(body: "Hi there")

// 可以在  if case  或  guard case  语句中使用模式匹配
guard case .post(let body) = request else {
    fatalError("No message was posted")
}

print(body)
