//
//  main.swift
//  LongestCollatzSequence
//
//  Created by Mehdi Sqalli on 01/01/2015.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation

func collatzSequenceForNumber(var number:Int, inout steps:[Int]) -> Int {

    var numberOfSteps = 0
    var found = false
    let initialNumber = number
    
    while (found == false) {

        if number % 2 == 0 {
            number /= 2
        } else {
            number = (number * 3 + 1) / 2
            numberOfSteps++
        }
        
        found = number < steps.count ? steps[number] > 0 : false
        numberOfSteps++
    }
    
    numberOfSteps += steps[number]
    steps[initialNumber] = numberOfSteps
    
    return numberOfSteps
}

func longestCollatzSequence(maxNumber:Int) -> (Int, Int) {
    var collatzSequence = (number:0, steps:0)
    var steps:[Int] = [Int](count: maxNumber, repeatedValue: 0)
    steps[1] = 1
    
    for var number = 2; number < maxNumber; number++ {

        let steps = collatzSequenceForNumber(number, &steps)
        if steps > collatzSequence.steps {
            collatzSequence = (number, steps)
        }
    }
    
    return collatzSequence
}

func euler14() {

    let result:(number:Int, steps:Int) = longestCollatzSequence(999_999)
    
    println(result.number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler14)


