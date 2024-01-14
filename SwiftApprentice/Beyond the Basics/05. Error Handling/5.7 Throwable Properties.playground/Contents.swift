import Cocoa

class Person {
    var name: String
    var age: Int
  
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

enum PersonError: Error {
    case noName, noAge, noData
}

extension Person {
    var description: String {
        get throws {
            guard !name.isEmpty else {throw PersonError.noName}
            guard age > 0 else {throw PersonError.noAge}
            return "\(name) is \(age) years old."
        }
    }
}

let me = Person(name: "Alice", age: 32)

me.name = ""
do {
    try me.description
} catch {
    print(error)
}

me.age = -36
do {
    try me.description
} catch {
    print(error)
}

me.name = "Alice"
do {
    try me.description
} catch {
    print(error)
}

me.age = 36
do {
    try me.description
} catch {
    print(error)
}
