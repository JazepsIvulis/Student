// MARK: - Creating basic closures

let driving = {
    print("I'm driving in my car")
}

driving()


// MARK: - Accepting parameters in a closure

let drivingTo = { (place: String) in
    print("I'm going to \(place) in my car")
}

drivingTo("London")

func pay(user: String, amount: Int) {
    // code
}

let payment = { (user: String, amount: Int) in
    // code
}


// MARK: - Returning values from a closure

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)


// MARK: - Return a value from a closure that takes no parameters

// accepts 1 parameter, returns nothing:
let payment2 = { (user: String) in
    print("Paying \(user)…")
}
payment2("John")

// accepts 1 parameter, returns Boolean
let payment3 = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}
payment3("Olivia")

// don't accept any parameter, return Boolean
let payment4 = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}
payment4()
// same, but as function
func payment5() -> Bool {
    print("Paying an anonymous person…")
    return true
}
payment5()


// MARK: - Closures as parameters

let driving2 = {
    print("I'm driving in my car")
}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving2)


// MARK: - Trailing closure syntax

func travel2(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel2() {
    print("I'm driving in my car")
}
// if there aren't any other parameters than closure, parentheses can be eliminated
travel2 {
    print("I'm driving in my car")
}


func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

// without trailing closure syntax
animate(duration: 3, animations: {
    print("Fade out the image")
})

// with trailing closure syntax
animate(duration: 3) {
    print("Fade out the image")
}
