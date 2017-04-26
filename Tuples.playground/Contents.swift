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
 

// Switch Tuples and Partial Match

let auth2 = (name : "Thomas", password : "Password", ipAddress : "192.168.0.1")

switch auth2 {
case ("James", "Password", _):
    print("Hello, James")
case ("Thomas", "Password", _):
    print("Hello, Thomas")
default:
    print("Auth Failed")
    
}

// Switch Tuples return Value from Switch

let auth3 = (name : "Thomas", password : "NewPassword", ipAddress : "192.168.0.1")

switch auth3 {
case ("James", "Password", _):
    print("Hello, James")
case ("Thomas", let password, _):
    print("Hello, Thomas. Your Password is \(password)")
default:
    print("Auth Failed")
    
}

// Switch Calculated Tuples (FizzBuzz Test)


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






