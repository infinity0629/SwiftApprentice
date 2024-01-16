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
}



struct BaseballRecord: TeamRecord {
    var wins: Int
    var losses: Int

    var winningPercentage: Double {
        Double(wins) / Double(wins + losses)
    }
}

let sanFranciscoSwifts = BaseballRecord(wins: 10, losses: 5)
sanFranciscoSwifts.gamesPlayed
