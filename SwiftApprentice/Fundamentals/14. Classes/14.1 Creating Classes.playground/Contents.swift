import Cocoa

// 除了默认初始化，类和结构体的初始化规则非常相似，类的初始化方法是标记为  init  的函数，所有存储的属性必须在  init  结尾之前赋初始值。
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

