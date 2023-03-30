import UIKit

// MARK: - Creating your own classes

class Dog {
    var name: String
    var breed: String

    // if you have properties in your class, you must always create your own initializer
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// creating instances of the class looks just the same as if it were a struct
let poppy = Dog(name: "Poppy", breed: "Poodle")


// MARK: - Class inheritance

class Poodle: Dog {
    init(name: String) {
        // Swift always makes you call super.init() from child classes
        super.init(name: name, breed: "Poodle")
    }
}

let reksis = Poodle(name: "Reksis")


// MARK: - Overriding methods

class Cat {
    func makeNoise() {
        print("Meow!")
    }
}

class Sphynx: Cat {}

let kitty = Sphynx()
kitty.makeNoise()

class Persian: Cat {
    override func makeNoise() {
        print("Hiss!")
    }
}

let kittyTwo = Persian()
kittyTwo.makeNoise()


// MARK: - Final classes

// when you declare a class as being final, no other class can inherit from it
final class DogTwo {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// following line throws error, because parent class is final class
//class Bulldog: DogTwo {}


// MARK: - Copying objects

class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singerCopy.name)

// because of the way classes work, both singer and singerCopy point to the same object in memory
print(singer.name)


// MARK: - Deinitializers

class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    // this will be called when the Person instance is being destroyed
    deinit {
        print("\(name) is no more!\n")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}


// MARK: - Mutability

class Vocalist {
    var name = "Taylor Swift"
}

// you can change any variable property on a class even when the instance of class is created as a constant
let taylor = Vocalist()
taylor.name = "Ed Sheeran"
print(taylor.name)

// if you want to stop that from happening you need to make the property constant
class Dancer {
    let name = "Taylor Swift"
}

let ed = Dancer()
// following line throws error, because proprty is a constant
//ed.name = "Taylor"
