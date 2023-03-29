// MARK: - Initializers

struct User {
    var username: String
}

var user = User(username: "twostraws")


struct User2 {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user2 = User2()
user2.username = "twostraws"


struct Employee {
    var name: String
    var yearsActive = 0
}

let roslin = Employee(name: "Laura Roslin")
let adama = Employee(name: "William Adama", yearsActive: 45)


struct Employee2 {
    var name: String
    var yearsActive = 0

    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// with custom initializer following is no longer allowed
//let laura = Employee2(name: "Laura Roslin")

struct Employee3 {
    var name: String
    var yearsActive = 0
}

// if you want to keep default initializer, move custom initializer to an extension
extension Employee3 {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let lauraRoslin = Employee3(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee3()


// MARK: - Referring to the current instance

struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

let human = Person(name: "John")

// with self
struct Student {
    var name: String
    var bestFriend: String

    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class…")
        self.name = name
        self.bestFriend = bestFriend
    }
}

// without self
struct Student2 {
    var name: String
    var bestFriend: String

    init(name studentName: String, bestFriend studentBestFriend: String) {
        print("Enrolling \(studentName) in class…")
        name = studentName
        bestFriend = studentBestFriend
    }
}


// MARK: - Lazy properties

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Human {
    var name: String
    // Swift will create FamilyTree struct only when it's first accessed
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Human(name: "Ed")

// if you want to see the “Creating family tree!” message, you need to access the property at least once
ed.familyTree


// MARK: - Static properties and methods

struct Student3 {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student3.classSize += 1
    }
}

let eddy = Student3(name: "Eddy")
let taylor = Student3(name: "Taylor")

print(Student3.classSize)


// MARK: - Access control

struct Person2 {
    private var id: String

    init(id: String) {
        self.id = id
    }
    
    // only methods inside Person2 can read the id property
    func identify() -> String {
            return "My social security number is \(id)"
    }
}

let edward = Person2(id: "12345")

// 'id' is inaccessible due to 'private' protection level
//edward.id
