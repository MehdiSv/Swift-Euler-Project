//
//  main.swift
//  SumSquareDifference
//
//  Created by Mehdi Sqalli on 23/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

func sumSquareDifference() -> Int {
    
    let limit = 100
    let sum = limit * (limit + 1) / 2
    let sum_sq = (2 * limit + 1) * (limit + 1) * limit / 6
    return sum * sum - sum_sq
}


func euler6() {
    
    let result = sumSquareDifference()
    
    println(result)
}

func printTimeElapsedWhenRunningCode(operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed for : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler6)
