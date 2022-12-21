//
//  main.swift
//  Day20
//
//  Created by Vincent Snow on 12/20/22.
//

import Foundation

let testInput = """
1
2
-3
3
-2
0
4
"""
var strDict: [String:Bool] = [:]

var cArr = input.components(separatedBy: "\n")
//var arr = cArr.map({Int($0)!})
var arr1: [String] = []
var arr: [String] = []

for i in cArr {
    chLoop: for ch in "abcdefghijklmnopqrstuvw" {
        if strDict[i+String(ch)] != true {
            arr1.append(i+String(ch))
            strDict[i+String(ch)] = true
            break chLoop
        }
    }
    
}
arr = arr1
//for i in arr {
//    print(i)
//}


iLoop: for uni in arr1 {
    let i = Int(uni.dropLast(1))!
    if i == 0 {
        continue iLoop
    }
    let ind = arr.firstIndex(of: uni)!
    arr.remove(at: ind)
    var insertInd: Int
    if ind+i < 0 || ind+i > cArr.count-1 {
        insertInd = ind+i+cArr.count-1
    } else {
        insertInd = ind+i
    }
    while insertInd > cArr.count-1 {
        insertInd-=(cArr.count-1)
    }
    while insertInd < 0 {
        insertInd+=(cArr.count-1)
    }
    if insertInd == 0 {
        arr.append(uni)
    } else {
        arr.insert(uni, at: insertInd)
    }
//    print(arr)
}
let z = Int(arr.firstIndex(of: "0a")!)
let oneK = (1000+z)%arr.count
let twoK = (2000+z)%arr.count
let threeK = (3000+z)%arr.count
let t = Int(arr[oneK].dropLast(1))!
let tt = Int(arr[twoK].dropLast(1))!
let ttt = Int(arr[threeK].dropLast(1))!
print(t+tt+ttt)
