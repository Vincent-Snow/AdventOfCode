//
//  main.swift
//  Day9
//
//  Created by Vincent Snow on 12/9/23.
//

import Foundation

let testinput = """
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
"""
func seque(_ seq: [Int]) -> [Int] {
    var an: [Int] = []
    for ind in 0..<seq.count-1 {
        let a = seq[ind], a_n1 = seq[ind+1]
        an.append(a_n1-a)
    }

    return an
}
func seque2(_ seq: [Int]) -> [Int] {
    var an: [Int] = []
    var next = 0
    for ind in 0..<seq.count {
        let a = seq[ind]
        let diff = a-next
        an.append(diff)
        next=diff
    }
    return an
}
var c = 0, s = 0
let lines = input.components(separatedBy: "\n")
for line in lines {
    var seq = line.components(separatedBy: " ").map({Int(String($0))!})
    var last: [Int] = []
    while seq.reduce(0, +) != 0 {
        last.append(seq.last!)
        seq = seque(seq)
    }    c += last.reduce(0, +)
}
print(c)
for line in lines {
    var seq = line.components(separatedBy: " ").map({Int(String($0))!})
    var first: [Int] = []
    while seq.reduce(0, +) != 0 {
        first.insert(seq.first!, at: 0)
        seq = seque(seq)
    }
    s += seque2(first).last!
}
print(s)

