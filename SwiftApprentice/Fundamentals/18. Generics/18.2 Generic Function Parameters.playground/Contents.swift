import Cocoa

func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
    (y, x)
}

swapped(33, "Jay")

