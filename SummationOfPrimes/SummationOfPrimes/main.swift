//
//  main.swift
//  SummationOfPrimes
//
//  Created by Mehdi Sqalli on 24/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

func isPrime(number:Int) -> Bool {

    if number == 1 {
        return false
    }
    else if number < 4 {
        return true
    }
    else if number % 2 == 0 {
        return false
    }
    else if number < 9 {
        return true
    }
    else if number % 3 == 0 {
        return false
    }
    else {
        let maxPrime = Int(ceil(sqrt(Double(number))))

        for var i = 5; i <= maxPrime; i += 6 {
            if number % i == 0  || number % (i + 2) == 0 {
                return false
            }
        }
    }

    return true
}

func getSommationOfPrimesUntil(number:Int) -> Int {

    var sum = 2

    for var i = 3; i < number; i += 2 {
        if isPrime(i) {
            sum += i
        }
    }

    return sum
}

func euler10() {
    let number = getSommationOfPrimesUntil(2_000_000)
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler10)

// 1.05 s

