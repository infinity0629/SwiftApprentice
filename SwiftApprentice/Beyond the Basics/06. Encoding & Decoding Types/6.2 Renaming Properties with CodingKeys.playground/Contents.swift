import Cocoa

struct Toy: Codable {
    var name: String
}

struct Employee: Codable {
    var name: String
    var id: Int
    var favoriteToy: Toy?

    enum CodingKeys: String, CodingKey {
        case id = "employeeId"
        case name
        case favoriteToy
    }
}

let toy1 = Toy(name: "Teddy Bear");
let employee1 = Employee(name: "John Appleseed", id: 7, favoriteToy: toy1)

let jsonEncoder = JSONEncoder()
let jsonData = try jsonEncoder.encode(employee1)
let jsonString = String(data: jsonData, encoding: .utf8)! // id 被 employeeId 替换。
print(jsonString)

let jsonDecoder = JSONDecoder()
let employee2 = try jsonDecoder.decode(Employee.self, from: jsonData) // employeeId 字段映射到 id 属性。
