// MARK: - Writing functions

func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}

printHelp()


// MARK: - Accepting parameters

func square(number: Int) {
    print(number * number)
}

square(number: 8)


// MARK: - Returning values

func square2(number: Int) -> Int {
    return number * number
}

let result = square2(number: 8)
print(result)


func doMath() -> Int {
    return 5 + 5
}

func doMoreMath() -> Int {
    5 + 5
}


func greet(name: String) -> String {
    if name == "Taylor Swift" {
        return "Oh wow!"
    } else {
        return "Hello, \(name)"
    }
}
greet(name: "Human")

func greet2(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}
greet2(name: "Taylor Swift")

// return array with multiple strings
func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print(user[0])

// return multiple values as key-value pairs
func getUser2() -> [String: String] {
    ["first": "Taylor", "last": "Swift"]
}

let user2 = getUser2()
print(user2["first"])

// return multiple values as tuple
func getUser3() -> (first: String, last: String) {
    (first: "Taylor", last: "Swift")
}

let user3 = getUser3()
print(user3.first)


// MARK: - Parameter labels

func square3(number: Int) -> Int {
    return number * number
}

let result2 = square(number: 8)

func sayHello(to name: String) {
    print("Hello, \(name)!")
}
sayHello(to: "Taylor")

func setReactorStatus(primaryActive: Bool, backupActive: Bool, isEmergency: Bool) {
    // code here
}

setReactorStatus(primaryActive: true, backupActive: true, isEmergency: false)

func setAge(for person: String, to value: Int) {
    print("\(person) is now \(value)")
}
setAge(for: "Paul", to: 40)


// MARK: - Omitting parameter labels

func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")


// MARK: - Default parameters

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Taylor")
greet("Taylor", nicely: false)

func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
    // code here
}

findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)


// MARK: - Variadic functions

print("Haters", "gonna", "hate")

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)


// MARK: - Writing throwing functions

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}


// MARK: - Running throwing functions

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}


// MARK: - inout parameters

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
