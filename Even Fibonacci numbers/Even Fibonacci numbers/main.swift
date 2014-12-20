//
//  main.swift
//  Even Fibonacci numbers
//
//  Created by Mehdi Sqalli on 20/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

let FIB_MAX = 4000000

/* Using Lazy and SequenceType. Swift awesomness.
*/

// 1, 2, 3, 5, 8, 13

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

let fibSeq = lazy(NextFibNumber())
let result = reduce(fibSeq.filter() {$0 % 2 == 0}, 0, {$0 + $1})
println(result)

/* iterative way

var fibonacciSeq = [1, 2]

func getNextFibNumber() -> Int {
    
    let lastFibNumber = fibonacciSeq.last!
    let beforeLastFibNumber = fibonacciSeq[fibonacciSeq.count - 2]
    
    return lastFibNumber + beforeLastFibNumber
}

var nextFibNumber = getNextFibNumber()
do {
    fibonacciSeq.append(nextFibNumber)
    nextFibNumber = getNextFibNumber()
}
    while nextFibNumber < FIB_MAX


let result = fibonacciSeq.reduce(0, combine: { (total, fibNumber) -> Int in
    if fibNumber % 2 == 0 {
        return total + fibNumber
    }
    return total
})

println(result)
*/