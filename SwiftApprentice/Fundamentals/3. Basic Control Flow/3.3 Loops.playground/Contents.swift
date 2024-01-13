import Cocoa

var sum = 1
while sum < 1000 {
    sum = sum + (sum + 1)
}


sum = 1
repeat {
    sum = sum + (sum + 1)
} while sum < 1000


sum = 1
while true {
    sum = sum + (sum + 1)
    if sum >= 1000 {
        break
    }
}
