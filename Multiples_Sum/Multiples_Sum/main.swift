//
//  main.swift
//  Multiples_Sum
//
//  Created by Mehdi Sqalli on 20/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

let LOW_INTERVAL = 0
let UPPER_INTERVAL = 1000 // Not Included

/* Using filter and reduce.
*/

func checkIfMultipleOf(number:Int, multiples:[Int]) -> Bool {
    return multiples.reduce(false, combine: { (result, multiple) -> Bool in
        return result || number % multiple == 0
    })
}

let result = [Int](1..<1000).filter() { checkIfMultipleOf($0, [3, 5]) }.reduce(0) {$0 + $1}
println(result)

/* Normal iterative

let multiples = [0, 3, 5]

var multipleOf:[Int] = []
for var i = LOW_INTERVAL; i < UPPER_INTERVAL; i++ {
    
    Loop: for multiple in multiples {
        
        if multiple == 0 || multiple == 1 {
            continue Loop
        }
        if i % multiple == 0 {
            if contains(multipleOf, i) == false {
                multipleOf.append(i)
            }
        }
    }
}

let result = multipleOf.reduce(0, combine: +)

println(result)
*/