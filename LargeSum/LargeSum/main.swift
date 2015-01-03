//
//  main.swift
//  LargeSum
//
//  Created by Mehdi Sqalli on 01/01/2015.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation

func addToResult(inout results:[Int], var addResult:Int, index:Int) {
    
    if index == results.count {
        results.append(0)
    }
    
    addResult = results[index] + addResult
    
    var result = addResult % 10
    
    results[index] = result
    
    var retain = addResult / 10
    if retain > 0 {
        addToResult(&results, retain, index + 1)
    }
}

func add(inout left:[Int], right:[Int]) {
    
    var index = max(left.count, right.count)
    
    var i = 0
    while i < index {
        
        let leftNumber = i >= left.count ? 0 : left[i]
        let rightNumber = i >= right.count ? 0 : right[i]

        let addResult = leftNumber + rightNumber
        addToResult(&left, rightNumber, i)

        i++
    }
}

func largeSum(numbers:[String]) -> String {
    
    var result:[Int] = []
    for number in numbers {
        
        let num = stringToIntArray(number)
        add(&result, num)
    }
    
    return "".join(result.reverse().map() { String($0) } )
}

func stringToIntArray(str : String) -> [Int] {
    var num : [Int] = []
    let unicodeDigitZero = 48
    
    for digit in str.unicodeScalars {
        num.append(Int(digit.value) - unicodeDigitZero)
    }
    
    return reverse(num)
}

func euler13() {
    let path = NSBundle.mainBundle().pathForResource("numbers", ofType: "txt")!
    let data = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
    let numbers = data.componentsSeparatedByString("\n") as [String]

    let result = largeSum(numbers)
    
    println(result[result.startIndex ..< advance(result.startIndex, 10)])
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler13)
