//
//  main.swift
//  LargestPrimeFactor
//
//  Created by Mehdi Sqalli on 20/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

let NUMBER = Int.max

func largestPrimeFactor() -> Int {
    
    var maxNumber = NUMBER
    loop: for var factor = 2; factor <  maxNumber;factor++ {
        
        if maxNumber == factor {
            break
        }
        if maxNumber % factor == 0 {
            maxNumber /= factor
            factor = 2
        }
        
    }
    
    return maxNumber
}

func euler3() {
    
    let largestPrime = largestPrimeFactor()
    
    println(largestPrimeFactor)
}

func printTimeElapsedWhenRunningCode(operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler3)
