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
func gcd(_ m: Int, _ n: Int) -> Int {
    let r: Int = m % n
    if r != 0 {
        return gcd(n, r)
    } else {
        return n
    }
}
func lcm(_ m: Int, _ n: Int) -> Int {
  return m / gcd(m, n) * n
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
var c = 0
var aArr: [String] = []
var zArr: [String] = []

for p in paths {
    var k = p.components(separatedBy: " = ")
    let key = k[0]
    k[1].removeFirst(); k[1].removeLast();
    let next = k[1].components(separatedBy: ", ")
    pathDict[key] = (next[0],next[1])
}
for i in pathDict.keys {
    if i[2] == "A" {
        aArr.append(i)
    }
    if i[2] == "Z" {
        zArr.append(i)
    }
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

var lcm: [Int] = []
    for asdf in aArr {
    var asdf = asdf
    var count = 0
    l: while !zArr.contains(asdf) {
        for i in arr {
            count+=1
                let path = pathDict[asdf]!
                if i == "0" {
                    asdf = path.0
                } else if i == "1" {
                    asdf = path.1
                }
                if zArr.contains(asdf) { break l }
        }
    }
    lcm.append(count)
    }
var prod = 1
for i in lcm {
    prod = lcm(prod,i)
}

print(prod,t())
