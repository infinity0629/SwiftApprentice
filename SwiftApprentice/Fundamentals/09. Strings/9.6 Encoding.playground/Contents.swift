import Cocoa

let char = "\u{00bd}"
for i in char.utf8 {
    print(i)
}



let characters = "+\u{00bd}\u{21e8}\u{1f643}"
for i in characters.utf8 {
    print("\(i) : \(String(i, radix: 2))") // 同时打印出十进制数和二进制数
}



for i in characters.utf16 {
    print("\(i) : \(String(i, radix: 2))")
}



let arrowIndex = characters.firstIndex(of: "\u{21e8}")!
characters[arrowIndex]

if let unicodeScalarsIndex = arrowIndex.samePosition(in: characters.unicodeScalars) {
    characters.unicodeScalars[unicodeScalarsIndex]
}

if let utf8Index = arrowIndex.samePosition(in: characters.utf8) {
    characters.utf8[utf8Index]
}

if let utf16Index = arrowIndex.samePosition(in: characters.utf16) {
    characters.utf16[utf16Index]
}
