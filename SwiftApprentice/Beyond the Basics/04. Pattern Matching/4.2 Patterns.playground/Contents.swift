import Cocoa

let coordinate = (5, 0, 0)
if case (_, 0, 0) = coordinate {
    print("On the x-axis")
}

if case (let x, 0, 0) = coordinate {
    print("On the x-axis at \(x)")
}

if case let (x, y, 0) = coordinate {
    print("On the x-y plane at (\(x), \(y))")
}



enum Direction {
    case north, south, east, west
}

let heading = Direction.north
if case .north = heading {
    print("Don’t forget your jacket")
}

enum Organism {
    case plant
    case animal(legs: Int)
}

let pet = Organism.animal(legs: 4)
switch pet {
case .animal(let legs):
    print("Potentially cuddly with \(legs) legs")
default:
    print("No chance for cuddles")
}


let names = ["Michelle", nil, "Brandon", "Christine", nil, "David"]
for case let name? in names {
    print(name)
}



let response: [Any] = [15, "George", 2.0]
for element in response {
    switch element {
    case is String:
        print("Found a string")
    default:
        print("Found something else")
    }
}

for element in response {
    switch element {
    case let text as String:
        print("Found a string: \(text)")
    default:
        print("Found something else")
    }
}
