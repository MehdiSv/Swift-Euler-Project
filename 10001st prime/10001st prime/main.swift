//
//  main.swift
//  10001st prime
//
//  Created by Mehdi Sqalli on 23/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

/*  Using the isPrimeMethod */

func isPrime(number:Int, primes: [Int]) -> Bool {
    
    let maxPrime = Int(ceil(sqrt(Double(number))))
    for prime in primes {
        if prime > maxPrime {
            break
        }
        if number % prime == 0 {
            return false
        }
    }
    return true
}

func nThPrime(var n : Int) -> Int {
    
    assert(n > 0, "argument must be positive")
    
    var primes = [2, 3]
    
    if n <= primes.count {
        return primes[n - 1]
    }
    
    var number = primes.last!
    n -= primes.count
    
    while n > 0 {
        number += 2
        if isPrime(number, primes) {
            primes.append(number)
            n--
        }
    }
    
    return number
}

/* */


/*  Using the Sieve of Eratosthenes */

func nthPrime(var n : Int) -> Int {
    
    assert(n > 0, "argument must be positive")
    
    // The below estimate is only valid for n > 6:
    if n <= 6 {
        return [2, 3, 5, 7, 11, 13][n-1]
    }
    
    // Upper bound from http://en.wikipedia.org/wiki/Prime_number_theorem#Approximations_for_the_nth_prime_number:
    let d = Double(n)
    let upperBound = Int(d * (log(d) + log(log(d))))
    
    var composite = [Bool](count: upperBound + 1, repeatedValue: false)
    
    var x = 2
    let maxPrime = Int(ceil(sqrt(Double(upperBound))))
    
    while x <= maxPrime {
        if !composite[x] {
            if (--n == 0) {
                return x
            }
            for var y = x * x; y <= upperBound; y += x {
                composite[y] = true
            }
        }
        x++
    }
    while x <= upperBound {
        if !composite[x] {
            if (--n == 0) {
                return x
            }
        }
        x++
    }
    
    assertionFailure("Fatal error")
    return -1
}

func euler7() {
    let number = nthPrime(13)
    
    println(number)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler7)
