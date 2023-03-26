// MARK: - Using closures as parameters when they accept parameters

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}


let changeSpeed = { (speed: Int) in
    print("Changing speed to \(speed)kph")
}

func buildCar(name: String, engine: (Int) -> Void) {
    // build the car
}


// MARK: - Using closures as parameters when they return values

func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}


func reduce(_ values: [Int], using closure: (Int, Int) -> Int) -> Int {
    // start with a total equal to the first value
    var current = values[0]

    // loop over all the values in the array, counting from index 1 onwards
    for value in values[1...] {
        // call our closure with the current value and the array element, assigning its result to our current value
        current = closure(current, value)
    }

    // send back the final current value
    return current
}

let numbers = [10, 20, 30]

let sum = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal + next
}

print(sum)

let multiplied = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal * next
}

let sum2 = reduce(numbers, using: +)


// MARK: - Shorthand parameter names

func travel3(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel3 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// Swift knows the parameter to that closure must be a string, so it can be removed
travel3 { place -> String in
    return "I'm going to \(place) in my car"
}

// Swift also knows the closure must return a string, so it can be removed as well
travel3 { place in
    return "I'm going to \(place) in my car"
}

// As the closure only has one line of code that must be the one that returns the value, so Swift lets to remove the return keyword too
travel3 { place in
    "I'm going to \(place) in my car"
}

// Rather than writing "place in", Swift can provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0.
travel3 {
    "I'm going to \($0) in my car"
}


// MARK: - Closures with multiple parameters

func travel4(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel4 {
    "I'm going to \($0) at \($1) miles per hour."
}


// MARK: - Returning closures from functions

func travel5() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel5()
result("London")

// It’s technically allowable – although really not recommended! – to call the return value from travel() directly
let result2 = travel5()("London")


print(Int.random(in: 1...10))

func getRandomNumber()-> Int {
    Int.random(in: 1...10)
}

print(getRandomNumber())

func makeRandomGenerator() -> () -> Int {
    let function = { Int.random(in: 1...10) }
    return function
}

let generator = makeRandomGenerator()
let random1 = generator()
print(random1)


// MARK: - Capturing values

func travel6() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result3 = travel6()
result3("London")
result3("London")
result3("London")
result3("London")


func makeRandomNumberGenerator() -> () -> Int {
    var previousNumber = 0
    
    return {
        var newNumber: Int

        repeat {
            newNumber = Int.random(in: 1...3)
        } while newNumber == previousNumber

        previousNumber = newNumber
        return newNumber
    }
}

let generator2 = makeRandomNumberGenerator()

for _ in 1...10 {
    print(generator2())
}
