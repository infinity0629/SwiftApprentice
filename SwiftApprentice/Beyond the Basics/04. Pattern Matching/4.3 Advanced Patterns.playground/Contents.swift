import Cocoa

for number in 1...9 {
    switch number {
    case let x where x % 2 == 0:
        print("even")
    default:
        print("odd")
    }
}



enum LevelStatus {
    case complete
    case inProgress(percent: Double)
    case notStarted
}

let levels: [LevelStatus] = [.complete, .inProgress(percent: 0.9), .notStarted]

for level in levels {
    switch level {
    case .inProgress(let percent) where percent > 0.8 :
        print("Almost there!")
    case .inProgress(let percent) where percent > 0.5 :
        print("Halfway there!")
    case .inProgress(let percent) where percent > 0.2 :
        print("Made it through the beginning!")
    default:
        break
    }
}



func timeOfDayDescription(hour: Int) -> String {
    switch hour {
    case 0, 1, 2, 3, 4, 5:
        return "Early morning"
    case 6, 7, 8, 9, 10, 11:
        return "Morning"
    case 12, 13, 14, 15, 16:
        return "Afternoon"
    case 17, 18, 19:
        return "Evening"
    case 20, 21, 22, 23:
        return "Late evening"
    default:
        return "INVALID HOUR!"
    }
}

let timeOfDay = timeOfDayDescription(hour: 12)



enum Organism {
    case plant
    case animal(legs: Int)
}

let pet = Organism.animal(legs: 4)
if case .animal(let legs) = pet, case 2...4 = legs {
    print("potentially cuddly")
} else {
    print("no chance for cuddles")
}



enum Number {
    case integerValue(Int)
    case doubleValue(Double)
    case booleanValue(Bool)
}

let a = 5
let b = 6
let c: Number? = .integerValue(7)
let d: Number? = .integerValue(8)

if a != b {
    if let c = c {
        if let d = d {
            if case .integerValue(let cValue) = c {
                if case .integerValue(let dValue) = d {
                    if dValue > cValue {
                        print("a and b are different")
                        print("d is greater than c")
                        print("sum: \(a + b + cValue + dValue)")
                    }
                }
            }
        }
    }
}

if a != b,
   let c,
   let d,
   case .integerValue(let cValue) = c,
   case .integerValue(let dValue) = d,
   dValue > cValue {
    
    print("a and b are different")
    print("d is greater than c")
    print("sum: \(a + b + cValue + dValue)")
}



let name = "Bob"
let age = 23
if case ("Bob", 23) = (name, age) {
    print("Found the right Bob!")
}

var username: String? = "infinity"
var password: String? = "890629"
switch (username, password) {
case let (username?, password?):
    print("Success! User: \(username) Pass: \(password)")
case let (username?, nil):
    print("Password is missing. User: \(username)")
case let (nil, password?):
    print("Username is missing. Pass: \(password)")
case (nil, nil):
    print("Both username and password are missing")
}



for _ in 1...3 {
    print("hi")
}

let user: String? = "Bob"
//guard let _ = user else {
//    print("There is no user.")
//    fatalError()
//}
//guard let user else {
//    print("There is no user.")
//    fatalError()
//}
guard user != nil else {
    print("There is no user.")
    fatalError()
}
print("User exists, but identity not needed.")



struct Rectangle {
    let width: Int
    let height: Int
    let background: String
}

let view = Rectangle(width: 15, height: 60, background: "Green")
switch view {
case _ where view.height < 50:
    print("Shorter than 50 units")
case _ where view.width > 20:
    print("Over 50 tall, & over 20 wide")
case _ where view.background == "Green":
    print("Over 50 tall, at most 20 wide, & green") // Printed!
default:
    print("This view can’t be described by this example")
}
