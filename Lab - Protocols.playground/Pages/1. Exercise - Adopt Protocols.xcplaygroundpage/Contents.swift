/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, Comparable, and Codable

 Create a `Human` class with two properties: `name` of type `String` and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
class Human: CustomStringConvertible, Equatable, Comparable, Codable{
	static func < (lhs: Human, rhs: Human) -> Bool {
		return lhs.age > rhs.age
	}
	
	static func == (lhs: Human, rhs: Human) -> Bool {
		return lhs.name == rhs.name && lhs.age == rhs.age
		
	}
	
	var description: String{
		return "\(name) \(age)"
	}
	
	var name = String()
	var age = Int()
	
	init(name: String, age: Int) {
		self.name = name
		self.age = age
		
	}
}
let human1 = Human(name: "Pedro", age: 23)
let human2 = Human(name: "Andrey", age: 25)
/*:
 Make the `Human` class adopt the `CustomStringConvertible` protocol. Print both of your previously initialized `Human` objects.
 */
print(human1.description)
print(human2.description)

/*:
 Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether your two previously initialized `Human` objects are equal to each other (using `==`). Then print the result of a boolean expression evaluating whether your two previously initialized `Human` objects are not equal to each other (using `!=`).
 */
print(human1 == human2)
print(human1 != human2)

/*:
 Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
 */
let human3 = Human(name: "Carlos", age: 32)
var peopple = [human1,human2,human3]
var sortedPeople = peopple.sorted(by: <)
print(sortedPeople)

/*:
 Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored and print it to the console.
 */
import Foundation

if let jsonData = try? JSONEncoder().encode(sortedPeople),
   let jsonString = String(data: jsonData, encoding: .utf8) {
	print(jsonString)
} else {
	print("erro")
}


//: page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
