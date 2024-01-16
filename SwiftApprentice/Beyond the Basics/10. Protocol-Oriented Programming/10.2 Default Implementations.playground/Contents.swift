import Cocoa

protocol TeamRecord {
    var wins: Int { get }
    var losses: Int { get }
    var winningPercentage: Double { get }
}

extension TeamRecord {
    // 协议扩展（”不“声明在 protocol 内，而是直接声明并定义在 extesion 里。）
    var gamesPlayed: Int {
        wins + losses
    }
    
    // 默认实现（声明在 protocol 内，定义在 extesion 里。）
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses)
    }
}



struct BasketballRecord: TeamRecord {
    var wins: Int
    var losses: Int
    let seasonLength = 82
}

let minneapolisFunctors = BasketballRecord(wins: 60, losses: 22)
minneapolisFunctors.winningPercentage



struct HockeyRecord: TeamRecord {
    var wins: Int
    var losses: Int
    var ties: Int

    // 覆盖默认实现
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses + ties)
    }
}

let chicagoOptionals = BasketballRecord(wins: 10, losses: 6)
let phoenixStridables = HockeyRecord(wins: 8, losses: 7, ties: 1)
chicagoOptionals.winningPercentage
phoenixStridables.winningPercentage
