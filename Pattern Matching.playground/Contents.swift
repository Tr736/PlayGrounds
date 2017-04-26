//: Playground - noun: a place where people can play

import UIKit

// MARK : - BASIC SWITCH

let name = "Thomas"

switch name {
case "James":
    print("Hello James")
case "Thomas":
    print("Hello Thomas")
default:
    print("I Dont Know You")
}
 


// Switch with Tuple

let auth = (name : "Thomas", password : "Password")

switch auth {
case ("James", "Password"):
    print("Hello James and Username and Password Accepted!")
case("Thomas", "Password"):
    print("Hello Thomas and Username and Password Accepted!")
default:
    print("Auth Failed")
}
 

// Switch Pattern Matching and Partial Match

let auth2 = (name : "Thomas", password : "Password", ipAddress : "192.168.0.1")

switch auth2 {
case ("James", "Password", _):
    print("Hello, James")
case ("Thomas", "Password", _):
    print("Hello, Thomas")
default:
    print("Auth Failed")
    
}

// Switch Pattern Matching return Value from Switch

let auth3 = (name : "Thomas", password : "NewPassword", ipAddress : "192.168.0.1")

switch auth3 {
case ("James", "Password", _):
    print("Hello, James")
case ("Thomas", let password, _):
    print("Hello, Thomas. Your Password is \(password)")
default:
    print("Auth Failed")
    
}

// Pattern Matching Calculated Tuples (FizzBuzz Test)


func FizzBuzz(number : Int) -> String {
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false,true):
        return "Buzz"
    case (true, true):
        return "FizzBuzz"
    default:
        return "Number is not divisible by 3 or 5. Your number was \(number)"
    }
}

print(FizzBuzz(number: 15))


// Pattern matching Loops

let Thomas = (name: "Thomas", password: "Password")
let James = (name: "James", password: "NewPassword")
let Lucy = (name: "Lucy", password: "OldPassword")

let users = [Thomas, James, Lucy]

for user in users {
    print(user.name)
}

for case ("Thomas", "Password") in users {
    print("User Thomas has the password Password")
}


for case let (name, password) in users {
    print("User \(name) password \(password)")
}

for case let (name, "Password") in users {
    print("User \(name) has the password : Password")
}

// Pattern matching Optionals


let name1: String? = "Thomas"
let password1: String? = "Pass"

switch (name1, password1) {
case let (.some(matchedName), .some(matchedPassword)):
    print("Hello, \(matchedName)")
case let (.some(matchedName), .none):
    print("\(matchedName), please enter a password")
    
default:
    print("Who Are YOU!!!")
}

switch (name1, password1) {
case let (matchedName? , matchedPassword?):
    print("\(matchedName)'s password is \(matchedPassword)")
case let (matchedUserName?, .none):
    print("\(matchedUserName), please enter a password")
default:
    print("Who Are YOU!!!")

}

let data : [Any?] = ["Thomas", nil , 32, "Richardson"]

for case let .some(datum) in data {
    print(datum)
}

for case let datum? in data {
    print(datum)
}

// Pattern Matching with Ranges

let age = 32

switch age {
case 0 ..< 18 :
    print("you have the energy and time but not the money")
case 18 ..< 70 :
    print("You have the energy and money but not the time")
default:
    print("You have the money and time but not the energy")

}

if  (0 ..< 18).contains(age) {
    print("you have the energy and time but not the money")

} else if  (18 ..< 70).contains(age) {
    print("You have the energy and money but not the time")
    
} else {
    print("You have the money and time but not the energy")

}

let newUser = (name : "Thomas", password : "Password", age : 36)

switch newUser {
case let (name, _ , 0 ..< 18):
    print("\(name) has the energy and time, but not the money")
case let (name, _, 18 ..< 70):
    print("\(name) has the money and energy, but not the time")
case let (name, _ , _):
    print("\(name) has the money and time, but not the energy")

}




// Pattern Matching with enums

enum WeatherType {
    case cloudy(coverage: Int)
    case sunny
    case windy
}

let today = WeatherType.cloudy(coverage: 100)

switch today {
case .cloudy(let coverage) where coverage == 0 :
    print("You must live on the equator")
case .cloudy(let coverage) where (1...50).contains(coverage) :
    print("Its a bit cloudy with \(coverage)% coverage")
    
case .cloudy(let coverage) where (51...99).contains(coverage) :
    print("Its very cloudy with \(coverage)% coverage")
case .cloudy(let coverage) where coverage == 100 :
    print("You must live in the uk")
    
case .windy:
    print("It's windy")
default:
    print("It's sunny")

}

let forecast : [WeatherType] = [.cloudy(coverage : 40), .sunny, .windy, .cloudy(coverage: 10)]

for case let .cloudy(coverage) in forecast {
    print("its cloudy with \(coverage)% coverage")
}

// Pattern Matching with Types

let view : AnyObject = UIButton()

switch view {
case is UIButton :
    print("Found a button")
case is UILabel :
    print("Found a label")
case is UISwitch:
    print("Found a switch")
case is UIView:
    print("Found a view")
default:
    print("found a something else")
}

// cannot access type casting
for label in view.subviews where label is UILabel {
    print("Found a label where frame \(label.frame)")
}

for case let label as UILabel in view.subviews {
    print("Found a label with text \(label.text)")
}

// Pattern Matching Where clauses

let numbers = [1,2,3,4,5]

for number in numbers where number  % 2 == 1 {
    print(number)
}

let familyNames: [String?] = ["Thomas Richardson", "James Richardson", nil, "James Jones"]


for case let name? in familyNames {
    print(name)
}

