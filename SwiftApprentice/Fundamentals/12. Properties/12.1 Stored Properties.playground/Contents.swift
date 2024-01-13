import Cocoa

struct Contact {
    var fullName: String
    let emailAddress: String
    
    var relationship = "Friend"
}

var person = Contact(fullName: "Grace Murray", emailAddress: "grace@navy.mil")



person.fullName
person.emailAddress

person.fullName = "Grace Hopper"
person.fullName

//person.emailAddress = "grace@gmail.com" // Cannot assign to property: 'emailAddress' is a 'let' constant



person.relationship

var boss = Contact(fullName: "Ray Wenderlich", emailAddress: "ray@kodeco.com", relationship: "Boss")
