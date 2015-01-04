//
//  main.swift
//  LongestCollatzSequence
//
//  Created by Mehdi Sqalli on 01/01/2015.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation

func collatzLength(number:Int, inout stepsCache:[Int]) -> Int {

    var steps = 0
    var n = number
    
    while (n >= number) {

        if number & 1 % 2 == 0 {
            n /= 2
        } else {
            n = (n * 3 + 1) / 2
            steps++
        }
        
        steps++
    }
    
    steps += stepsCache[n]
    stepsCache[number] = steps
    
    return steps
}

func longestCollatzSequence(maxNumber:Int) -> (number:Int, steps:Int) {
    var collatzSequence = (number:0, steps:0)
    var stepsCache:[Int] = [Int](count: maxNumber, repeatedValue: 0)
    stepsCache[1] = 1
    
    for var number = 2; number < maxNumber; number++ {

        let steps = collatzLength(number, &stepsCache)
        if steps > collatzSequence.steps {
            collatzSequence = (number, steps)
        }
    }
    
    return collatzSequence
}

func euler14() {

    let result = longestCollatzSequence(999_999)
    println(result.number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler14)


