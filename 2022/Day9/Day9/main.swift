//
//  main.swift
//  Day9
//
//  Created by Vincent Snow on 12/16/22.
//

import Foundation

let testInput = """
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
"""

let instLines = testInput.components(separatedBy: "\n")
var insts: [(String,Int)] = []
var head = (0,0)
var tail = (0,0)

func inRange(_ head:(Int,Int),_ tail:(Int,Int)) -> Bool {
    if abs(head.0-tail.0) > 1 || abs(head.1-tail.1) > 1 {
        return false
    } else {
        return true
    }
}

for i in instLines {
    let inst = i.components(separatedBy: " ")
    insts.append((inst[0],Int(inst[1])!))
}
for i in insts {
    switch i.0 {
    case "R":
        for _ in 1...i.1 {
            head.0+=1
            if head.0 > tail.0+1 && head.1 == tail.1 {
                tail.0+=1
            }
            //print(inRange(head, tail))
            print(head,tail)
        }
    case "L":
        for _ in 1...i.1 {
            head.0-=1
            if head.0 < tail.0-1 {
                tail.0-=1
            }
            print(head,tail)
        }
    case "U":
        for _ in 1...i.1 {
            head.1+=1
            if head.1 > tail.1+1 {
                tail.1+=1
            }
            print(head,tail)
        }
    case "D":
        for _ in 1...i.1 {
            head.1-=1
            if head.1 < tail.1-1 {
                tail.1-=1
            }
            print(head,tail)
        }
    default:
        print("instructions failed")
    }

}

//func iter(_ coord: (Int,Int),_ dest: Int,_ d: Int) -> Int {
//    var n = 0
//    for _ in 1...dest {
//        n+=d
//    }
//}
