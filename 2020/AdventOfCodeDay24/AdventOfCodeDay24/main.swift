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
let start = Date()
let byH = 1
let byW = 2
var coordDict: [IntPairStruct:String] = [:]
let inputArray = input.components(separatedBy: "\n")
let test = ["nwwswee"]
for i in inputArray {
    var x = 0
    var y = 0
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
            x-=byH;y+=byH;
        case "w":
            x-=byW
        case "sw":
            x-=byH;y-=byH;
        case "se":
            x+=byH;y-=byH
        case "e":
            x+=byW
        case "ne":
            x+=byH;y+=byH;
        default:
            print("broke")
            break
        }
    }
    let xy = (x,y)
    if coordDict[xy] == nil {
        coordDict[xy] = "black"
    } else if coordDict[xy] == "black" {
        coordDict[xy] = "white"
    } else if coordDict[xy] == "white" {
        coordDict[xy] = "black"
    }
}

let item = coordDict.filter({$0.value == "black"})
print(item.count)
var tempDict: [IntPairStruct:String] = [:]
let coords = [(-byH,byH),(-byW,0),(-byH,-byH),(byH,-byH),(byW,0),(byH,byH)]
var counter = 0


for _ in 1...100 {
    tempDict = [:]
    for i in coordDict.filter({$0.value == "black"}) {
        for j in coords {
            let tup = (i.key.int0+j.0, i.key.int1+j.1)
            if coordDict[tup] == nil {
                coordDict[tup] = "white"
            }
        }
    }

    for j in coordDict.sorted(by: {$0.key.int0 > $1.key.int0}) {
        if j.value == "black" {
            counter = 0
            kLoop: for k in coords {
                let tup = (j.key.int0+k.0, j.key.int1+k.1)
                if coordDict[tup] == "black" {
                    counter+=1
                }
                if counter > 2 {
                    break kLoop
                }
            }
            if counter == 0 || counter > 2 {
                tempDict[j.key] = "white"
            }
        } else if j.value == "white" {
            counter = 0
            kLoop: for k in coords {
                let tup = (j.key.int0+k.0, j.key.int1+k.1)
                if coordDict[tup] == "black" {
                    counter+=1
                }
                if counter > 2 {
                    break kLoop
                }
            }
            if counter == 2 {
                tempDict[j.key] = "black"
            }
        }
    }

    for xy in tempDict {
        coordDict[xy.key] = xy.value
    }
}
let item2 = coordDict.filter({$0.value == "black"})
let item3 = coordDict.filter({$0.value == "white"})
print(item2.count, item3.count, Date().timeIntervalSince(start))
