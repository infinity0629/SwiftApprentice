import Cocoa

let string = "Matt"
for char in string {
    print(char)
}

let stringLength = string.count

//let fourthChar = string[3] // 'subscript(_:)' is unavailable: cannot subscript String with an Int, use a String.Index instead.



let cafeNormal = "café"
let cafeCombining = "cafe\u{0301}"

cafeNormal.count
cafeCombining.count

cafeNormal.unicodeScalars.count
cafeCombining.unicodeScalars.count

for codePoint in cafeCombining.unicodeScalars {
    print(codePoint.value)
}



let firstIndex = cafeCombining.startIndex
let firstChar = cafeCombining[firstIndex]

//let lastIndex = cafeCombining.endIndex
//let lastChar = cafeCombining[lastIndex] // Fatal error: String index is out of bounds
let lastIndex = cafeCombining.index(before: cafeCombining.endIndex)
let lastChar = cafeCombining[lastIndex]

let fourthIndex = cafeCombining.index(cafeCombining.startIndex, offsetBy: 3)
let fourthChar = cafeCombining[fourthIndex]

fourthChar.unicodeScalars.count
fourthChar.unicodeScalars.forEach { codePoint in
    print(codePoint.value)
}



let equal = cafeNormal == cafeCombining
