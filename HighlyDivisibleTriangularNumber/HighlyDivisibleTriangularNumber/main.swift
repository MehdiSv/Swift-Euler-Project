//
//  main.swift
//  HighlyDivisibleTriangularNumber
//
//  Created by Mehdi Sqalli on 31/12/2014.
//  Copyright (c) 2014 Mehdi Sqalli. All rights reserved.
//

import Foundation

func countDivisors(var n : Int) -> Int {
    
    var numDivisors = 1
    var factor = 2
    
    while factor * factor <= n {
        if n % factor == 0 {
            var exponent = 0
            do {
                exponent++
                n /= factor
            } while n % factor == 0
            numDivisors *= exponent + 1
        }
        factor = factor == 2 ? 3 : factor + 2
    }
    if n > 1 {
        numDivisors *= 2
    }
    
    return numDivisors
}

func highlyDivisibleTriangularNumber(requiredDivisors : Int) -> Int {
    
    var n = 1
    while (countDivisors((n + 1) / 2) * countDivisors(n) < requiredDivisors) {
        n++;
        if (countDivisors(n / 2) * countDivisors(n + 1) >= requiredDivisors) {
            break;
        }
        n++;
    }
    let triangleNumber = n * (n + 1) / 2
    return triangleNumber
}

func euler12() {
    let number = highlyDivisibleTriangularNumber(500)
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler12)

