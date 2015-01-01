//
//  main.swift
//  HighlyDivisibleTriangularNumber
//
//  Created by Mehdi Sqalli on 31/12/2014.
//  Copyright (c) 2014 Mehdi Sqalli. All rights reserved.
//

import Foundation

let OverNumberOfDivisors = 500

extension Int {
    func isMultipleOf(factor: Int) -> Bool {
        return self % factor == 0
    }
}

func findPrimesFactorFrom(let smallest: Int, let toFactor: Int, inout primesFactor:[Int:Int]) {
    var maxFactor = Int(sqrt(Double(toFactor)))
    maxFactor = maxFactor < smallest ? smallest : maxFactor
    for factor in smallest...maxFactor {
        if toFactor.isMultipleOf(factor) {
            primesFactor[factor] = (primesFactor[factor] ?? 0) + 1
            return findPrimesFactorFrom(factor, toFactor / factor, &primesFactor)
        }
    }
    
    primesFactor[toFactor] = (primesFactor[toFactor] ?? 0) + 1
}

func highlyDivisibleTriangularNumber() -> Int {

    var currentNumberOfDivisors = 1
    var triangleNumber = 1
    var number = 1
    
    var primesFactor:[Int:Int] = [:]
    
    while OverNumberOfDivisors >= currentNumberOfDivisors {
        
        number++
        triangleNumber += number
        primesFactor = [:]
     
        findPrimesFactorFrom(2, triangleNumber, &primesFactor)

        currentNumberOfDivisors = 1
        for (index, factor) in primesFactor {
            if index != 1 {
                currentNumberOfDivisors *= (factor + 1)
            }
        }
    }
    
    return triangleNumber
}

func euler11() {
    let number = highlyDivisibleTriangularNumber()
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler11)

