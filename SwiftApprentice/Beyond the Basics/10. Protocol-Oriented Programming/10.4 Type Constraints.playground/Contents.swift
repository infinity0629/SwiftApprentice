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

// 使用配型约束，通过”组合“的方式，实现额外的功能。
protocol PostSeasonEligible {
    var minimumWinsForPlayoffs: Int { get }
}

extension TeamRecord where Self: PostSeasonEligible {
    var isPlayoffEligible: Bool {
        wins > minimumWinsForPlayoffs
    }
}

protocol Tieable {
    var ties: Int { get }
}

extension TeamRecord where Self: Tieable {
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses + ties)
    }
}



struct RugbyRecord: TeamRecord, Tieable {
    var wins: Int
    var losses: Int
    var ties: Int
}

let rugbyRecord = RugbyRecord(wins: 8, losses: 7, ties: 1)
rugbyRecord.winningPercentage

