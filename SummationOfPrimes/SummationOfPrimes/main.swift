//
//  main.swift
//  SummationOfPrimes
//
//  Created by Mehdi Sqalli on 24/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

func summationOfPrimesBelow(var n:Int) -> Int {

    assert(n > 0, "argument must be positive")
    
    if n == 2 {
        return 1
    }
    
    var composite = [Bool](count: n, repeatedValue: false)
    let maxPrime = Int(ceil(sqrt(Double(n))))
    
//    var x = 2
//    
//    
//    while x <= maxPrime {
//        if composite[x] == false {
//            for y in stride(from: x * x, through: n - 1, by: x) {
//                composite[y] = true
//            }
//        }
//        x++
//    }
//
//    var result = 0
//    for i in stride(from: 2, through: composite.count - 1, by: 1) {
//        if composite[i] == false {
//            result += i
//        }
//    }

    var x = 5
    while x <= maxPrime {
        if composite[x] == false {
            for y in stride(from: x * x, through: n - 1, by: x) {
                composite[y] = true
            }
        }
        x+=2
        if x<n && composite[x] == false {
            for y in stride(from: x * x, through: n - 1, by: x) {
                composite[y] = true
            }
        }
        x+=4
    }
    
    var result = 5 // 2 + 3
    for var i = 5; i < composite.count - 1; i += 4 {
        if composite[i] == false {
            result += i
        }
        i+=2
        if x<n && composite[i] == false {
            result += i
        }
    }
    
    return result
}

func euler10() {
    let number = summationOfPrimesBelow(6)
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler10)

// 0.012s

