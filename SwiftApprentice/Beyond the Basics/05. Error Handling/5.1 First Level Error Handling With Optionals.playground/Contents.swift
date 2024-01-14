import Cocoa

let value = Int("3")
let failedValue = Int("nope")



enum PetFood: String {
    case kibble, canned
}

let morning = PetFood(rawValue: "kibble")
let snack = PetFood(rawValue: "fuuud!")



struct PetHouse {
    let squareFeet: Int
  
    init?(squareFeetAsString: String) {
        guard let squareFeet = Int(squareFeetAsString) else {
            return nil
        }
        self.squareFeet = squareFeet
    }
}

let nopeHouse = PetHouse(squareFeetAsString: "nope")
let house = PetHouse(squareFeetAsString: "100")



class Toy {

    enum Kind {
        case ball, zombie, bone, mouse
    }

    enum Sound {
        case squeak, bell
    }

    let kind: Kind
    let color: String
    var sound: Sound?

    init(kind: Kind, color: String, sound: Sound? = nil) {
        self.kind = kind
        self.color = color
        self.sound = sound
    }
}

class Pet {

    enum Kind {
        case dog, cat, guineaPig
    }

    let name: String
    let kind: Kind
    let favoriteToy: Toy?

    init(name: String, kind: Kind, favoriteToy: Toy? = nil) {
        self.name = name
        self.kind = kind
        self.favoriteToy = favoriteToy
    }
}

class Person {
    let pet: Pet?

    init(pet: Pet? = nil) {
        self.pet = pet
    }
}

let janie = Person(pet: Pet(name: "Delia", kind: .dog, favoriteToy: Toy(kind: .ball, color: "Purple", sound: .bell)))
let tammy = Person(pet: Pet(name: "Evil Cat Overlord", kind: .cat, favoriteToy: Toy(kind: .mouse, color: "Orange")))
let felipe = Person()



if let sound = janie.pet?.favoriteToy?.sound {
    print("Sound \(sound).")
} else {
    print("No sound.")
}

if let sound = tammy.pet?.favoriteToy?.sound {
    print("Sound \(sound).")
} else {
    print("No sound.")
}

if let sound = felipe.pet?.favoriteToy?.sound {
    print("Sound \(sound).")
} else {
    print("No sound.")
}



let team = [janie, tammy, felipe]

let petNames = team.map { $0.pet?.name }
for pet in petNames {
    print(pet)
}

let betterPetNames = team.compactMap { $0.pet?.name }
for pet in betterPetNames {
    print(pet)
}
