//
//  main.swift
//  Day2
//
//  Created by Vincent Snow on 12/2/24.
//

import Foundation

let testInput = """
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
"""

let lines = input.components(separatedBy: "\n")
var sum = 0
lineLoop: for line in lines {
    let levels = line.components(separatedBy: " ").map({Int($0)!})

    //print(levels)
    if levels != levels.sorted() && levels != levels.sorted().reversed() {
        continue lineLoop
    }
    var prev = levels[1]
    for level in levels {
        if abs(level - prev) > 3 || abs(level - prev) < 1 {
            continue lineLoop
        }
        prev = level
    }
    sum += 1
}
print(sum)
var sum2 = 0
lineLoop: for line in lines {
    var levels = line.components(separatedBy: " ").map({Int($0)!})

    //print(levels)
    var s = levels.sorted()
    var r = levels.sorted().reversed() as [Int]
    
comp: if levels != s && levels != r {
        if levels[0] == s[0] {
            for i in 0..<levels.count {
                if (levels[i] != s[0]) {
                    levels.remove(at: i)
                    s = levels.sorted()
                    if levels != s {
                        continue lineLoop
                    }
                    break comp
                }
            }
        } else if levels[0] == r[0] {
            for i in 0..<levels.count {
                if (levels[i] != r[0]) {
                    levels.remove(at: i)
                    r = levels.sorted().reversed() as [Int]
                    if levels != r {
                        continue lineLoop
                    }
                    break comp
                }
            }
        } else {
            levels.remove(at: 0)
            s = levels.sorted()
            r = levels.sorted().reversed() as [Int]
            if levels != s && levels != r {
                continue lineLoop
            }
            print("i don't think it should ever get here")
        }
    }
    var prev = levels[1]
    for level in levels {
        if abs(level - prev) > 3 || abs(level - prev) < 1 {
            continue lineLoop
        }
        prev = level
    }
    sum2 += 1
}
print(sum2)
