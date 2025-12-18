//
//  main.swift
//  Day7
//
//  Created by Vincent Snow on 12/21/24.
//

import Foundation

let testInput = """
190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20
"""

var max = 0
let lines = input.components(separatedBy: "\n")
var perms: [[String]] = []
for i in 1...12 {
    
}
for line in lines {
    let equation = line.components(separatedBy: ": ")
    let answer = Int(equation[0])!
    let numbers = equation[1].components(separatedBy: " ").map({Int($0)!})
    if numbers.count > max {
        max = numbers.count
        print(max)
    }
    var a = 0
    for i in numbers {
        a += i
    }
}

