//
//  main.swift
//  AdventOfCodeDay8
//
//  Created by Vincent Snow on 12/20/20.
//

import Foundation

var test = """
            nop +0
            acc +1
            jmp +4
            acc +3
            jmp -3
            acc -99
            acc +1
            jmp -4
            acc +6
            """

var parsed = input.components(separatedBy: "\n")
var parsedArray: [[String]] = []
for i in parsed {
    parsedArray.append(i.components(separatedBy: " "))
}

var accumulator = 0
var jumpIndex = 0
var repeatOffender: Set<Int> = []
func infiniteLoop () {
    for i in 0...parsedArray.count-1 {
        if i == jumpIndex {
            let x = parsedArray[i]
            let endNum = Int(x[1].suffix(x[1].count-1)) ?? 0
            if repeatOffender.contains(i) {
                print("Final: ", accumulator)
                break
            }
            if x[0] == "nop" {
                print(x, accumulator)
                jumpIndex+=1
                repeatOffender.insert(i)
                continue
            }
            if x[0] == "acc" {
                print(x, accumulator)
                if x[1].prefix(1) == "+" {
                accumulator+=endNum
                } else if x[1].prefix(1) == "-" {
                accumulator-=endNum
                }
                jumpIndex+=1
                repeatOffender.insert(i)
                continue
            }
            
            if x[0] == "jmp" {
                print(x, accumulator)
                if x[1].prefix(1) == "+" {
                jumpIndex = i + endNum
                } else if x[1].prefix(1) == "-" {
                jumpIndex = i - endNum
                }
                repeatOffender.insert(i)
                infiniteLoop()
                break
            }
            
        } else {
            continue
        }
    }
}
infiniteLoop()
