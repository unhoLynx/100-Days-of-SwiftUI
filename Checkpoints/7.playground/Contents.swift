class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak() {
        assertionFailure("This should never be called.")
    }
}

class Dog: Animal {
    override func speak() {
        print("Bark, bark!")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("CORGI BARK!")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("POODLE BARK!")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    override func speak() {
        print("Meow!")
    }
}

final class Persian : Cat {
    override func speak() {
        print("PERSIAN MEOW!")
    }
}

final class Lion: Cat {
    override func speak() {
        print("LION MEOW!")
    }
}
