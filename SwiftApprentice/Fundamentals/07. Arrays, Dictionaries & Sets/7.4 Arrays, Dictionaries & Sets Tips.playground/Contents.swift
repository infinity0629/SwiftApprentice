import Cocoa

var declareArray: [Int]
var declareSet: Set<Int>
var declareDictionary: [String: String]

var emptyArray = [Int]()
var emptySet = Set<Int>()
var emptyDictionary = [String: String]()

var literalArray = [1, 2, 3]
var literalSet: Set = [1, 2, 3]
var literalDictionary = ["one": "1", "two": "2", "three": "3"]



var arrayToSet = Set(literalArray)
var setToArray = [Int](literalSet)

var keysArray = [String](literalDictionary.keys)
var valuesArray = [String](literalDictionary.values)
