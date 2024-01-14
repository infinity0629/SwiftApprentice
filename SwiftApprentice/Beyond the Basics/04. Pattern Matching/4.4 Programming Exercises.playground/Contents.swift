import Cocoa

func fibonacci(position: Int) -> Int {
    switch position {
    case let n where n <= 1:
        return 0
    case 2:
        return 1
    case let n:
        return fibonacci(position: n - 1) + fibonacci(position: n - 2)
    }
}

let fib15 = fibonacci(position: 15)



for i in 1...100 {
    switch (i % 3, i % 5) {
    case (0, 0):
        print("FizzBuzz", terminator: " ")
    case (0, _):
        print("Fizz", terminator: " ")
    case (_, 0):
        print("Buzz", terminator: " ")
    case (_, _):
        print(i, terminator: " ")
    }
}
print("")
