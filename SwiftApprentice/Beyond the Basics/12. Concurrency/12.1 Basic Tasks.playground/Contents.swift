import Cocoa

Task {
    print("1 - Doing some work on a task")
}
print("1 - Doing some work on the main actor")



Task {
    print("2 - Doing some work on a task")
    let sum = (1...100).reduce(0, +)
    print("2 - 1 + 2 + 3 ... 100 = \(sum)")
}
print("2 - Doing some work on the main actor")



let task = Task {
    print("3 - Doing some work on a task")
    let sum = (1...100).reduce(0, +)
    try Task.checkCancellation()
    print("3 - 1 + 2 + 3 ... 100 = \(sum)")
}
print("3 - Doing some work on the main actor")
task.cancel()



//print("Hello")
//Task.sleep(for: .seconds(1)) // 'async' call in a function that does not support concurrency
//print("Goodbye")

//Task {
//    print("Hello")
//    Task.sleep(for: .seconds(1)) // Call can throw, but it is not marked with 'try' and the error is not handled
//    print("Goodbye")
//}

//Task {
//    print("Hello")
//    try Task.sleep(for: .seconds(1)) // Expression is 'async' but is not marked with 'await'
//    print("Goodbye")
//}

Task {
    print("1- Hello")
    try await Task.sleep(for: .seconds(1))
    print("1- Goodbye")
}

//func helloPauseGoodbye() {
//    print("Hello")
//    try await Task.sleep(for: .seconds(1)) // 'async' call in a function that does not support concurrency
//    print("Goodbye")
//}

func helloPauseGoodbye() async throws {
    print("2- Hello")
    try await Task.sleep(for: .seconds(1))
    print("2- Goodbye")
}

Task {
    try await helloPauseGoodbye()
}
