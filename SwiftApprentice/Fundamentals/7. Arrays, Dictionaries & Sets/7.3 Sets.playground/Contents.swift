import Cocoa

let setOne: Set<Int> = [1]



let someArray = [1, 2, 3, 1]
var explicitSet: Set<Int> = [1, 2, 3, 1]
var someSet = Set([1, 2, 3, 1])
print(someSet)



print(someSet.contains(1))
print(someSet.contains(4))



someSet.insert(5)
let removedElement = someSet.remove(1)
print(removedElement!)
