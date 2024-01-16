import Cocoa

protocol WinLoss {
    var wins: Int { get }
    var losses: Int { get }
}

extension WinLoss {
    // 1
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses)
    }
}

struct CricketRecord: WinLoss {
    var wins: Int
    var losses: Int
    var draws: Int

    // 2
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses + draws)
    }
}



let miamiTuples = CricketRecord(wins: 8, losses: 7, draws: 1)
let winLoss: WinLoss = miamiTuples
miamiTuples.winningPercentage // 调用”覆盖默认实现后“的结果 2
winLoss.winningPercentage // 调用”默认实现“的结果 1
