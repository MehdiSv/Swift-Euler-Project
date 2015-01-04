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

func mult(left:String, right:String) -> String {
    
    var results:[Int] = [Int]()
    for (j, rightChar) in enumerate(reverse(right)) {
     
        let rightNumber = String(rightChar).toInt()!
        
        for (i, leftChar) in enumerate(reverse(left)) {
            
            let leftNumber = String(leftChar).toInt()!
            
            let mulResult = leftNumber * rightNumber
            addMulToResult(&results, mulResult, i + j)
        }
    }
    
    return "".join(results.reverse().map() { String($0) } )
}

func powS(x:String, var power:Int) -> String {
    
    var result = x
    while power > 1 {

        result = mult(result, x)
        power--
    }
    
    return result
}

func powerDigitSum(x:String, var power:Int) -> Int {
    let powerSum =  powS(x, power)
    
    let result = reduce(powerSum, 0) { (result, char) -> Int in
        return String(char).toInt()! + result
    }
    
    return result
}

func euler16() {
    
    let number = powerDigitSum("2", 1000)
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler16)
