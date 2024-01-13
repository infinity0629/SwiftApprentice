import Cocoa

let characterA: Character = "a"
let characterDog: Character = "🐶"

//let stringDog: String = "Dog"
let stringDog = "Dog"



var message = "Hello" + " my name is "
let name = "Matt"
message += name

let exclamationMark: Character = "!"
message += String(exclamationMark)



message = "Hello my name is \(name)!"

let oneThird = 1.0 / 3.0
let oneThirdLongString = "One third is \(oneThird) as a decimal."


/**
 Swift 会查看最后三个双引号行中前导空格的数量，以此作为基准，Swift 要求其上的所有行至少有这么多空格，这样它才能从每行中去掉空格，这个规则让你在不影响输出的情况下用漂亮的缩进格式化代码。
 */
let bigString = """
  You can have a string
  that contains multiple
  lines
  by
  doing this.
  """
print(bigString)
