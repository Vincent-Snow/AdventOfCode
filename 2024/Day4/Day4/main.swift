//
//  main.swift
//  Day4
//
//  Created by Vincent Snow on 12/8/24.
//

import Foundation

let testInput1 = """
..X...
.SAMX.
.A..A.
XMAS.S
.X....
"""

let testInput2 = """
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
"""

let strLines = testInput1.components(separatedBy: "\n")
var lines: [[String]] = []
for i in strLines {
    let line = Array(i).map({String($0)})
    lines.append(line)
}
var sum = 0

//horizontal
for line in lines {
    sum += check(line)
}

//vertical
for n in 0..<lines[0].count {
    var vert: [String] = []
    for m in 0..<lines.count {
        vert.append(lines[m][n])
    }
    print(vert)
    sum += check(vert)
}

//backslash
for m in 0..<lines.count+lines[0].count {
    var m = m
    var slash: [String] = []
    while m != 0 {
        lines[m]
    }
}


func check(_ x: [String]) -> Int {
    var sum = 0
    var i = 0
    while (i < x.count - 3) {
        if x[i] == "X" && x[i+1] == "M" && x[i+2] == "A" && x[i+3] == "S" {
            sum += 1
        }
        if x[i] == "S" && x[i+1] == "A" && x[i+2] == "M" && x[i+3] == "X" {
            sum += 1
        }
        i += 1
    }
    return sum
}

print(sum)
