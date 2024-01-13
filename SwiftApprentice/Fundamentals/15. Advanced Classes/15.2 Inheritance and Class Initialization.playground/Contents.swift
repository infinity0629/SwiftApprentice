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



/*
 因为Swift要求所有存储的属性都具有初始值，所以子类中的初始化方法必须遵守Swift的两阶段初始化约定。

 第一阶段：从类层次结构的底部到顶部（从子类到父类），初始化类实例中所有存储的属性，只有完成第一阶段后才能使用属性和方法。
 第二阶段：现在才可以使用需要  self  的属性、方法和初始化。
 */
class StudentAthlete: Student {
    var sports: [String]
  
//    'super.init' isn't called on all paths before returning from initializer
//    init(sports: [String]) {
//        self.sports = sports
//    }
    
//    init(firstName: String, lastName: String, sports: [String]) {
//        self.sports = sports
//        super.init(firstName: firstName, lastName: lastName)
//    }
    
    init(firstName: String, lastName: String, sports: [String]) {
        // 第一阶段
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
        // 第二阶段
        let passGrade = Grade(letter: "P", points: 0.0, credits: 0.0)
        recordGrade(passGrade)
    }
}



class StudentRequired {
    let firstName: String
    let lastName: String
    var grades: [Grade] = []

    // 关键字 required ，这个关键字将强制 StudentRequired 的所有子类实现这个初始化方法。
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class StudentAthleteRequired: StudentRequired {
    var sports: [String]
    
    // 在必要初始化式中，不需要 override 关键字，而必须使用 required 关键字来确保 StudentAthleteRequired 的任何子类都实现了这个必要初始化式。
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
    }
}



class StudentConvenience {
    let firstName: String
    let lastName: String
    var grades: [Grade] = []
    
    // 指定初始化方法必须调用其直接超类中的指定初始化方法。
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    // 编译器强制 convenience 初始化方法(直接或间接地)调用非方便初始化方法，而不是自己处理存储属性的初始化。
    //
    // 一个便利初始化式必须调用来自同一类的另一个初始化式。
    // 一个便利初始化式必须最终调用一个指定初始化式。
    convenience init(transfer: Student) {
        self.init(firstName: transfer.firstName, lastName: transfer.lastName)
    }
}
