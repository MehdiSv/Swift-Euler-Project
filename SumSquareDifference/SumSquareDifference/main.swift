//
//  main.swift
//  SumSquareDifference
//
//  Created by Mehdi Sqalli on 23/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

func getSumSquareDifference() {
    let firstNumbers = [Int](1...100)
    
    let sum = firstNumbers.reduce(0) { $0 + $1 }
    let squaresSum = sum * sum
    
    let sumSquares = firstNumbers.reduce(0) { $0 + $1 * $1 }
    
    let result =  squaresSum - sumSquares
    println(result)
}

func printTimeElapsedWhenRunningCode(operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

/* fastest way */

func fastestWay() {
    
    let limit = 100
    let sum = limit * (limit + 1) / 2
    let sum_sq = (2 * limit + 1) * (limit + 1) * limit / 6
    println(sum * sum - sum_sq)
}

/* */

printTimeElapsedWhenRunningCode(fastestWay)
