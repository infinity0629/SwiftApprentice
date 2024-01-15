import Cocoa

class Tutorial {
    let title: String
    weak var editor: Editor?
    unowned let author: Author
    
    init(title: String, author: Author) {
        self.title = title
        self.author = author
    }

    deinit {
        print("Goodbye tutorial \(title)!")
    }
    
//    lazy var description: () -> String = {
//        "\(self.title) by \(self.author.name)"
//    }
    
//    lazy var description: () -> String = { [unowned self] in
//        "\(self.title) by \(self.author.name)"
//    }
    
//    lazy var description: () -> String = { [weak self] in
//        "\(self?.title) by \(self?.author.name)"
//    }
    
    lazy var description: () -> String = { [weak self] in
        guard let self else {
            return "The tutorial is no longer available."
        }
        return "\(self.title) by \(self.author.name)"
    }
}

class Editor {
    let name: String
    var tutorials: [Tutorial] = []

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Goodbye editor \(name)!")
    }
}

class Author {
    let name: String
    var tutorials: [Tutorial] = []

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Goodbye author \(name)!")
    }
}

do {
    let author = Author(name: "Alice")
    let tutorial = Tutorial(title: "Memory Management", author: author)
    let editor = Editor(name: "Ray")
    author.tutorials.append(tutorial)
    tutorial.editor = editor
    editor.tutorials.append(tutorial)
    
    print(tutorial.description())
}



var counter = 0
var fooClosure = {
    print(counter)
}
counter = 1
fooClosure()

counter = 0
fooClosure = { [c = counter] in
  print(c)
}
counter = 1
fooClosure()

counter = 0
fooClosure = { [counter] in
  print(counter)
}
counter = 1
fooClosure()



let tutorialDescription: () -> String
do {
    let author = Author(name: "Alice")
    let tutorial = Tutorial(title: "Memory Management", author: author)
    tutorialDescription = tutorial.description
}
print(tutorialDescription())

/*
 tutorial  和  author  在  do {}  作用域的末尾被释放。
 
 使用 [unowned self] ：导致崩溃。
 使用 [weak self] ：不会崩溃，但会有 nil 等奇怪的输出。
 
 最终需要在闭包内在添加一个强引用 self（使用一个 guard 来展开弱可选的 self）。这样一来 self 被保证一直存在到闭包结束。
 */



class Calculator {
    let values: [Int]

    init(values: [Int]) {
        self.values = values
    }

    func add() -> Int {
        values.reduce(into: 0) { $0 += $1 }
    }
    
    func multiply() -> Int {
        values.reduce(into: 1) { $0 *= $1 }
    }

//    func calculate() {
//        let closure = {
//            let add = add() // Call to method 'add' in closure requires explicit use of 'self' to make capture semantics explicit
//            print("Values added = \(add)")
//            let multiply = multiply() // Call to method 'multiply' in closure requires explicit use of 'self' to make capture semantics explicit
//            print("Values multiplied = \(multiply)")
//        }
//        closure()
//    }
    
    func calculate() {
//        let closure = {
//            let add = self.add()
//            print("Values added = \(add)")
//            let multiply = self.multiply()
//            print("Values multiplied = \(multiply)")
//        }
        
        // 更推荐
        let closure = { [self] in
            let add = add()
            print("Values added = \(add)")
            let multiply = multiply()
            print("Values multiplied = \(multiply)")
        }
        closure()
    }
}

struct CalculatorStruct {
    let values: [Int]

    init(values: [Int]) {
        self.values = values
    }

    func add() -> Int {
        values.reduce(into: 0) { $0 += $1 }
    }
    
    func multiply() -> Int {
        values.reduce(into: 1) { $0 *= $1 }
    }

    func calculate() {
        let closure = {
            let add = add()
            print("Values added = \(add)")
            let multiply = multiply()
            print("Values multiplied = \(multiply)")
        }
        closure()
    }
}



final class FunctionKeeper {
    private let function: () -> Void

    init(function: @escaping () -> Void) {
        self.function = function
    }

    func run() {
        function()
    }
}

let name = "Alice"
let f = FunctionKeeper {
    print("Hello, \(name)")
}
f.run()
