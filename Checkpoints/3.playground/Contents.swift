for count in 1...100 {
    if count.isMultiple(of: 3) && count.isMultiple(of: 5) {
        print("   FizzBuzz")
    } else if count.isMultiple(of: 3) {
        print("   Fizz")
    } else if count.isMultiple(of: 5) {
        print("   Buzz")
    } else {
        print("   \(count)")
    }
}
