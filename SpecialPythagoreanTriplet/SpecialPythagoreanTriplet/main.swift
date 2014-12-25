//
//  main.swift
//  SpecialPythagoreanTriplet
//
//  Created by Mehdi Sqalli on 24/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

func getSpecialPythagoreanTriplet(sum:Int) -> Int {
    
    for var c = 2; c < sum; c++ {
        
        for var b = 1;b < c; b++ {
            
            for var a = 0; a < b; a++ {
                
                if (sum % (a + b + c)) == 0 && a * a + b * b == c * c {
                    let minSum = a + b + c
                    a *= sum / minSum
                    b *= sum / minSum
                    c *= sum / minSum
                    return a * b * c
                }
            }
        }
        
    }
    return -1
}

func euler9() {
    let number = getSpecialPythagoreanTriplet(1_000)
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler9)
