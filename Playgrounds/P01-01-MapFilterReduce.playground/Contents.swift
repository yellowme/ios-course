import Foundation

let values = [2.0,4.0,5.0,7.0]

var squares: [Double] = []
for value in values {
    squares.append(value*value)
}
squares


let squares2 = values.map {$0 * $0}
squares2

let squares3 = values.map({
    (value: Double) -> Double in
    return value * value
})
squares3

let squares4 = values.map {value in value * value}
squares4

let squares5 = values.map { $0 * $0 }
squares5

let scores = [0,28,124]
let words = scores.map { NumberFormatter.localizedString(from: $0 as NSNumber, number: .spellOut) }
// ["zero", "twenty-eight", "one hundred twenty-four"]

let milesToPoint = ["point1":120.0,"point2":50.0,"point3":70.0]
let kmToPoint = milesToPoint.map { name,miles in miles * 1.6093 }

let digits = [1,4,10,15]
let even = digits.filter { $0 % 2 == 0 }

let items = [2.0,4.0,5.0,7.0]
let total = items.reduce(10.0, +)
// 28.0

let codes = ["abc","def","ghi"]
let text = codes.reduce("", +)
// "abcdefghi"

let names = ["alan","brian","charlie"]
let csv = names.reduce("===") {text, name in "\(text),\(name)"}
// "===,alan,brian,charlie"

let keys: [String?] = ["Tom", nil, "Peter", nil, "Harry"]
let validNames = keys.compactMap { $0 }
validNames
// ["Tom", "Peter", "Harry"]

let counts = keys.compactMap { $0?.count }
counts
// [3, 5, 5]

let marks = [4,5,8,2,9,7]
let totalPass = marks.filter{$0 >= 7}.reduce(0, +)
// 24

let numbers = [20,17,35,4,12]
let evenSquares = numbers.filter{$0 % 2 == 0}.map{$0 * $0}
// [400, 16, 144]

