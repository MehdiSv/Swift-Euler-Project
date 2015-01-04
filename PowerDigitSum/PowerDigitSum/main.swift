//
//  main.swift
//  PowerDigitSum
//
//  Created by Mehdi Sqalli on 02/01/2015.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation

func addMulToResult(inout results:[Int], var mulResult:Int, index:Int) {
    
    if index == results.count {
        results.append(0)
    }
    
    mulResult = results[index] + mulResult
    
    var result = mulResult % 10

    results[index] = result
    
    var retain = mulResult / 10
    if retain > 0 {
        addMulToResult(&results, retain, index + 1)
    }
}

func infMult(left:[Int], right:[Int]) -> [Int] {
    
    var results:[Int] = [Int]()
    for (j, rightNumber) in enumerate(reverse(right)) {
        
        for (i, leftNumber) in enumerate(reverse(left)) {
            
            let mulResult = leftNumber * rightNumber
            addMulToResult(&results, mulResult, i + j)
        }
    }
    
    return results.reverse()
}

func infPow(x:Int, var power:Int) -> [Int] {
    
    var result = [1]
    var xArray = intToIntArray(x)
    while power > 0 {
        
        result = infMult(result, xArray)
        power--
    }
    
    return result
}

func intToIntArray(var number:Int) -> [Int] {
    var intArray:[Int] = []
    
    while number > 0 {
        
        intArray.append(number % 10)
        number /= 10
    }
    
    return intArray.reverse()
}

func powerDigitSum(x:Int, var power:Int) -> Int {
    let powerSum = infPow(x, power)
    
    let result = reduce(powerSum, 0) { $0 + $1 }
    
    return result
}

func euler16() {
    
    let number = powerDigitSum(2, 1000)
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler16)
