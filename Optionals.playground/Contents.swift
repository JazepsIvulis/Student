import UIKit

// MARK: Handling missing data

var age: Int? = nil

age = 38


// MARK: Unwrapping optionals

var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}


func getUsername() -> String? {
    "Taylor"
}

if let username = getUsername() {
    print("Username is \(username)")
} else {
    print("No username")
}


// MARK: Unwrapping with guard

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

greet(nil)
greet("John")


func getMeaningOfLife() -> Int? {
    42
}

func printMeaningOfLife() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}

func printMeaningOfLifeTwo() {
    guard let name = getMeaningOfLife() else {
        return
    }

    print(name)
}


// MARK: Force unwrapping

let str = "5"

// following makes num an optional Int because you might have tried to convert a string like “Fish” rather than “5”
let num = Int(str)

// Swift will immediately unwrap the optional and make num a regular Int rather than an Int?
let num2 = Int(str)!


let url = URL(string: "https://www.apple.com")!

let randomNumber = (1...10).randomElement()!


enum Direction: CaseIterable {
    case north, south, east, west
}

let randomDirection = Direction.allCases.randomElement()!

// better idea is to create a handful of functions and extensions that isolate your force unwraps in one place
enum DirectionTwo: CaseIterable {
    case north, south, east, west

    static func random() -> DirectionTwo {
        DirectionTwo.allCases.randomElement()!
    }
}

let randomDirectionTwo = DirectionTwo.random()


// MARK: Implicitly unwrapped optionals

let ageTwo: Int! = nil


// MARK: Nil coalescing

// function that accepts an integer as its only parameter and returns an optional string
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"


let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
// reading a dictionary key will always return an optional
let crusherScore = scores["Crusher"] ?? 0
// dictionaries offer a slightly different approach that lets us specify the default value for when the key isn’t found
let crusherScoreTwo = scores["Crusher", default: 0]


// MARK: Optional chaining

let names = ["John", "Paul", "George", "Ringo"]

// question mark is optional chaining – if first returns nil then Swift won’t try to uppercase it, and will set beatle to nil immediately
let beatle = names.first?.uppercased()


let namesTwo = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = namesTwo["Vincent"]?.first?.uppercased() ?? "?"


// MARK: Optional try

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

// try? changes throwing functions into functions that return an optional
// if the function throws an error you’ll be sent nil as the result, otherwise you’ll get the return value wrapped as an optional
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

// try! can be used when you know for sure that the function will not fail, if the function does throw an error, code will crash
try! checkPassword("sekrit")
print("OK!")


// MARK: Failable initializers

struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let john = Person(id: "john")
let seb = Person(id: "sebastian")


struct Employee {
    var username: String
    var password: String

    init?(username: String, password: String) {
        guard password.count >= 8 else { return nil }
        guard password.lowercased() != "password" else { return nil }

        self.username = username
        self.password = password
    }
}

let tim = Employee(username: "TimC", password: "app1e")
let craig = Employee(username: "CraigF", password: "ha1rf0rce0ne")


// MARK: Typecasting

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

// keyword as? returns an optional: it will be nil if the typecast failed, or a converted type otherwise
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}


class PersonTwo {
    var name = "Anonymous"
}

class Customer: PersonTwo {
    var id = 12345
}

class EmployeeTwo: PersonTwo {
    var salary = 50_000
}

let customer = Customer()
let employee = EmployeeTwo()
let people = [customer, employee]

for person in people {
    if let customer = person as? Customer {
        print("I'm a customer, with id \(customer.id)")
    } else if let employee = person as? EmployeeTwo {
        print("I'm an employee, earning $\(employee.salary)")
    }
}
