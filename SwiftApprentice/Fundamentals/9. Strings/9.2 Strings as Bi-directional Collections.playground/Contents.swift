import Cocoa

let name = "Matt"
let backwardsName = name.reversed()
print(backwardsName)

let secondCharIndex = backwardsName.index(backwardsName.startIndex, offsetBy: 1)
let secondChar = backwardsName[secondCharIndex]

let backwardsNameString = String(backwardsName)
