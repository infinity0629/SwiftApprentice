import Cocoa

struct Circle {
    // lazy 属性必须是一个变量，用  var  定义，而不是用  let  定义的常量. 当你第一次初始化这个结构时， 这个属性实际上没有值. 然后当你的代码的某些部分请求这个属性时， 它的值将被计算. 所以即使值只改变一次， 你仍然使用  var .
    lazy var pi = {
        print("pi pi pi ...")
        return ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
    }()
    
    var radius = 0.0
    
    var circumference: Double {
        // 由于 pi 的值改变了，所以 circumference 的getter必须被标记为 mutating 。访问 pi 的值会改变结构的值。
        mutating get {
            pi * radius * 2
        }
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

var circle = Circle(radius: 5)

circle.circumference

