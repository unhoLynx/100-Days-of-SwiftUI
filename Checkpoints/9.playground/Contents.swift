import Cocoa

/*
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Luigi"] {
    print("Mario's opposite is \(marioOpposite)")
}

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}

var book: Book? = Book(title: "Hobbit", author: nil)
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

let credentials = ["twostraws", "fr0sties"]
//let lowercaseUsername = credentials.first?()
//print(lowercaseUsername)
print(credentials[3])
 
func randomInt(from array: [Int]?) -> Int? {
    guard let unwrappedArray = array else {
        let randomNum = Int.random(in: 1...100)
        print("""
              "Given array is empty, here is a rundom number!
              \(randomNum)
              """)
        return randomNum
    }

    let randomNum = unwrappedArray.randomElement()
    print("Here is a random number from your array!")
    print(randomNum)
    return randomNum
}

let myArray = [3,15,123,42,12]
randomInt(from: myArray)
*/

func randomInt(from array: [Int]?) -> Int {array?.randomElement() ?? Int.random(in: 1...100)}
let myArray = [Int]()
print(randomInt(from: myArray))
