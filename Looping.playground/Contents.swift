// MARK: - For loops

let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}


// MARK: - While loops

var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")


// MARK: - Repeat loops

var number2 = 1

repeat {
    print(number2)
    number2 += 1
} while number2 <= 20

print("Ready or not, here I come!")

while false {
    print("This is false")
}

repeat {
    print("This is false")
} while false

let numbers = [1, 2, 3, 4, 5]
var random: [Int]

repeat {
    random = numbers.shuffled()
} while random == numbers


// MARK: - Exiting loops

var countDown = 10

while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}

let scores = [1, 8, 4, 3, 0, 5, 2]
var count2 = 0

for score in scores {
    if score == 0 {
        break
    }

    count2 += 1
}

print("You had \(count2) scores before you got 0.")


// MARK: - Exiting multiple loops

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

let options = ["up", "down", "left", "right"]

let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}


// MARK: - Skipping items

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}


// MARK: - Infinite loops

var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
