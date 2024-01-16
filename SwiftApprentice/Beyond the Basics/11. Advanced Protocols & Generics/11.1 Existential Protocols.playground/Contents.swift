import Cocoa

protocol Pet {
    var name: String { get }
}

struct Cat: Pet {
    var name: String
}

/*
 定义变量 pet ，类型是 any Pet  ，而不是具体的类型 Cat  。
 这里的 any Pet  是一个存在类型或盒类型（它是一个抽象概念，一个协议，它引用了一个具体的类型，比如结构体，它确实存在。编译器会自动创建一个盒类型，并在其中连接一个具体的类型。）
 
 注意：严格来说，对于没有关联类型的简单协议，你不需要在协议前使用 any 关键字。然而，在未来的Swift版本中，写 any 的需要可能会改变，并成为必需的。any  清楚地表明你正在通过编译器生成的盒类型来访问具体类型，这需要付出少量但非零的代价。
 */
var pet: any Pet = Cat(name: "Kitty")
