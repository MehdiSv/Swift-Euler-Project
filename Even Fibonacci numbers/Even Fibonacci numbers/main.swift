//
//  main.swift
//  Even Fibonacci numbers
//
//  Created by Mehdi Sqalli on 20/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

let FIB_MAX = 4000000

struct NextFibNumber : SequenceType {
    
    func generate() -> GeneratorOf<Int> {
        var beforeLast = 1
        var last = 1
        
        return GeneratorOf<Int> {
            let total = beforeLast + last
            if total >= FIB_MAX {
                return nil
            }
            
            beforeLast = last
            last = total
            
            return total
        }
    }
}

func evenFibonacciNumbers() -> Int {
    
    let fibSeq = lazy(NextFibNumber())
    return reduce(fibSeq.filter() {$0 % 2 == 0}, 0, {$0 + $1})
    
}

func euler2() {
    
    let result = evenFibonacciNumbers()
    
    println(result)
}

func printTimeElapsedWhenRunningCode(operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed for : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler2)
