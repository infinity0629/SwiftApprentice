import Cocoa

func greet(name: String) -> NSAttributedString {
    let attributes = [NSAttributedString.Key.foregroundColor : NSColor.red]
    
//    let message = NSAttributedString(string: "Hello " + name, attributes: attributes)
    let message = NSMutableAttributedString()
    message.append(NSAttributedString(string: "Hello "))
    message.append(NSAttributedString(string: name, attributes: attributes))
    
    let attributes2 = [
        NSAttributedString.Key.font : NSFont.systemFont(ofSize: 20),
        NSAttributedString.Key.foregroundColor : NSColor.blue
    ]
    message.append(NSAttributedString(string: ", Mother of Dragons", attributes: attributes2))
    
    return message
}

greet(name: "Daenerys")
