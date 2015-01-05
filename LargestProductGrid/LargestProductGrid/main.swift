//
//  main.swift
//  LargestProductGrid
//
//  Created by Mehdi Sqalli on 25/12/14.
//  Copyright (c) 2014 MNT Developpement. All rights reserved.
//

import Foundation

let ADJACENT_NUMBERS = 4

func getIntsForLine(str:String) -> [Int] {
    
    var intArr:[Int] = []
    
    let stringArr = split(str) { $0 == " " }
    for numString in stringArr {
        intArr.append(numString.toInt()!)
    }
    
    return intArr
}

class Direction {
    
    enum Dir {
        
        case Right, Down, DiagRight, DiagDown
        
    }
    
    let dir:Dir!
    var x = 0
    var y = 0
    var number = 1
    var products:[Int] = [1, 1, 1, 1]
    let grid:[[Int]]!
    
    init(dir:Dir, grid:[[Int]]) {
        
        self.dir = dir
        self.grid = grid
        
        if dir == .DiagDown {
            x = ADJACENT_NUMBERS - 1
            y = 0
        } else if dir == .DiagRight {
            x = 0
            y = grid.count - ADJACENT_NUMBERS
        }
    }
    
    func isFirstColumn(x:Int) -> Bool {
        if x == 0 {
            number = 1
            products = [1, 1, 1, 1]
            return true
        }
        
        return false
    }
    
    func isFirstLine(y:Int) -> Bool {
        if y == 0 {
            number = 1
            products = [1, 1, 1, 1]
            return true
        }
        
        return false
    }
    
    func isLastColumn(line:[Int], x:Int) -> Bool {
        if x == line.count {
            number = 1
            products = [1, 1, 1, 1]
            return true
        }
        
        return false
    }
    
    func isLastLine(y:Int) -> Bool {
        if y == grid.count {
            number = 1
            products = [1, 1, 1, 1]
            return true
        }
        
        return false
    }
    
    func edgeCases() -> Int? {
        
        switch dir! {
        case .Right:
            if isLastColumn(grid[y], x: x) {
                if isLastLine(y + 1) {
                    return nil
                }
                x = 0
                y++
                return grid[y][x]
            }
            
        case .Down:
            if isLastLine(y) {
                if isLastColumn(grid[y - 1], x: x + 1) {
                    return nil
                }
                y = 0
                x++
                return grid[y][x]
            }
            
        case .DiagRight:
            if isLastColumn(grid[y - 1], x: x) {
                if y == ADJACENT_NUMBERS {
                    return nil
                }
                x = grid.count - y + 1
                y = 0
                return grid[y][x]
            } else if isLastLine(y) {
                y = grid.count - x - 1
                x = 0
                return grid[y][x]
            }
            
        case .DiagDown:
            if isLastLine(y) {
                if x == grid.count - ADJACENT_NUMBERS {
                    return nil
                }
                y = x + 2
                x = grid.count - 1
                return grid[y][x]
            } else if isFirstColumn(x + 1) {
                x = y + 1
                y = 0
                return grid[y][x]
            }
        }
        
        return grid[y][x]
    }
    
    func getNextCase() -> Int? {
        
        switch dir! {
        case .Right:
            x++
            return edgeCases()
            
        case .Down:
            y++
            return edgeCases()
            
        case .DiagRight:
            x++
            y++
            return edgeCases()
            
        case .DiagDown:
            x--
            y++
            return edgeCases()
        }
    }
    
}

func largestProductInGrid(grid:[[Int]]) -> Int {
    var maxNumber = 0
    let directions =
    [
        Direction(dir: .Right, grid: grid),
        Direction(dir: .Down, grid: grid),
        Direction(dir: .DiagRight, grid: grid),
        Direction(dir: .DiagDown, grid: grid),
    ]
    
    var saveHigherAdd:[Int] = []
    for direction in directions {
        
        var boxNumber:Int? = grid[direction.y][direction.x]
        
        do {
            
            let divideBy = direction.products.removeAtIndex(0)
            direction.products.append(boxNumber!)

            direction.number -= divideBy
            direction.number += direction.products[ADJACENT_NUMBERS - 1]
//            if divideBy != 0 {
//                direction.number /= divideBy
//                direction.number *= direction.products[ADJACENT_NUMBERS - 1]
//            } else {
//                direction.number = direction.products.reduce(1) { $0 * $1 }
//            }
            
            if direction.number > maxNumber {
                maxNumber = direction.number
                saveHigherAdd = direction.products
            }
            
            boxNumber = direction.getNextCase()
        } while ( boxNumber != nil )
    }
    
    let toto = saveHigherAdd.reduce(0) { $0 * $1 }
    
    
    return toto
}


func euler11() {
    let str:[String] = [
        "08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08",
        "49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00",
        "81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65",
        "52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91",
        "22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80",
        "24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50",
        "32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70",
        "67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21",
        "24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72",
        "21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95",
        "78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92",
        "16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57",
        "86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58",
        "19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40",
        "04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66",
        "88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69",
        "04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36",
        "20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16",
        "20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54",
        "01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48"
    ]
    
    let grid:[[Int]] = str.map() { return getIntsForLine($0) }
    let result = largestProductInGrid(grid)
    println(result)
}

func printTimeElapsedWhenRunningCode(operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(euler11)

// 0.00710999965667725
