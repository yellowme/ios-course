// iOS Course - Basics
//
// Author: Luis Burgos <luis@yellowme.mx>
// Open console: View -> Debug Area -> Activate Console

// MARK: - IMPORTS

import Darwin
import Foundation

// MARK: - COMMENTS

/*
 Multiline comment
 */

// MARK: - VARIABLES

// var declares this string variable
// Statements don't require ";"
var hello = "Hello "

// You can define it is a string
var world: String = "World"

// Combine strings
var msg = hello + world

// You can place variables in print
print("Hello \(world)")
var multilineString = """
This is a
multiline string variable
"""
print(multilineString)

// MARK: - DATA TYPES

// Use let to define a CONSTANT
let pi = 3.14159265359

var myAge: Int = 23
var pi2: Float = 3.1415
var pi3: Double = 3.1415
var canVote: Bool = true
var myGrade: Character = "A"

// Casting
var baseNumber: Double = 3.0
var numberToCast: Int = 2

// This would be an error without the cast
var resultAfterCasting = baseNumber + Double(numberToCast)

// Cast to Int
print("3 : \(Int(3.14))")

// MARK: - CONDITIONALS

// MARK: - IF / ELSE

// Comparison Operators : > < >= <= == !=
// === : Checks if pointing to same reference
// !== : Checks if don't point at same reference

var age: Int = 8

if age < 5 {
    print("Go to Preschool")
} else if age == 5 {
    print("Go to Kindergarten")
} else if (age > 5) && (age <= 18){
    let grade: Int = age - 5
    print("Go to Grade \(grade)")
} else {
    print("Go to College")
}

// MARK: - TERNARY OPERATOR
var canDrive: Bool = age >= 16
var message = canDrive ? "Yes" : "Ño"

// MARK: - SWITCH

let tech = "iOS"

switch tech {
// Matches for tomatoes or pasta
case "iOS":
    print("Winner")
    // fallthrough matches the next case even if
    // there is no match
case "android", "react":
    print("🤔")
default:
    print("Wat")
}

// You can also match ranges
let testScore: Int = 89

switch testScore {
case 93...100:
    print("You got an A")
case 85...92:
    print("You got a B")
case 77...84:
    print("You got a C")
case 69...76:
    print("You got a D")
default:
    print("You got an F")
}

// MARK: - STRINGS

// Escape Characters : \\ \t \n \" \'
var welcomeString = "Welcome to the iOS Course"
var hereWeGoString = " and here we go"

// Join strings
var fullMessage = welcomeString + hereWeGoString

// String length
print("Length : \(fullMessage.count)")

// Get the first character
print("First : \(fullMessage[..<fullMessage.startIndex])")

// Get the 5th character
let index5 = fullMessage.index(fullMessage.startIndex, offsetBy: 5)
print("5th : \(fullMessage[index5])")

// Check if string is empty
print("Empty : \(welcomeString.isEmpty)")

// Insert a character at an index
hereWeGoString.insert("A", at: hereWeGoString.startIndex)

// Insert a string at an index
hereWeGoString.insert(
    contentsOf: " here ",
    at: hereWeGoString.index(hereWeGoString.startIndex, offsetBy: 2)
)

// Get a substring
let startIndex = hereWeGoString.index(hereWeGoString.startIndex, offsetBy: 2)
let endIndex = hereWeGoString.index(hereWeGoString.startIndex, offsetBy: 9)
let stringRange = startIndex ..< endIndex
let subStr = hereWeGoString[stringRange]

// MARK: - ARRAYS
// Stores values of the same type

// Make empty array
var yellowAgesArray = [Int]()

// Check if array is empty
print("Empty \(yellowAgesArray.isEmpty)")

// Add value to array
yellowAgesArray.append(5)

// Add another item
yellowAgesArray += [7, 9]

// Get array item
print("Index 1 : \(yellowAgesArray[1])")

// Change value at index
yellowAgesArray[0] = 4

// Insert at an index
yellowAgesArray.insert(10, at: 3)

// Remove item
yellowAgesArray.remove(at: 3)

// Change multiple values
yellowAgesArray[0...2] = [1,2,3]

// Length of array
print("Length : \(yellowAgesArray.count)")

// Fill array with a value
var arrayWithRepeatedValue = Array(repeating: 0, count: 5)

// Combine arrays
var combinedArray = yellowAgesArray + arrayWithRepeatedValue

// Iterate through an array
for item in combinedArray {
    print(item)
}

// Get index and value
for (index, value) in combinedArray.enumerated() {
    print("\(index) : \(value)")
}

// MARK: - LOOPING

// MARK: - FOR LOOP

var forLoopArray = [1,2,3]

// Iterate through array
for item in forLoopArray {
    print(item)
}

// Iterate with a range
for index in 1...5 {
    print(index)
}

// MARK: - WHERE
// Print only evens
for index in 1...10 where index % 2 == 0 {
    print("Even : \(index)")
}

// MARK: - WHILE LOOP
var i: Int = 1
while i < 10 {
    if i % 2 == 0 {
        i += 1
        // Continue jumps back to the beginning of the loop
        continue
    }
    
    if i == 7 {
        // Break ends the loop
        break
    }
    
    print(i)
    i += 1
}

// MARK: - DICTIONARIES
// Stores unordered lists of key value pairs

// Create empty dictionary
var yellowDirectory = [String: String]()

// Check if empty
print("Empty : \(yellowDirectory.isEmpty)")

// Create an item with index of 1
yellowDirectory["ios-dev"] = "Luis Burgos"
yellowDirectory["director"] = "Javier Olán"

print(yellowDirectory)

// Size of dictionary
print("Size : \(yellowDirectory.count)")

// Add an item
yellowDirectory["android-dev"] = "Migdonio Rodriguez"

// Change a value
yellowDirectory["ios-dev"] = "Angel Medina"

print(yellowDirectory)

// Get a value
if let name = yellowDirectory["ios-dev"] {
    print("iOS Developer : \(name)")
}

// Remove a key value pair
yellowDirectory["ios-dev"] = nil

// Iterate through a dictionary
for (key, value) in yellowDirectory {
    print("\(key) : \(value)")
}

// MARK: - TUPLES
// Tuples are finite group of values that are related

let height: Double = 6.25
let weight: Int = 175

// Create a tuple
let pacientMeasures = (height, weight)

// Access values
print("Height : \(pacientMeasures.0)")

// You can name values
let pacientRealMeasures = (height: 6.25, weight: 175)

print("Weight : \(pacientRealMeasures.weight)")

// MARK: - OPTIONALS
// Optionals are used to indicate that there may
// not be a value. Everything that can have a
// value of nil should be declared optional

// Declare an optional
var favoriteLanguage: String?
favoriteLanguage = "Swift"

// Check for nil
if favoriteLanguage != nil {
    // Get the value (Forced Unwrapping)
    let language = favoriteLanguage! // => Be aware of the consequences
    print("Favorite language : \(language)")
}

// Optional binding is used to check if an optional
// has a value
if let language = favoriteLanguage {
    print("Favorite language : \(language)")
} else {
    print("No fav language")
}

// If nil use "coalescing operator" to assign a value
let language = favoriteLanguage ?? "No favorite"

// MARK: - FUNCTIONS

// Define your parameter types
func sayMyName(name: String) {
    print(name)
}

sayMyName(name: "Luis Burgos")

func greet(person: String, day: String) {
    print("Hello \(person), today is \(day).")
}

greet(person: "Bob", day: "Tuesday")

// Define your return type and you can define
// default values
func getGreeting(name: String, day: String? = nil) -> String {
    var realDay  = ""
    if let day = day {
        realDay = ", today is \(day)"
    }
    return "Hello \(name) \(realDay)."
}

// A variadic parameter allows for an unknown
// number of parameters
func getGreeting(names: String...) -> String {
    var greeting = "Hello "
    for name in names {
        greeting += ", \(name)"
    }
    return greeting
}

print("\(getGreeting(names: "Juan", "Luis", "Javier"))")

// Named parameters
func getBestGreeting(with name: String) -> String {
    return "My name: \(name)"
}

getBestGreeting(with: "Luis Burgos")

// MARK: - CLOSURES

// Closures are functions that don't require a name
// or function definition

func executeSomething(tag: String, completion: ((String) -> Void)?) {
    print("Part 1 for tag \(tag)")
    completion?("Something")
    print("Part 2 for tag \(tag)")
}

executeSomething(tag: "ONE", completion: nil)

executeSomething(tag: "TWO") { message in
    print(message)
}

// A closure that excepts and returns an Int
var square: (Int) -> (Int) = {
    num in
    return num * num
}

print("5 square is : \(square(5))")

// Assign a closure to another variable
var squareCopy = square
print("5 square is : \(squareCopy(5))")

// You can reference any values outside the closure
let numbers = [8,9,2,4,1,0,7]

// Create a function that returns a Bool stating
// if 1 value is greater then the other

let sortedNums = numbers.sorted(by: { x, y in
    x < y
})

print(sortedNums)

// Square every item in an array with map
// map excepts a closure

let squaredNums = numbers.map { (num: Int) -> String in
    "\(num * num)"
}

print(squaredNums)

// MARK: - FILTER
// Used to filter out values in an array
let myNumbers = [1,2,3,4,5,6]

let evenNums = myNumbers.filter{ (num: Int) -> Bool in
    return num % 2 == 0
}

print(evenNums)

// MARK: - REDUCE
// Reduces array values into one value
let reducedNumbers = myNumbers.reduce(0) {
    (x: Int, y: Int) -> Int in
    return x + y
}

print(reducedNumbers)

// MARK: - ENUMS
// Define types with a limited number of cases

enum DeveloperLevel {
    case senior
    case junior
    case baby
    case god
}

var myLevel = DeveloperLevel.baby

// change the value
myLevel = .junior

// Check value
print("Master Developer: \(myLevel == .senior)")

// MARK: - STRUCTS
// Structs group related data together

struct Rectangle {
    var height = 0.0
    var length = 0.0
    
    // You can include functions
    func area() -> Double{
        let area = height * length
        return area
    }
}

// Create a Rectangle
let myRect = Rectangle(height: 10.0, length: 5.0)

print("Area : \(myRect.height) * \(myRect.length) = \(myRect.area())")

// MARK: - CLASSES

class Programmer {
    var name: String = "No Name"
    var height: Double = 0.0
    var weight: Double = 0.0
    var level: DeveloperLevel = .baby
    
    // Assigns default values when an object is created
    // You can have many inits with different attributes
    
    // self is used to refer to attributes of the object
    // that called for this method to execute
    init(name: String, height: Double, weight: Double, level: DeveloperLevel){
        self.name = name
        self.height = height
        self.weight = weight
        self.level = level
    }
    
    func getInfo() {
        print("\(self.name) is \(self.height) cms tall and weighs \(self.weight) kgs and likes to say \(self.level)")
    }
}

var myFirstDev = Programmer(name: "Yellow Kiddo", height: 38, weight: 12.7, level: .junior)
print(myFirstDev.getInfo())

// ----- INHERITANCE -----
class SoftwareEngineer: Programmer {
    
    // A func marked as final can't be overridden by
    // subclasses
    
    final func useGoodPractices(){
        print("\(self.name) uses good practices")
    }
    
    override func getInfo() {
        // You can call a method in the superclass
        super.getInfo()
        print("and uses good practices")
    }
    
}

var chuckNorris = SoftwareEngineer(name: "Chuck", height: 38, weight: 12.7, level: .god)

print(chuckNorris.getInfo())
print(chuckNorris.useGoodPractices())

// You can pass any subclass type and the right method
// is automatically called
func printGetInfo(programmer: Programmer){
    programmer.getInfo()
}

printGetInfo(programmer: myFirstDev)
printGetInfo(programmer: chuckNorris)


// MARK: - PROTOCOLS
// Protocols are like interfaces in other languages
// When you adopt a protocol you agree to define the
// behavior it describes

@objc protocol NetworkingReactionable {
    // Define if getters and setters are available
    // Put optional before var if you want it to be
    // optional
    var hasReaction: Bool { get set }
    
    // You define the header for a func but nothing else
    func didConnect() -> String
    
    @objc optional func didFail() -> String
}

protocol ViewTaggeable {
    var viewTag: String { get set }
}

// Optionally you could adopt multiple protocols class ClassName: prot1, prot2
class MyLoginView: NetworkingReactionable {
    var hasReaction: Bool = false
    
    func didConnect() -> String {
        return "My login has reaction? \(self.hasReaction)"
    }
}

class MySplashView: NetworkingReactionable, ViewTaggeable {
    var hasReaction: Bool = true
    var viewTag: String = "SplashView"
    
    func didConnect() -> String {
        return "My view with tag: \(self.viewTag) has reaction? \(self.hasReaction)"
    }
    
    func didFail() -> String {
        return "Oh! Snaps! Something went wrong"
    }
}

let myLoginView = MyLoginView()
print(myLoginView.didConnect())

let mySplashView = MySplashView()
print(mySplashView.didConnect())
print(mySplashView.didFail())

let views: [NetworkingReactionable] = [myLoginView, mySplashView]

views.map { view in
    if view.hasReaction {
        print("Has reaction!!")
    }
    if let failureImpl = view.didFail {
        print(failureImpl())
    } else {
        print("Has no implementation for failure")
    }
}

// MARK: SYSTEM EXTENSIONS

// Extensions add new functionality to existing classes, structs
// and other types

// Extend a Double to work with different distance units
// The Double by default is in meters and we can convert
// to other types by appending a dot syntax

extension Double {
    var km: Double { return self * 1000.0 }
    var m: Double { return self }
    var ft: Double { return self * 3.28 }
    var inch: Double { return self * 39.37}
    
    // Add a method to Double for squares
    mutating func square() -> Double {
        let sqr = self * self
        return sqr
    }
}

// Convert 1 meter into inches
let oneMeter = 1.0.inch
print("One Meter is \(oneMeter) inches")

// Get the square
var squaredValue: Double = 5
print("Square of 5 : \(squaredValue.square())")

// MARK: EXTENSIONS

extension NetworkingReactionable {
    func didFail() -> String {
        return "This is a default method implementation for failure"
    }
}

let mySecondLoginView = MyLoginView()
print(mySecondLoginView.didFail())


// MARK: ERROR HANDLING
// Used to handle errors gracefully
// Define our error by defining a type of the Error protocol

enum DivisionError: Error{
    case DivideByZero
}

// Define we want the error to get thrown from the function
func divide(num1: Float, num2: Float) throws -> Float {
    guard num2 != 0.0 else {
        throw DivisionError.DivideByZero
    }
    return num1/num2
}

// Wrap code that could trigger an error in a do catch block
// catch the error and handle it

do {
    try divide(num1: 4, num2: 0)
} catch DivisionError.DivideByZero {
    print("Can't Divide by Zero")
}
