import Cocoa

class Cat {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Dog {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Keeper<Animal> {
    var name: String
    var morningCare: Animal
    var afternoonCare: Animal

    init(name: String, morningCare: Animal, afternoonCare: Animal) {
        self.name = name
        self.morningCare = morningCare
        self.afternoonCare = afternoonCare
    }
}

let jason = Keeper(name: "Jason", morningCare: Cat(name: "Whiskers"), afternoonCare: Cat(name: "Sleepy"))
