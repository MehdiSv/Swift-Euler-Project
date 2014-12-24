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

func printTimeElapsedWhenRunningCode(operation:(Int) -> Int) {
    let startTime = CFAbsoluteTimeGetCurrent()
    let number = operation(1_000)
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println(number)
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(getSpecialPythagoreanTriplet)

// 2.3961067199707e-05 s
