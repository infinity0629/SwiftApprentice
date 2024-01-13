import Cocoa

//let coordinates: (Int, Int) = (2, 3)
let coordinates = (2, 3)
print(type(of: coordinates))
let coordinatesDoubles = (2.1, 3.5)
print(type(of: coordinatesDoubles))
let coordinatesMixed = (2.1, 3)
print(type(of: coordinatesMixed))



let x1 = coordinates.0
let y1 = coordinates.1

let coordinatesNamed = (x: 2, y: 3)
let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y



let coordinates3D = (x: 2, y: 3, z: 1)
//let x3 = coordinates3D.x
//let y3 = coordinates3D.y
//let z3 = coordinates3D.z
let (x3, y3, z3) = coordinates3D
print(x3, y3, z3)

let (x4, y4, _) = coordinates3D
print(x4, y4)
