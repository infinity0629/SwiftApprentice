import Cocoa

var result: Int? = 30
print(result)



//print(result + 1) // Value of optional type 'Int?' must be unwrapped to a value of type 'Int'



var authorName: String? = "Matt Galloway"
var authorAge: Int? = 30
var unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)")
authorName = nil
//print("Author is \(authorName!)") // Fatal error: Unexpectedly found nil while unwrapping an Optional value
if authorName != nil {
    print("Author is \(authorName!)")
} else {
    print("No author.")
}



if let unwrappedAuthorName = authorName {
    print("Author is \(unwrappedAuthorName)")
} else {
    print("No author.")
}

if let authorName = authorName {
    print("Author is \(authorName)")
} else {
    print("No author.")
}

if let authorName = authorName, let authorAge = authorAge {
    print("The author is \(authorName) who is \(authorAge) years old.")
} else {
    print("No author or no age.")
}

if let authorName = authorName, let authorAge = authorAge, authorAge >= 40 {
    print("The author is \(authorName) who is \(authorAge) years old.")
} else {
    print("No author or no age or age less than 40.")
}



//if let authorName = authorName {
//    print("The author is \(authorName)")
//}
if let authorName {
    print("The author is \(authorName)")
}

if let authorName, let authorAge {
    print("The author is \(authorName) who is \(authorAge) years old.")
}
