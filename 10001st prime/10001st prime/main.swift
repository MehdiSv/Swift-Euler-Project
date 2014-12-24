//
//  main.swift
//  10001st prime
//
//  Created by Mehdi Sqalli on 23/12/14.
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
        
        for i in stride(from: 5, through: maxPrime, by: 6) {
            if number % i == 0  || number % (i + 2) == 0 {
                return false
            }
        }
    }
    
    return true
}

func getNumberForXthPrime(prime:Int) -> Int {
    
    var xThPrime = prime - 1 // We skip the prime 2 with the += 2
    var number = 1
    
    while xThPrime > 0 {
        
        number += 2
        if isPrime(number) {
            xThPrime--
        }
    }
    
    return number
}

func printTimeElapsedWhenRunningCode(operation:(xThPrime:Int) -> Int) {
    let startTime = CFAbsoluteTimeGetCurrent()
    let number = operation(xThPrime: 10_001)
    println(number)
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(getNumberForXthPrime)
