import Cocoa

class Person {
    let name: String
    let age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person {
//    subscript(key: String) -> String? {
//        switch key {
//        case "name": return name
//        case "age": return "\(age)"
//        default: return nil
//        }
//    }
    
    subscript(key key: String) -> String? {
        switch key {
        case "name": return name
        case "age": return "\(age)"
        default: return nil
        }
    }
}


let me = Person(name: "Ehab", age: 37)

//me["name"]
//me["age"]
//me["gender"]

me[key: "name"]
me[key: "age"]
me[key: "gender"]



class File {
    let name: String
  
    init(name: String) {
        self.name = name
    }
  
    static subscript(key: String) -> String {
        switch key {
        case "path": return "custom path"
        default: return "default path"
        }
    }
}

File["path"]
File["PATH"]



@dynamicMemberLookup
class Instrument {
    let brand: String
    let year: Int
    private let details: [String: String]
  
    init(brand: String, year: Int, details: [String: String]) {
        self.brand = brand
        self.year = year
        self.details = details
    }
  
    
    subscript(dynamicMember key: String) -> String {
        switch key {
        case "info": return "\(brand) made in \(year)."
        default: return details[key] ?? ""
        }
    }
}

let instrument = Instrument(brand: "Roland", year: 2021, details: ["type": "acoustic", "pitch": "C"])
instrument.info
instrument.pitch
instrument.brand
instrument.year

class Guitar: Instrument {
    
}

let guitar = Guitar(brand: "Fender", year: 2021, details: ["type": "electric", "pitch": "C"])
guitar.info



@dynamicMemberLookup
class Folder {
    let name: String
  
    init(name: String) {
        self.name = name
    }
  
    class subscript(dynamicMember key: String) -> String {
        switch key {
        case "path": return "custom path"
        default: return "default path"
        }
    }
}

Folder.path
Folder.PATH
