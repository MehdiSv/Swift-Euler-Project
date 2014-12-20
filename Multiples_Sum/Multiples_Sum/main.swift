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