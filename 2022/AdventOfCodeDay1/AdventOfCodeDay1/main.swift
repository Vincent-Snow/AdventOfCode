//
//  main.swift
//  AdventOfCodeDay1
//
//  Created by Vincent Snow on 12/5/22.
//

import Foundation

let testInput = """
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""

var h = 0
var elvesTotal: [Int] = []
let elves = input.components(separatedBy: "\n\n")
for i in elves {
    let elf = i.components(separatedBy: "\n").map({ Int($0)! })
    let t = elf.reduce(0, +)
    elvesTotal.append(t)
}
elvesTotal = elvesTotal.sorted()
let end = elvesTotal.endIndex-1
print(elvesTotal[end])
print(elvesTotal[end]+elvesTotal[end-1]+elvesTotal[end-2])

