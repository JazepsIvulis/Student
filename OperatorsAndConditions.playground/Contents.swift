// MARK: - Arithmetic operators

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

let value1: Double = 90000000000000001
let value2: Int = 90000000000000001

let weeks = 465 / 7
let days = 465 % 7
print("There are \(weeks) weeks and \(days) days until the event.")

let number = 465
let isMultiple = number.isMultiple(of: 7)


// MARK: - Operator overloading

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf


// MARK: - Compound assignment operators

var score = 95
score = score - 5
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"


// MARK: - Comparison operators

let firstNumber = 6
let secondNumber = 4

firstNumber > secondNumber
firstNumber < secondNumber
firstNumber >= secondNumber
firstNumber <= secondNumber

"Taylor" <= "Swift"

let firstName = "Paul"
let secondName = "Sophie"

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

let firstAge = 40
let secondAge = 10

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)

enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)


// MARK: - Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

let score2 = 9001

if score2 > 9000 {
    print("It's over 9000!")
} else if score2 == 9000 {
    print("It's exactly 9000!")
} else {
    print("It's not over 9000!")
}


// MARK: - Combining conditions

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}


// MARK: - The ternary operator

let card1 = 11
let card2 = 10
print(card1 == card2 ? "Cards are the same" : "Cards are different")

if card1 == card2 {
    print("Cards are the same")
} else {
    print("Cards are different")
}

let isAuthenticated = true
print(isAuthenticated ? "Welcome!" : "Who are you?")


// MARK: - Switch statements

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}


// MARK: - Range operators

let studentScore = 85

switch studentScore {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

let names = ["Piper", "Alex", "Suzanne", "Gloria"]

print(names[0])
print(names[1...2])
print(names[1...])
