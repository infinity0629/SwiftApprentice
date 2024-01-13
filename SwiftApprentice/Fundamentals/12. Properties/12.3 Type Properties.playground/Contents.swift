import Cocoa

struct Level {
    static var highestLevel = 1
    
    let id: Int
    var boss: String
    var unlocked: Bool
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)



//let highestLevel = level3.highestLevel // Static member 'highestLevel' cannot be used on instance of type 'Level'
Level.highestLevel
