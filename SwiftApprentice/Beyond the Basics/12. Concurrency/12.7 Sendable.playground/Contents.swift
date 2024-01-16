import Cocoa

// 类通常不是  Sendable  ，因为它们是引用类型。
final class BasicPlaylist {
    let title: String
    let author: String

    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
}

extension BasicPlaylist: Sendable {}



func execute(task: @escaping @Sendable () -> Void, with priority: TaskPriority? = nil) {
    Task(priority: priority, operation: task)
}

@Sendable func showRandomNumber() {
    let number = Int.random(in: 1...10)
    print(number)
}

execute(task: showRandomNumber)
