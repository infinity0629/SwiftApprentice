import Cocoa

struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    var credits = 0.0

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func recordGrade(_ grade: Grade) {
        grades.append(grade)
        credits += grade.credits
    }
}



extension Student {
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
