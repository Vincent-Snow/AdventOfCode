//
//  main.swift
//  Day2
//
//  Created by Vincent Snow on 12/7/23.
//

import Foundation

let testinput = """
2x3x4
1x1x10
"""
let a = input.components(separatedBy: "\n")
func p1(_ a:[String]) -> Int {
    var s = 0
    for i in a {
        let d = i.components(separatedBy: "x").map({Int($0)!}).sorted()
        s += [d[0]*d[1],d[0]*d[2],d[1]*d[2]].map({$0*2}).reduce(0, +) + d[0]*d[1]
    }
    return s
}
func p2(_ a:[String]) -> Int {
    var s = 0
    for i in a {
        let d = i.components(separatedBy: "x").map({Int($0)!}).sorted()
        s += 2*(d[0]+d[1])+d.reduce(1, *)
    }
    return s
}
print(p1(a),p2(a))
