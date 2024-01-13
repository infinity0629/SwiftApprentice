import Cocoa

let testingString1 = "abcdef ABCDEF 12345 abc123 ABC 123 123ABC 123abc abcABC"



let lettersAndNumbers = /[a-z]+[0-9]+/
for match in testingString1.matches(of: lettersAndNumbers) {
    print(String(match.output))
}



// 会匹配所有的可能。（例如：所有的空格。123ABC 中的 123 。都会会匹对出来）
let possibleLettersAndPossibleNumbers = /[a-z]*[0-9]*/
for match in testingString1.matches(of: possibleLettersAndPossibleNumbers) {
    print(String(match.output))
}

let emptyString = ""
let matchCount = emptyString.matches(of: possibleLettersAndPossibleNumbers).count



// 表达式使用了  |  或运算符。它描述了一个或多个字母后面跟着一组数字的模式，或者一组字母后面跟着一个或多个数字。或的任一方都保证至少包含一个字符、一个字母或一个数字。因此这个表达式永远不会匹配任何内容（不包括空格）。
let fixedPossibleLettersAndPossibleNumbers = /[a-z]+[0-9]*|[a-z]*[0-9]+/
for match in testingString1.matches(of: fixedPossibleLettersAndPossibleNumbers) {
    print(String(match.output))
}


// 可以使用  \b  来指定单词边界，这个特殊的描述符可以处理 Unicode 导致的突发情况。(例如：123ABC 中的 123 就不会单独匹对出来)
let fixedWithBoundaries = /\b[a-z]+[0-9]*\b|\b[a-z]*[0-9]+\b/
for match in testingString1.matches(of: fixedWithBoundaries) {
  print(String(match.output))
}
