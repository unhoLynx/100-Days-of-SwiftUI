struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int {
        didSet {
            print("""
            \(self.model) is changing gears!
            Current gear is \(currentGear) now!
            
            """)
        }
    }
    
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = currentGear
    }
    
    mutating func gearChange (to value: Int) -> Void {
        if value <= 10 && value >= 0 {
            currentGear = value
        } else {
            print("You can't change gear to \(value)!")
        }
    }
    
    mutating func gearUp () -> Void {
        if currentGear<10 {
            currentGear += 1
        } else {
            print("You can't change gear up!")
        }
    }
    
    mutating func gearDown () -> Void {
        if currentGear>0 {
            currentGear -= 1
        } else {
            print("You can't change gear down!")
        }
    }
}

var BMW = Car(model: "BMW M5", numberOfSeats: 4, currentGear: 0)

BMW.gearUp()
BMW.gearUp()
BMW.gearDown()
BMW.gearChange(to: 8)
BMW.gearChange(to: -8)
BMW.gearChange(to: 18)
