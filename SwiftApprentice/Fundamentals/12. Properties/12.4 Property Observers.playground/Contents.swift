import Cocoa

struct Level {
    static var highestLevel = 1
    
    let id: Int
    var boss: String
    
    var unlocked: Bool {
        didSet {
            if unlocked && id > Self.highestLevel {
                Self.highestLevel = id
            }
        }
    }
}



struct LightBulb {
    static let maxCurrent = 40
    
    // 在初始化期间设置属性时，不会调用  willSet  和  didSet  观察器，只有在为完全初始化的实例赋值时才会调用它们，这意味着属性观察器只对可变属性有用，因为常量属性只在初始化期间设置。
    var current = 0 { // didSet 自带 oldValue 参数, willSet 自带 newValue 参数。
        willSet {
            print("newValue: \(newValue)")
        }
        didSet {
            if current > LightBulb.maxCurrent {
                print("""
                      Current is too high,
                      falling back to previous setting.
                      """)
                current = oldValue
            }
        }
    }
}

var light = LightBulb()
light.current = 50
light.current
light.current = 40
light.current
