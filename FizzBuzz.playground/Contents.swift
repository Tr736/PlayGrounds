//: Playground - noun: a place where people can play

import UIKit

func fizzBuzz(number : Int) -> String {
    
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (true, true):
        return "FizzBuzz"
    default:
        return "\(number)"
    }
}

var number = fizzBuzz(number : 15)