//
//  main.swift
//  SpecialPythagoreanTriplet
//
//  Created by Mehdi Sqalli on 24/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

func getSpecialPythagoreanTriplet(sum:Int) -> Int {
    
    for var a = 1; a <= (sum - 3) / 3; a++ {
        for var b = a + 1; b <= (sum - 1 - a) / 2; b++ {
            var c = sum - a - b
            if a * a + b * b == c * c {
                return a * b * c
            }
        }
    }
    return -1
}

func euler9() {
    let number = getSpecialPythagoreanTriplet(1000)
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler9)
