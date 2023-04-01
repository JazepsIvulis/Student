import UIKit

// MARK: Protocols

protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}


// simple buy() method that works only with books would look like this
struct Book {
    var name: String
}

func buy(_ book: Book) {
    print("I'm buying \(book.name)")
}


// protocol that declares the basic functionality
protocol Purchaseable {
    var name: String { get set }
}

// each struct conforming to that protocol by having a name string
struct BookTwo: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

// buy() function which accepts any kind of Purchaseable item
func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}


// MARK: Protocol inheritance

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

// without protocol inheritance:
protocol Computer {
    var price: Double { get set }
    var weight: Int { get set }
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
}

protocol Laptop {
    var price: Double { get set }
    var weight: Int { get set }
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
    var screenSize: Int { get set }
}

// with protocol inheritance:
protocol Product {
    var price: Double { get set }
    var weight: Int { get set }
}

protocol ComputerTwo: Product {
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
}

protocol LaptopTwo: ComputerTwo {
    var screenSize: Int { get set }
}


// MARK: Extensions

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

number.isEven


// MARK: Protocol extensions

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

// Swift’s arrays and sets both conform to a protocol called Collection
extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

// Both Array and Set will now have summarize() method
pythons.summarize()
beatles.summarize()


// MARK: Protocol-oriented programming

// protocol called IdentifiableTwo that requires any conforming type to have an id property and an identify() method
protocol IdentifiableTwo {
    var id: String { get set }
    func identify()
}

// protocol extensions allow to provide a default identify() method
extension IdentifiableTwo {
    func identify() {
        print("My ID is \(id).")
    }
}

// when type that conforms to Identifiable is created, it gets identify() automatically
struct UserTwo: IdentifiableTwo {
    var id: String
}

let twostraws = UserTwo(id: "twostraws")
twostraws.identify()
