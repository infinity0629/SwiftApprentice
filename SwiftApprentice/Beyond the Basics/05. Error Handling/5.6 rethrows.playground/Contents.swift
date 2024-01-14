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

// rethrows 的使用场景通常涉及到高阶函数，特别是那些接受函数参数的函数。这使得你能够在一个函数内部调用其他抛出错误的函数，而不必处理这些错误，而是将它们传递给调用者。
// 函数使用 rethrows 来表示它只会重新抛出传递给它的闭包所抛出的错误，而不会抛出自己的错误。
func perform(times: Int, movement: () throws -> ()) rethrows {
    for _ in 1...times {
        try movement()
    }
}

let pug = PugBot(name: "Pug", correctPath: [.forward, .left, .forward, .right])

// 如果你传递给它一个不抛出的闭包，那么对 perform 的调用在那个实例中就不会被认为是可抛出的，因此如果你通过传递一个不抛出的闭包来调用 perform ，你不需要 catch 任何东西。
try? perform(times: 5) {
    try pug.move(.forward)
}

perform(times: 5) {
    pug.reset()
}

