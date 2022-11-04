import Cocoa

/*
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty == true {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)!")
    }
}

struct Employee: Person {
    let name: String
}
 
let hulk = Employee(name: "Bruce Benner")
hulk.sayHello()
*/


protocol Building {
    var roomCount: Int { get }
    var cost: Int { get set }
    var realtorName: String { get set }
    func printSummary()
}

extension Building {
    func printSummary() {
        print("\(realtorName) is selling a building with \(roomCount) room(s) that costs \(cost) USD.")
    }
}

struct House: Building {
    var roomCount: Int
    var cost: Int
    var realtorName: String
    
    func printSummary() {
        print("Talk to \(realtorName) to purchase this house for $\(cost)")
    }
}

struct Office: Building {
    var roomCount: Int
    var cost: Int
    var realtorName: String
    
    func printSummary() {
        print("Talk to \(realtorName) to purchase this office for $\(cost).")
    }
}

var nora = House(roomCount: 1, cost: 1, realtorName: "Bilbo Baggins")
nora.printSummary()
