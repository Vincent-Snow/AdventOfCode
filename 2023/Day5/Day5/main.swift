//
//  main.swift
//  Day5
//
//  Created by Vincent Snow on 12/4/23.
//

import Foundation
let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}
let testinput = """
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
"""

let maps = testinput.components(separatedBy: "\n\n")
var seeds = maps[0].components(separatedBy: " ").map({ Int($0) ?? 0 })
seeds.removeFirst()



var low = 0
for seed in seeds {
    var result = seed
mLoop: for map in maps {
    var stds = map.components(separatedBy: "\n")
    stds.removeFirst()
    for std in stds {
        let l = std.components(separatedBy: " ").map({Int($0)!})
        let source = l[1]...l[1]+l[2]-1
        if source.contains(result) {
            let diff = l[0]-l[1]
            result = result+(diff)
            continue mLoop
        }
    }
}
    if low == 0 || result < low {
        low = result
    }
}

print(low,t())
var lines: [[[Int]]] = []
for map in maps {
    var stds = map.components(separatedBy: "\n")
    stds.removeFirst()
    var stdArr: [[Int]] = []
    for std in stds {
        let l = std.components(separatedBy: " ").map({Int($0)!})
        stdArr.append(l)
    }
    lines.append(stdArr)
}


var low2 = 0
let stri = stride(from: 0, to: seeds.count, by: 2)
for seedInd in stri {
    let max = seeds[seedInd]+seeds[seedInd+1]-1
    let min = seeds[seedInd]
    let seedRange = [(min,max)]
    for seed in seedRange {
        
        var result = seed
    mLoop: for m in lines {
        for l in m {
            let source = l[1]...l[1]+l[2]-1
            if source.contains(result) {
                let diff = l[0]-l[1]
                result = result+(diff)
                print(result)
                continue mLoop
            }
        }
    }
        if low2 == 0 || result < low2 {
            low2 = result
        }
        print(" ")
    }
}
print(low2,t())
