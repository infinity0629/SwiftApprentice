import Cocoa

struct Toy: Codable {
    var name: String
}

struct Employee {
    var name: String
    var id: Int
    var favoriteToy: Toy?

    enum CodingKeys: String, CodingKey {
        case id = "employeeId"
        case name
        case gift
    }
}

extension Employee: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
//        try container.encode(favoriteToy?.name, forKey: .gift)
        // 处理字段可能为空的情况
        try container.encodeIfPresent(favoriteToy?.name, forKey: .gift)
    }
}

extension Employee: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
//        if let gift = try values.decode(String?.self, forKey: .gift) {
//            favoriteToy = Toy(name: gift)
//        }
        // 处理字段可能为空的情况
        if let gift = try values.decodeIfPresent(String.self, forKey: .gift) {
            favoriteToy = Toy(name: gift)
        }
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
