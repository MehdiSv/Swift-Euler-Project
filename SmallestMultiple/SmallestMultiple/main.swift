//
//  main.swift
//  SmallestMultiple
//
//  Created by Mehdi Sqalli on 21/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

func smallestMultiple() -> Int {
    
    var result = 1
    var ranges = [Int](1...20)
    
    for var i = 0; i < ranges.count; ++i {
        
        result *= ranges[i]
        
        for var j = i + 1; j < ranges.count; ++j {
            if ranges[j] % ranges[i] == 0 {
                ranges[j] = ranges[j] / ranges[i]
            }
        }
        
    }
    
    return result
}

func euler5() {
    
    let result = smallestMultiple()
    
    println(result)
}

func printTimeElapsedWhenRunningCode(operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed for : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler5)
