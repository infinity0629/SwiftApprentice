import Cocoa

/*
 weak
 不能将弱引用定义为常量（let），因为在运行时，当底层对象释放时，它将更改为 nil 。
 
 unowned
 1、还有另一种方法来打破引用循环：无主引用，它们的行为类似于弱引用，因为它们不会改变对象的引用计数。
 2、与弱引用不同，它们总是期望有一个值。(不能把它们声明为可选的。)
 3、使用 unowned  会带来一些危险，这和使用隐式展开的可选对象或使用 try!  的危险是一样的，也就是说，如果 unowned 属性引用的对象被deallocated，那么访问该属性将导致程序崩溃，因此，只有在你确定对象是活动的时才使用这些属性。
 */

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
}
