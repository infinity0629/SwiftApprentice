import Cocoa

var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores)
namesAndScores = [:]

var pairs: [String: Int] = [:]
pairs.reserveCapacity(20) // 当知道字典需要存储多少数据时，调用 pairs.reserveCapacity(_:)  是提高性能的简单方法，你可以向字典中添加条目，只要计数低于字典的容量，就不会发生昂贵的内存重新分配。



namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores["Anna"]!)

namesAndScores["Greg"]



namesAndScores.isEmpty
namesAndScores.count



var bobData = [
    "name": "Bob",
    "profession": "Card Player",
    "country": "USA"
]

bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"



// updateValue(_:forKey:)  将给定键的值替换为新值并返回旧值，如果键不存在，该方法将添加一个新对并返回 nil 。
bobData.updateValue("Bobby", forKey: "name")
bobData["profession"] = "Mailman"



// 注意：如果你使用的是带有可选类型值的字典， dictionary[key] = nil  仍然会完全删除键，如果你想保留键并将其值设置为  nil, ，你必须使用  updateValue  方法。
bobData.removeValue(forKey: "state")
bobData["city"] = nil



for (player, score) in namesAndScores {
    print("\(player) - \(score)")
}

for player in namesAndScores.keys {
    print("\(player), ", terminator: "")
}
print("")
