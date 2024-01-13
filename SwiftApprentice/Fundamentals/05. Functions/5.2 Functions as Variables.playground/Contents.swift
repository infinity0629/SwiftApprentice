import Cocoa

func add(_ a: Int, _ b: Int) -> Int {
    a + b
}

var function = add
function(4, 2)



func subtract(_ a: Int, _ b: Int) -> Int {
    a - b
}

function = subtract
function(4, 2)



func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}

printResult(add, 4, 2)



//func noReturn() -> Never {
//
//} // Global function with uninhabited return type 'Never' is missing call to another never-returning function on all paths
func infiniteLoop() -> Never {
    while true {
        
    }
}
