//
//  main.swift
//  NumberLetterCounts
//
//  Created by Mehdi Sqalli on 03/01/2015.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation

func numberWord(number:Int) -> String {
    
    switch number {
        
    case 1:
        return "one"
        
    case 2:
        return "two"
        
    case 3:
        return "three"
        
    case 4:
        return "four"
        
    case 5:
        return "five"
        
    case 6:
        return "six"
        
    case 7:
        return "seven"
        
    case 8:
        return "eight"
        
    case 9:
        return "nine"
        
    case 10:
        return "ten"
        
    case 11:
        return "eleven"
        
    case 12:
        return "twelve"
        
    case 13:
        return "thirteen"
        
    case 15:
        return "fifteen"
        
    case 14, 16, 17, 19:
        return numberWord(number % 10) + "teen"
        
    case 18:
        return numberWord(8) + "een"
        
    case 20:
        return "twenty"
        
    case 30:
        return "thirty"
        
    case 40:
        return "forty"
        
    case 50:
        return "fifty"
        
    case 60, 70, 90:
        return numberWord(number / 10) + "ty"
        
    case 80:
        return numberWord(8) + "y"
        
    case 21 ... 99:
        return numberWord(number - (number % 10)) + numberWord(number % 10)
        
    case 1000:
        return "onethousand"
        
    case _ where number % 100 == 0:
        return numberWord(number / 100) + "hundred"
        
    case 100 ... 999:
        return numberWord(number - number % 100) + "and" + numberWord(number % 100)
        
    default:
        break
        
    }
    
    return ""
}

func numberLetterCounts(maxNumber:Int) -> Int {
    var result = ""
    for i in 1...maxNumber {
        result += numberWord(i)
    }
    
    return countElements(result)
}


func euler17() {
    
    let number = numberLetterCounts(1000)
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler17)
