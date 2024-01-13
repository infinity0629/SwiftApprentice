import Cocoa

let a = 5
let b = 5
a == b

let swiftA = "Swift"
let swiftB = "Swift"
swiftA == swiftB

class Record {

    var wins: Int
    var losses: Int

    init(wins: Int, losses: Int) {
        self.wins = wins
        self.losses = losses
    }
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)

//recordA == recordB // Binary operator '==' cannot be applied to two 'Record' operands

extension Record: Equatable {
    static func ==(lhs: Record, rhs: Record) -> Bool {
        lhs.wins == rhs.wins &&
        lhs.losses == rhs.losses
    }
}

recordA == recordB



extension Record: Comparable {
    static func <(lhs: Record, rhs: Record) -> Bool {
        if lhs.wins == rhs.wins {
            return lhs.losses > rhs.losses
        }
        return lhs.wins < rhs.wins
    }
}

let teamA = Record(wins: 14, losses: 11)
let teamB = Record(wins: 23, losses: 8)
let teamC = Record(wins: 23, losses: 9)
var leagueRecords = [teamA, teamB, teamC]

leagueRecords.sort()

leagueRecords.max()
leagueRecords.min()
leagueRecords.starts(with: [teamA, teamC])
leagueRecords.contains(teamA)



class Student {
    let email: String
    let firstName: String
    let lastName: String

    init(email: String, firstName: String, lastName: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Student: Hashable {
    static func ==(lhs: Student, rhs: Student) -> Bool {
        lhs.email == rhs.email &&
        lhs.firstName == rhs.firstName &&
        lhs.lastName == rhs.lastName
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(email)
        hasher.combine(firstName)
        hasher.combine(lastName)
    }
}

let john = Student(email: "johnny.appleseed@apple.com", firstName: "Johnny", lastName: "Appleseed")
let lockerMap = [john: "14B"]



extension Student: Identifiable {
    var id: String {
        email
    }
}



extension Student: CustomStringConvertible {
    var description: String {
        "\(firstName) \(lastName)"
    }
}
print(john)
