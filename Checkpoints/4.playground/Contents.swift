enum calculationErrors : Error {
    case outOfBoundsError
    case noRoot
}

func calculateSquareRoot(for number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw calculationErrors.outOfBoundsError
    } else {
        for i in 1...number {
            if i * i == number {
                return i
            }
        }
    }
    throw calculationErrors.noRoot
}

let number = -81

do {
    print("Square root of \(number) is \(try calculateSquareRoot(for: number)).")
} catch {
    print("Sorry, there was an error! Can't find an integer square root of \(number)")
}
