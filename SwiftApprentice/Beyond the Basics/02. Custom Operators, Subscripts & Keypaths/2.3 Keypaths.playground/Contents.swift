import Cocoa

class Person {
    let name: String
    let age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Tutorial {
    let title: String
    let author: Person
    let details: (type: String, category: String)
  
    init(title: String, author: Person, details: (type: String, category: String)) {
        self.title = title
        self.author = author
        self.details = details
    }
}

let me = Person(name: "Ehab", age: 37)
let tutorial = Tutorial(title: "Object Oriented Programming in Swift", author: me, details: (type: "Swift", category: "iOS"))

let title = \Tutorial.title
let tutorialTitle = tutorial[keyPath: title]

let authorName = \Tutorial.author.name
var tutorialAuthor = tutorial[keyPath: authorName]

let type = \Tutorial.details.type
let tutorialType = tutorial[keyPath: type]
let category = \Tutorial.details.category
let tutorialCategory = tutorial[keyPath: category]

let authorPath = \Tutorial.author
let authorNamePath = authorPath.appending(path: \.name)
tutorialAuthor = tutorial[keyPath: authorNamePath]



class Jukebox {
    var song: String
  
    init(song: String) {
        self.song = song
    }
}

let jukebox = Jukebox(song: "Nothing Else Matters")
let song = \Jukebox.song
jukebox[keyPath: song] = "Stairway to Heaven"



struct Point {
    let x, y: Int
}

@dynamicMemberLookup
struct Circle {
    let center: Point
    let radius: Int
  
    subscript(dynamicMember keyPath: KeyPath<Point, Int>) -> Int {
        center[keyPath: keyPath]
    }
}

let center = Point(x: 1, y: 2)
let circle = Circle(center: center, radius: 1)
circle.x
circle.y



let anotherTutorial = Tutorial(title: "Encoding and Decoding in Swift", author: me, details: (type: "Swift", category: "iOS"))
let tutorials = [tutorial, anotherTutorial]
let titles = tutorials.map(\.title)
