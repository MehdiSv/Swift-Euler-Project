//
//  main.swift
//  Multiples_Sum
//
//  Created by Mehdi Sqalli on 20/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

let LOW_INTERVAL = 0
let UPPER_INTERVAL = 1000 // Not Included

func checkIfMultipleOf(number:Int, multiples:[Int]) -> Bool {
    return multiples.reduce(false, combine: { (result, multiple) -> Bool in
        return result || number % multiple == 0
    })
}

func multiplesSum() -> Int {
    return [Int](1..<1000).filter() { checkIfMultipleOf($0, [3, 5]) }.reduce(0) {$0 + $1}
}

func euler1() {
    
    let result = multiplesSum()
    
    println(result)
}

func printTimeElapsedWhenRunningCode(operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed for : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler1)
