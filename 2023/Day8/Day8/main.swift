//
//  main.swift
//  Day8
//
//  Created by Vincent Snow on 12/7/23.
//

import Foundation
let star = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(star)
}


let testinput1 = """
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
"""
let test2input = """
LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)
"""
let test3input = """
LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)
"""


let lines = input.components(separatedBy: "\n\n")
var inst = lines[0]
inst = inst.replacingOccurrences(of: "R", with: "1"); inst = inst.replacingOccurrences(of:"L", with: "0");
let arr = inst.map({String($0)})
let paths = lines[1].components(separatedBy: "\n")
var pathDict: [String: (String,String)] = [:]
var start = "AAA"
let end = "ZZZ"
var s = 0

for p in paths {
    var k = p.components(separatedBy: " = ")
    let key = k[0]
    k[1].removeFirst(); k[1].removeLast();
    let next = k[1].components(separatedBy: ", ")
    pathDict[key] = (next[0],next[1])
}
for i in pathDict {
    print(i)
}
l: while start != end {
    
    for i in arr {
        let path = pathDict[start]!
        if i == "0" {
            start = path.0
            s+=1
            if start == end { break l }
        } else if i == "1" {
            start = path.1
            s+=1
            if start == end { break l }
        } else {
        }
    }
}
print(start,end,s,t())
