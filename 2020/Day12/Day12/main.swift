//
//  main.swift
//  Day12
//
//  Created by Vincent Snow on 11/11/24.
//

import Foundation

let testInput = """
F10
N3
F7
R90
F11
"""

let lines = input.components(separatedBy: "\n")
var directionsDict: [String:Int] = [:]
var d2: [String:Int] = [:]
var way: [String:Int] = [:]
let d = ["N","S","E","W"]
for i in d {
    directionsDict[i] = 0
    d2[i] = 0
    way[i] = 0
}
way["N"] = 1
way["E"] = 10

var current = "E"
var orient = 0
for i in lines {
    if orient == 0 {
        current = "E"
    } else if orient == 90 {
        current = "N"
    } else if orient == 180 {
        current = "W"
    } else if orient == 270 {
        current = "S"
    } else {
        print("this is broken!")
    }
    let first = String(i.first!)
    var str = i
    str.removeFirst()
    let num = Int(str)!
    if first == "R" {
        orient -= num
        while (orient < 0) {
            orient+=360
        }
        orient %= 360
        continue
    } else if first == "L" {
        orient += num
        orient %= 360
        continue
    }
    
    if first == "F" {
        directionsDict[current]! += num
    } else {
        directionsDict[first]! += num
    }
}
let ew = abs(directionsDict["E"]!-directionsDict["W"]!)
let ns = abs(directionsDict["N"]!-directionsDict["S"]!)
print(ew + ns)


for i in lines {
    let first = String(i.first!)
    var str = i
    str.removeFirst()
    let num = Int(str)!
    if first == "F"{
        for i in d {
            d2[i]! += way[i]! * num
        }
        
        continue
    }
    if first == "L" || first == "R" {
        let t = (first, num)
        switch t {
        case ("L",90),("R",270):
            let temp = way["E"]!
            way["E"] = way["S"]!
            way["S"] = way["W"]!
            way["W"] = way["N"]!
            way["N"] = temp
        case ("L",180),("R",180):
            let temp1 = way["E"]!
            let temp2 = way["N"]!
            way["E"] = way["W"]!
            way["W"] = temp1
            way["N"] = way["S"]
            way["S"] = temp2
        case ("L",270),("R",90):
            let temp = way["E"]!
            way["E"] = way["N"]!
            way["N"] = way["W"]!
            way["W"] = way["S"]!
            way["S"] = temp
        default:
            print("whats up with this?")
        }
        continue
    }
    way[first]! += num
}
let ew2 = abs(d2["E"]!-d2["W"]!)
let ns2 = abs(d2["N"]!-d2["S"]!)
print(ew2 + ns2)
