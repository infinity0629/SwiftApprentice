import Cocoa

let fullName = "Matt Galloway"
let spaceIndex = fullName.firstIndex(of: " ")!
let firstName = fullName[fullName.startIndex..<spaceIndex]
let lastName = fullName[fullName.index(after: spaceIndex)...]
print(type(of: firstName), type(of: lastName))

let lastNameString = String(lastName)
