//
//  main.swift
//  LongestCollatzSequence
//
//  Created by Mehdi Sqalli on 01/01/2015.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation

let NUMBER_MAX = 999_999

func collatzSequenceForNumber(var number:Int, inout steps:[Int]) -> Int {

    var numberOfSteps = 0
    var found = false
    
    while (found == false && number > 1) {

        if number % 2 == 0 {
            number /= 2
        } else {
            number = (number * 3 + 1) / 2
            numberOfSteps++
        }
        
        found = number < NUMBER_MAX ? steps[number] > 0 : false
        numberOfSteps++
    }
    
    numberOfSteps += steps[number]
    
    return numberOfSteps
}

func longestCollatzSequence() -> (Int, Int) {
    var collatzSequence = (number:0, steps:0)
    var steps:[Int] = [Int](count: NUMBER_MAX, repeatedValue: 0)
    
    for var number = 2; number < NUMBER_MAX; number++ {

        let steps = collatzSequenceForNumber(number, &steps)
        if steps > collatzSequence.steps {
            collatzSequence = (number, steps)
        }
    }
    
    return collatzSequence
}

func euler14() {

    let number = longestCollatzSequence()
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler14)


