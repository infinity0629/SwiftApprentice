import Cocoa

let evenNumbers = [2, 4, 6, 8]
var subscribers: [String] = []
let allZeros = Array(repeating: 0, count: 5)
let vowels = ["A", "E", "I", "O", "U"]



var players = ["Alice", "Bob", "Cindy", "Dan"]
print(players.isEmpty)

if players.count < 2 {
    print("We need at least two players!")
} else {
    print("Let’s start!")
}

var currentPlayer = players.first
print(currentPlayer as Any)
print(players.last as Any)

currentPlayer = players.min()
print(currentPlayer as Any)

print([2, 3, 1].first as Any)
print([2, 3, 1].min() as Any)

if let currentPlayer {
    print("\(currentPlayer) will start")
}



var firstPlayer = players[0]
print("First player is \(firstPlayer)")
//var player = players[4] // Fatal error: Index out of range



let upcomingPlayersSlice = players[1...2]
print(upcomingPlayersSlice[1], upcomingPlayersSlice[2]) // Slice 和 Array 共享内存（注意索引相同）

let upcomingPlayersArray = Array(players[1...2])
print(upcomingPlayersArray[0], upcomingPlayersArray[1])



func isEliminated(player: String) -> Bool {
    !players.contains(player)
}
print(isEliminated(player: "Bob"))
players[1...3].contains("Bob")



players.append("Eli")
players += ["Gina"]
print(players)

players.insert("Frank", at: 5)

var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed")

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed")



print(players)
players[4] = "Franklin"
print(players)

players[0...1] = ["Donna", "Craig", "Brian", "Anna"]
print(players)



let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players)

players.swapAt(1, 3)
print(players)

players.sort()
print(players)



let scores = [2, 2, 8, 6, 1, 2, 1]

for player in players {
    print(player)
}

for (index, player) in players.enumerated() {
    print("\(index + 1). \(player)")
}

func sumOfElements(in array: [Int]) -> Int {
    var sum = 0
    for number in array {
        sum += number
    }
    return sum
}
print(sumOfElements(in: scores))




