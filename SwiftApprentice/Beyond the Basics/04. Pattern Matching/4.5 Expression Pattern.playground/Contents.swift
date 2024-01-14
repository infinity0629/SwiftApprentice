import Cocoa

let matched = (1...10 ~= 5)

// 等效上边
if case 1...10 = 5 {
    print("In the range")
}



let list = [0, 1, 2, 3]
let integer = 2

func ~=(pattern: [Int], value: Int) -> Bool {
    
    for i in pattern {
        if i == value {
            return true
        }
    }
  
    return false
}


let isInArray = (list ~= integer)

if case list = integer {
    print("The integer is in the array")
} else {
    print("The integer is not in the array")
}
