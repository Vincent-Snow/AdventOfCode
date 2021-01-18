//
//  main.swift
//  AdventOfCodeDay24
//
//  Created by Vincent Snow on 1/17/21.
//

import Foundation

var testInput = """
sesenwnenenewseeswwswswwnenewsewsw
neeenesenwnwwswnenewnwwsewnenwseswesw
seswneswswsenwwnwse
nwnwneseeswswnenewneswwnewseswneseene
swweswneswnenwsewnwneneseenw
eesenwseswswnenwswnwnwsewwnwsene
sewnenenenesenwsewnenwwwse
wenwwweseeeweswwwnwwe
wsweesenenewnwwnwsenewsenwwsesesenwne
neeswseenwwswnwswswnw
nenwswwsewswnenenewsenwsenwnesesenew
enewnwewneswsewnwswenweswnenwsenwsw
sweneswneswneneenwnewenewwneswswnese
swwesenesewenwneswnwwneseswwne
enesenwswwswneneswsenwnewswseenwsese
wnwnesenesenenwwnenwsewesewsesesew
nenewswnwewswnenesenwnesewesw
eneswnwswnwsenenwnwnwwseeswneewsenese
neswnwewnwnwseenwseesewsenwsweewe
wseweeenwnesenwwwswnew
"""

let inputArray = testInput.components(separatedBy: "\n")
print(inputArray)
for i in inputArray {
    for j in 0..<i.count {
        if j > 0  && (i[j-1] == "s" || i[j-1] == "n") {
            continue
        }
        if i[j] == "s" || i[j] == "n" {
            print("\(i[j])\(i[j+1])")
        } else {
            print(i[j])
        }
    }
    print("\n new line \n")
}
