//
//  main.swift
//  SmallestMultiple
//
//  Created by Mehdi Sqalli on 21/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

func getSmallestMultiple() {
    
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
    
    println(result)
}

func printTimeElapsedWhenRunningCode(title:String, operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed for \(title): \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode("Smallest Multiple", getSmallestMultiple)


