//
//  main.swift
//  CountingLatticePaths
//
//  Created by Mehdi Sqalli on 01/01/2015.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation

func latticePaths(gridSize:Int) -> Int {
    
    var result = 1
    for i in 1 ... gridSize {
        result = result * (gridSize + i) / i
    }
    
    return result
}

func euler15() {
    
    let number = latticePaths(20)
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler15)


