import Cocoa

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}



let john = Person(firstName: "Johnny", lastName: "Appleseed")
var homeOwner = john
john.firstName = "John"
john.firstName
homeOwner.firstName



let imposterJohn = Person(firstName: "Johnny", lastName: "Appleseed")
john === homeOwner
john === imposterJohn
imposterJohn === homeOwner

homeOwner = imposterJohn
john === homeOwner

homeOwner = john
john === homeOwner



var imposters = (0...100).map { _ in
    Person(firstName: "John", lastName: "Appleseed")
}

imposters.contains {
    $0.firstName == john.firstName && $0.lastName == john.lastName
}

imposters.contains {
    $0 === john
}

imposters.insert(john, at: Int.random(in: 0..<100))
imposters.contains {
    $0 === john
}

if let indexOfJohn = imposters.firstIndex(where:{ $0 === john }) {
    imposters[indexOfJohn].lastName = "Bananapeel"
}
john.fullName



struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    // recordGrade(_:)  可以通过在末尾添加更多的值来改变数组  grades 。关键字  mutating  是不需要的，因为它改变的是底层对象，而不是引用本身。
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
var history = Grade(letter: "B", points: 9.0, credits: 3.0)
var math = Grade(letter: "A", points: 16.0, credits: 4.0)

jane.recordGrade(history)
jane.recordGrade(math)



//jane = Student(firstName: "John", lastName: "Appleseed") // Cannot assign to value: 'jane' is a 'let' constant

// jane 是类实例。虽然初始化是 let 的，但依然可以直接修改实例里的属性（结构体不行）。
jane.firstName = "Johnny"

