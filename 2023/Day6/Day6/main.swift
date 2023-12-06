//
//  main.swift
//  Day6
//
//  Created by Vincent Snow on 12/5/23.
//

import Foundation

let testinput = """
Time:      7  15   30
Distance:  9  40  200
"""
let lines = input.components(separatedBy: "\n")
var time = lines[0].components(separatedBy: " ").map({ Int($0) ?? 0})
time.removeAll(where: { $0==0 })
var distance = lines[1].components(separatedBy: " ").map({ Int($0) ?? 0})
distance.removeAll(where: { $0==0 })
var c = 1
var s = 0
print(time,distance)
for ind in 0..<time.count {
    let t = time[ind]
    var sub = 0
iLoop: for i in 1...t {
        let hold = t-i
        let p = hold*i
        let d = distance[ind]
        if p > d {
            sub = t-i-i+1
            break iLoop
        }
    }
    c*=sub
}
var gs = ""
for i in lines[0].split(separator: ":")[1].components(separatedBy: " ") {
    gs+=i
}
let ts = Int(gs)!
    gs = ""
for i in lines[1].split(separator: ":")[1].components(separatedBy: " ") {
    gs+=i
}
let ds = Int(gs)!

iLoop: for i in 1...ts {
    var n = (ts-i)*i
    if n > ds {
        s = (ts-i-i+1)
        break iLoop
    }
}
//print(ts, ds)
print(c,s)
