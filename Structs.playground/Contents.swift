// MARK: - Creating your own structs

struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"


struct User {
    var name: String
    var age: Int
    var city: String
}

// with struct
func authenticate(_ user: User) { }
func showProfile(for user: User) { }
func signOut(_ user: User) { }

// with tuple
func authenticate(_ user: (name: String, age: Int, city: String)) { }
func showProfile(for user: (name: String, age: Int, city: String)) { }
func signOut(_ user: (name: String, age: Int, city: String)) { }


// MARK: - Computed properties

struct SportTwo {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = SportTwo(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


// MARK: - Property observers

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


// MARK: - Methods

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()


// MARK: - Mutating methods

struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.name
person.makeAnonymous()
person.name


// MARK: - Properties and methods of strings

let stringOne = "Do or do not, there is no try."

print(stringOne.count)
print(stringOne.hasPrefix("Do"))
print(stringOne.uppercased())
print(stringOne.sorted())


// MARK: - Properties and methods of arrays

var toys = ["Woody"]
print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")

print(toys.sorted())
toys.remove(at: 0)
