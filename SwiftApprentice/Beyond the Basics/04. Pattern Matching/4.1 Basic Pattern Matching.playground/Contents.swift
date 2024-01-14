import Cocoa

func processIfCase(point: (x: Int, y: Int, z: Int)) -> String {
    if case (0, 0, 0) = point {
        return "At origin"
    }
    return "Not at origin"
}

func processGuardCase(point: (x: Int, y: Int, z: Int)) -> String {
    guard case (0, 0, 0) = point else {
        return "Not at origin"
    }
    return "At origin"
}

func processSwitchCase(point: (x: Int, y: Int, z: Int)) -> String {
    let closeRange = -2...2
    let midRange = -5...5

    switch point {
    case (0, 0, 0):
        return "At origin"
    case (closeRange, closeRange, closeRange):
        return "Very close to origin"
    case (midRange, midRange, midRange):
        return "Nearby origin"
    default:
        return "Not near origin"
    }
}

let point = (x: 0, y: 0, z: 0)
processIfCase(point: point)
processGuardCase(point: point)
processSwitchCase(point: point)



let groupSizes = [1, 5, 4, 6, 2, 1, 3]
for case 1 in groupSizes {
    print("Found an individual")
}
