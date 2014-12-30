//
//  main.swift
//  LargestPalindromeProduct
//
//  Created by Mehdi Sqalli on 20/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

extension String {
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
}

extension Int {
    
    func isPalindromic() -> Bool {
        
        let string = String(self)
        
        let length = countElements(string)
        if  length % 2 != 0 {
            return false
        }

        for var i = 0; i < length / 2; i++ {
            if string[i] != string[length - 1 - i] {
                return false
            }
        }
        return true
    }
    
}

func highestPalindromicNumber()  -> Int {
    let leftNumber = 999
    let rightNumber = 999
    
    var highestPalindromic = 0
    
    for left in stride(from: 999, through: 100, by: -1) {
        for right in stride(from: 999, through: 100, by: -1) {
            let number = left * right
            if number > highestPalindromic {
                if number.isPalindromic() {
                    highestPalindromic = number
                }
            } else {
                break
            }
        }
    }
    
    return highestPalindromic
}

func euler4() {
    
    let highestPalindrom = highestPalindromicNumber()
    
    println(highestPalindrom)
}

func printTimeElapsedWhenRunningCode(operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed for : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler4)
