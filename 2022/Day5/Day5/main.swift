//
//  main.swift
//  Day5
//
//  Created by Vincent Snow on 12/6/22.
//

import Foundation

let testInput = """
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"""
var temp = input.replacingOccurrences(of: "[", with: "")
temp = temp.replacingOccurrences(of: "]", with: "")
let x = temp.components(separatedBy: "\n\n")
let rows = x[0].components(separatedBy: "\n")
var insts: [[Int]] = []
let y = x[1].components(separatedBy: "\n")


for i in y {
    var strip = i.replacingOccurrences(of: "move", with: "")
    strip = strip.replacingOccurrences(of: "from", with: "")
    strip = strip.replacingOccurrences(of: "to", with: "")
    strip.removeFirst()
    let sani = strip.components(separatedBy: " ")
    var n: [Int] = []
jloop: for j in sani {
    if j.isEmpty {
        continue jloop
    }
        n.append(Int(String(j))!)
    }
    insts.append(n)
}

var stacks: [[Character]] = []
var stacks2 = stacks
let end = rows.endIndex-1
let last = Int(String(rows[end].last!))!
for _ in 0...last-1 {
    stacks.append([])
}
for crates in rows {
    var ind = 0
    var whitespace = 0
    if crates == rows.last! {
        break
    }
    for crate in crates {
        if crate.isWhitespace {
            whitespace+=1
        } else {
            stacks[ind].append(crate)
            whitespace = 0
            ind+=1
        }
        if whitespace == 4 {
            ind+=1
            whitespace = 0
        }
    }
}

stacks2 = stacks



for inst in insts {
    let c = inst[0]
    let fromInd = inst[1]-1
    let toInd = inst[2]-1
    for ind in 0...c-1 {
        stacks[toInd].insert(stacks[fromInd][ind], at: 0)
    }
    stacks[fromInd].removeSubrange(0...c-1)
}

for i in 0..<stacks2.count {
    stacks2[i] = stacks2[i].reversed()
}

for inst in insts {
    let c = inst[0]
    let fromInd = inst[1]-1
    let toInd = inst[2]-1
    let end = stacks2[fromInd].count-1
    let fromRange = end-(c-1)...end
    stacks2[toInd]+=stacks2[fromInd][fromRange]
    stacks2[fromInd].removeSubrange(fromRange)
}


let tops = stacks.map { $0.first! }
let tops2 = stacks2.map { $0.last! }
print(String(tops))
print(String(tops2))
