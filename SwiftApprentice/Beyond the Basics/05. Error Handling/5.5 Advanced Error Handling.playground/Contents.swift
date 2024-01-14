import Cocoa

enum Direction {
    case left, right, forward
}

enum PugBotError: Error {
    case invalidMove(found: Direction, expected: Direction)
    case endOfPath
}

class PugBot {
    let name: String
    let correctPath: [Direction]
    private var currentStepInPath = 0

    init(name: String, correctPath: [Direction]) {
        self.correctPath = correctPath
        self.name = name
    }

    func move(_ direction: Direction) throws {
        guard currentStepInPath < correctPath.count else {
            throw PugBotError.endOfPath
        }
        let nextDirection = correctPath[currentStepInPath]
        guard nextDirection == direction else {
            throw PugBotError.invalidMove(found: direction, expected: nextDirection)
        }
        currentStepInPath += 1
    }
  
    func reset() {
        currentStepInPath = 0
    }
}


let pug = PugBot(name: "Pug", correctPath: [.forward, .left, .forward, .right])

func goHome() throws {
    try pug.move(.forward)
    try pug.move(.left)
    try pug.move(.forward)
    try pug.move(.right)
}

do {
    try goHome()
} catch {
    print("PugBot failed to get home.")
}



// 通过捕获异常，处理额外的错误信息。
func moveSafely(_ movement: () throws -> ()) -> String {
    do {
        try movement()
        return "Completed operation successfully."
    } catch PugBotError.invalidMove(let found, let expected) {
        return "The PugBot was supposed to move \(expected), but moved \(found) instead."
    } catch PugBotError.endOfPath {
        return "The PugBot tried to move past the end of the path."
    } 
    // Swift的 do - try - catch  系统不是类型特有的，无法告诉编译器只处理 PugBotError  类型的错误，对编译器来说，这不是详尽的，因为它不能处理它知道的每个可能的错误，所以你仍然需要一个默认情况。
    catch {
        return "An unknown error occurred."
    }
}

pug.reset()
moveSafely(goHome)

pug.reset()
moveSafely {
    try pug.move(.forward)
    try pug.move(.left)
    try pug.move(.forward)
    try pug.move(.right)
}
