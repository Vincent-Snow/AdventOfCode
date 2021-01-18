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

var coordDict: [IntPairStruct:String] = [:]
let inputArray = testInput.components(separatedBy: "\n")
let test = ["nwwswee"]
for i in inputArray {
    var x = 0.0
    var y = 0.0
    for j in 0..<i.count {
        if j > 0  && (i[j-1] == "s" || i[j-1] == "n") {
            continue
        }
        let dir: String
        if i[j] == "s" || i[j] == "n" {
            dir = "\(i[j])\(i[j+1])"
            //print("\(i[j])\(i[j+1])")
        } else {
            dir = String(i[j])
            //print(i[j])
        }
        switch dir {
        case "nw":
            x-=0.5;y+=0.5;
        case "w":
            x-=1
        case "sw":
            x-=0.5;y-=0.5;
        case "se":
            x+=0.5;y-=0.5
        case "e":
            x+=1
        case "ne":
            x+=0.5;y+=0.5;
        default:
            print("broke")
            break
        }
    }
    let xy = (Int(x*10),Int(y*10))
    if coordDict[xy] == nil {
        coordDict[xy] = "black"
    } else if coordDict[xy] == "black" {
        coordDict[xy] = "white"
    } else if coordDict[xy] == "white" {
        coordDict[xy] = "black"
    }
    //print(xy)
}
for i in coordDict {
    print(i)
}
let item = coordDict.filter({$0.value == "black"})
print(item.count)


