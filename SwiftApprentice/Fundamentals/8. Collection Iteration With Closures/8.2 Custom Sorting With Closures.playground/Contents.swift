import Cocoa

let names = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]

/**
 sorted 不会改变原数组。返回一个新的数组。
 sort 会改变原数组。
 */

names.sorted()

names.sorted {
    $0.count > $1.count
}

