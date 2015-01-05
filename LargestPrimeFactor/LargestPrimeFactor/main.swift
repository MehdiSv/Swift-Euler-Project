//
//  main.swift
//  LargestPrimeFactor
//
//  Created by Mehdi Sqalli on 20/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

let NUMBER = 441

extension Int {
    func isMultipleOf(factor: Int) -> Bool {
        return self % factor  == 0
    }
}

func findLargestPrimeFactorFrom(let smallest: Int, let toFactor: Int) -> Int {
    var maxFactor = Int(sqrt(Double(toFactor)))
    maxFactor = maxFactor < smallest ? smallest : maxFactor
    for factor in smallest...maxFactor {
        if toFactor.isMultipleOf(factor) {
            println(factor)
            return findLargestPrimeFactorFrom(factor, toFactor/factor)
        }
    }
    
    return toFactor
}

func euler3() {
    
    let largestPrime = findLargestPrimeFactorFrom(2, NUMBER)
    
    println(largestPrime)
}

func printTimeElapsedWhenRunningCode(operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler3)
