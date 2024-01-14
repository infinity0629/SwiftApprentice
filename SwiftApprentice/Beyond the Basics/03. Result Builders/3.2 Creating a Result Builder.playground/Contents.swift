import Cocoa

extension NSMutableAttributedString {
    public convenience init(_ string: String) {
      self.init(string: string)
    }
    
    public func color(_ color : NSColor) -> NSMutableAttributedString {
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: 0, length: self.length))
        return self
    }

    public func font(_ font : NSFont) -> NSMutableAttributedString {
        self.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: self.length))
        return self
    }
}

enum SpecialCharacters {
    case lineBreak
    case comma
}

@resultBuilder
enum AttributedStringBuilder {
    
    static func buildBlock(_ components: NSAttributedString...) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        for component in components {
            attributedString.append(component)
        }
        return attributedString
    }
    
    // 处理空逻辑。如果没有无法在构建的时候使用 if 条件。
    static func buildOptional(_ component: NSAttributedString?) -> NSAttributedString {
        component ?? NSAttributedString()
    }

    // 如果没有无法在构建的时候使用 else 条件。
    static func buildEither(first component: NSAttributedString) -> NSAttributedString {
        component
    }
    // 如果没有无法在构建的时候使用 else 条件。
    static func buildEither(second component: NSAttributedString) -> NSAttributedString {
        component
    }
    
    // 如果没有无法在构建的时候使用 for 循环。
    static func buildArray(_ components: [NSAttributedString]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        for component in components {
            attributedString.append(component)
        }
        return attributedString
    }

    // 支持多种数据类型
    static func buildExpression(_ expression: SpecialCharacters) -> NSAttributedString {
        switch expression {
        case .lineBreak:
            return Text("\n")
        case .comma:
            return Text(",")
        }
    }

    static func buildExpression(_ expression: NSAttributedString) -> NSAttributedString {
        expression
    }
}

typealias Text = NSMutableAttributedString

@AttributedStringBuilder
func greetBuilder(name: String, title: String) -> NSAttributedString {
    Text("Hello ")
    Text(name).color(.red)
    if !title.isEmpty {
        Text(", ")
        Text(title).font(.systemFont(ofSize: 20)).color(.blue)
    } else {
        Text(", No title")
    }
}

@AttributedStringBuilder
func greetBuilder(name: String, titles: [String]) -> NSAttributedString {
    Text("Hello ")
    Text(name).color(.red)
    if !titles.isEmpty {
        for title in titles {
//            Text(", ")
            SpecialCharacters.comma
//            Text("\n")
            SpecialCharacters.lineBreak
            Text(title).font(.systemFont(ofSize: 20)).color(.blue)
        }
    } else {
        Text(", No title")
    }
}


greetBuilder(name: "Daenerys", title: "Mother of Dragons")
greetBuilder(name: "Daenerys", title: "")

let titles = ["Khaleesi",
              "Mhysa",
              "First of Her Name",
              "Silver Lady",
              "The Mother of Dragons"
]
greetBuilder(name: "Daenerys", titles: titles)




