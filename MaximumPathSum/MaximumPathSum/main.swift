//
//  main.swift
//  MaximumPathSum
//
//  Created by Mehdi Sqalli on 04/01/2015.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation

/*

      3
    10 7
    2 4 6
   8 5 9 3

*/

func maxNumberOutOfTwoBoxes(pyramidLine:[Int], columnNumber:Int) -> Int {
    
    let left = columnNumber > 0 ? pyramidLine[columnNumber - 1] : 0
    let right = columnNumber < pyramidLine.count ? pyramidLine[columnNumber] : 0
    
    return max(left, right)
}

func maximumPathSum(var pyramid:[[Int]]) -> Int {

    precondition(pyramid.count > 0, "pyramid must be at least two lines")
    
    for lineNumber in 1 ..< pyramid.count {
        
        for columnNumber in 0 ..< pyramid[lineNumber].count {
            
            pyramid[lineNumber][columnNumber] += maxNumberOutOfTwoBoxes(pyramid[lineNumber - 1], columnNumber)
            
        }
        
    }

    return maxElement(pyramid[pyramid.count - 1])
}

func euler18() {
    
    let path = NSBundle.mainBundle().pathForResource("pyramid", ofType: "txt")!
    let data = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
    let pyramidLines:[String] = data.componentsSeparatedByString("\n") as [String]
    
    let pyramid:[[Int]] = pyramidLines.map() { split($0) { $0 == " " }.map() { $0.toInt()! } }
    
    let result = maximumPathSum(pyramid)
    
    println(result)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler18)

// 0.01s