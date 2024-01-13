import Cocoa

func guardMyCastle(name: String?) {
    
    guard let castleName = name else {
        print("No castle!")
        return
    }

    print("Your castle called \(castleName) was guarded!")
}



func calculateNumberOfSides(shape: String) -> Int? {
    switch shape {
    case "Triangle":
        return 3
    case "Square":
        return 4
    case "Rectangle":
        return 4
    case "Pentagon":
        return 5
    case "Hexagon":
        return 6
    default:
        return nil
    }
}

//func maybePrintSides(shape: String) {
//    let sides = calculateNumberOfSides(shape: shape)
//
//    if let sides = sides {
//        print("A \(shape) has \(sides) sides.")
//    } else {
//        print("I don’t know the number of sides for \(shape).")
//    }
//}
func maybePrintSides(shape: String) {
    
    guard let sides = calculateNumberOfSides(shape: shape) else {
        print("I don’t know the number of sides for \(shape).")
        return
    }

    print("A \(shape) has \(sides) sides.")
}
