import Cocoa

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Student: Person {
    var grades: [Grade] = []

    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")
john.firstName
jane.firstName



class BandMember: Student {
    var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
    override var minimumPracticeTime: Int {
        get {
            super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}



func phonebookName(_ person: Person) -> String {
    "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Johnny", lastName: "Appleseed")
let oboePlayer = OboePlayer(firstName: "Jane", lastName: "Appleseed")
phonebookName(person)
phonebookName(oboePlayer)



var hallMonitor = Student(firstName: "Jill", lastName: "Bananapeel")
hallMonitor = oboePlayer

// 这个赋值是有效的，因为  hallMonitor  是一个  Student  ，但是编译器不允许你在  hallMonitor  实例中使用更高级派生类型  OboePlayer  的属性或方法。
//hallMonitor.minimumPracticeTime // Value of type 'Student' has no member 'minimumPracticeTime'



/*
 as  类型转换操作符
 
 as ： 在编译时成功地强制转换为已知的类型，例如强制转换为超类型。
 as? ： 可选的下拉转换(到子类型)，如果下拉失败，表达式的结果将是  nil 。
 as! ：强制向下强制转换。如果向下强制转换失败，程序将停止执行。很少使用，只有当你确定强制转换总是成功时才使用。
 */

/*
 使用 as? as! 向下转换。
 */
hallMonitor as? BandMember
(hallMonitor as? BandMember)?.minimumPracticeTime
hallMonitor as! BandMember
(hallMonitor as! BandMember).minimumPracticeTime

if let hallMonitor = hallMonitor as? BandMember {
    print("This hall monitor is a band member and practices at least \(hallMonitor.minimumPracticeTime) hours per week.")
}

/*
 使用 as 向上转换。
 */
oboePlayer as Student
//(oboePlayer as Student).minimumPracticeTime // Value of type 'Student' has no member 'minimumPracticeTime'

func afterClassActivity(for student: Student) -> String {
    "Goes home!"
}

func afterClassActivity(for student: BandMember) -> String {
    "Goes to practice!"
}

afterClassActivity(for: oboePlayer)
afterClassActivity(for: oboePlayer as Student)



class StudentAthlete: Student {
    var failedClasses: [Grade] = []

    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade)

        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }

    var isEligible: Bool {
        failedClasses.count < 3
    }
}



final class FinalStudent: Person {}
//class FinalStudentAthlete: FinalStudent {} // Inheritance from a final class 'FinalStudent'

class AnotherStudent: Person {
    final func recordGrade(_ grade: Grade) {}
}
class AnotherStudentAthlete: AnotherStudent {
//    override func recordGrade(_ grade: Grade) {} // Instance method overrides a 'final' instance method
}

