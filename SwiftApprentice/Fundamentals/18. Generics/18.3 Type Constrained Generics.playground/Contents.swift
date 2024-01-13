import Cocoa

protocol Pet {
    var name: String { get }
}

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

extension Cat: Pet {}
extension Dog: Pet {}



//func callForDinner<Animal>(_ pet: Animal) {
//    print("Here \(pet.name)-\(pet.name)! Dinner time!") // Value of type 'Animal' has no member 'name'
//}
func callForDinner1<Animal: Pet>(_ pet: Animal) {
    print("Here \(pet.name)-\(pet.name)! Dinner time!")
}

// 首选方法
func callForDinner2(_ pet: some Pet) {
    print("Here \(pet.name)-\(pet.name)! Dinner time!")
}

// where 也可以实现条件约束，但是 不适合在函数里。更适合在扩展里。
func callForDinner3<Animal>(_ pet: Animal) where Animal: Pet {
  print("Here \(pet.name)-\(pet.name)! Dinner time!")
}



// 扩展里使用 where 添加约束
extension Array where Element: Cat {
    func meow() {
        forEach { print("\($0.name) says meow!") }
    }
}

protocol Meowable {
    func meow()
}

extension Cat: Meowable {
    func meow() {
        print("\(self.name) says meow!")
    }
}

extension Array: Meowable where Element: Meowable {
  func meow() {
      forEach { $0.meow() }
  }
}



let lost: [any Pet] = [Cat(name: "Whiskers"), Dog(name: "Hachiko")]

func findLostCat(name: String) -> Cat? {
    lost.lazy.compactMap {
        $0 as? Cat
    }.first {
        $0.name == name
    }
}

func findLostDog(name: String) -> Dog? {
  lost.lazy.compactMap {
      $0 as? Dog
  }.first {
      $0.name == name
  }
}

func findLostPet(name: String) -> (any Pet)? {
    lost.first { $0.name == name}
}

func findLost<Animal: Pet>(_ petType: Animal.Type, name: String) -> (some Pet)? {
    lost.lazy.compactMap {
        $0 as? Animal
    }.first {
        $0.name == name
    }
}
findLost(Cat.self, name: "Whiskers")
findLost(Dog.self, name: "Hachiko")

func findLostReturnAnimal<Animal: Pet>(_ petType: Animal.Type, name: String) -> Animal? {
    lost.lazy.compactMap {
        $0 as? Animal
    }.first {
        $0.name == name
    }
}
findLostReturnAnimal(Cat.self, name: "Whiskers")?.meow()
//findLostReturnAnimal(Dog.self, name: "Hachiko")?.meow() // Value of type 'Dog' has no member 'meow'
