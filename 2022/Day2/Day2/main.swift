//
//  main.swift
//  Day2
//
//  Created by Vincent Snow on 12/5/22.
//

import Foundation

let game = input.components(separatedBy: "\n").map({String($0)})
var scorep1 = 0
var scorep2 = 0

for i in game {
    let round = i.components(separatedBy: " ")
    let choice: Int
    let result: Int
    
    switch round[1] {
    case "X":
        choice = 1
    case "Y":
        choice = 2
    case "Z":
        choice = 3
    default:
        choice = 0
    }

    switch round {
    case ["A","X"],["B","Y"],["C","Z"]:
        result = 3
    case ["C","X"], ["A","Y"],["B","Z"]:
        result = 6
    default:
        result = 0
    }
    
    scorep1 += choice + result
}


for i in game {
    let round = i.components(separatedBy: " ")
    let choice: Int
    let result: Int
    
    switch round[1] {
    case "X":
        choice = 0
    case "Y":
        choice = 3
    case "Z":
        choice = 6
    default:
        choice = 0
    }
    
    switch round {
    case ["B", "X"], ["A", "Y"], ["C","Z"]:
        result = 1 // Rock
    case ["C", "X"], ["B", "Y"], ["A","Z"]:
        result = 2 // Paper
    case ["A","X"], ["C", "Y"],["B","Z"] :
        result = 3 // Scissors
    default:
        result = 0
    }
    
    scorep2 += choice + result
}

print(scorep1)
print(scorep2)
