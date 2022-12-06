//
//  main.swift
//  Day3
//
//  Created by Vincent Snow on 12/5/22.
//

import Foundation

let testInput = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""

var alphabet: [Character:Int] = [:]
var i = 1
var priorities = 0
var priorities2 = 0
let sacks = input.components(separatedBy: "\n")

for c in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" {
    alphabet[c] = i
    i+=1
}


sackLoop: for sack in sacks {
    var sackDict: [Character: Bool] = [:]
    for ind in 0..<sack.count/2 {
        let item = sack[ind]
        sackDict[item] = true
    }
    for ind in (sack.count/2)..<sack.count {
        let item = sack[ind]
        if sackDict[item] == true {
            priorities+=alphabet[item]!
            continue sackLoop
        }
    }
}

let stri = stride(from: 0, through: sacks.count-3, by: 3)

sackLoop: for ind in stri {
    let sack1 = Set(sacks[ind])
    let sack2 = Set(sacks[ind+1])
    let sack3 = Set(sacks[ind+2])
    let inter = sack1.intersection(sack2)
    let inter2 = inter.intersection(sack3)
    priorities2+=alphabet[inter2.first!]!
    

}
print(priorities)
print(priorities2)








