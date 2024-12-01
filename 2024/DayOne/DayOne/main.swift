//
//  main.swift
//  DayOne
//
//  Created by Vincent Snow on 12/1/24.
//

import Foundation

let testInput = """
3   4
4   3
2   5
1   3
3   9
3   3
"""
let lines = input.components(separatedBy: "\n")
var first: [Int] = []
var second: [Int] = []
var sum = 0
var sum2 = 0
for line in lines {
    let parts = line.components(separatedBy: "   ")
    first.append(Int(parts[0])!)
    second.append(Int(parts[1])!)
}
first.sort();second.sort();
for i in 0..<first.count {
    sum+=abs(first[i]-second[i])
}
print(sum)

let mappedItems = second.map { ($0, 1) }
let counts = Dictionary(mappedItems, uniquingKeysWith: +)

for i in first {
    if counts[i] != nil {
        sum2 += i * counts[i]!
    }
}
print(sum2)
