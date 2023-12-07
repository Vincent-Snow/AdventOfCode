//
//  main.swift
//  Day3
//
//  Created by Vincent Snow on 12/7/23.
//

import Foundation

func coord(_ i: String, _ x: Double,_ y: Double) -> (Double,Double) {
    var x = x, y = y
    switch i {
    case "^":
        y+=1
    case "v":
        y-=1
    case ">":
        x+=1
    case "<":
        x-=1
    default:
        break
    }
    return (x,y)
}
func p1() -> Int {
    var xy = (0.0,0.0)
    var c: Set<CGPoint> = [CGPoint(x: xy.0, y: xy.1)]
    for i in input{
        xy = coord(String(i), xy.0, xy.1)
        c.insert(CGPoint(x: xy.0, y: xy.1))
    }
    return c.count
}

func p2() -> Int {
    var santa = (0.0,0.0), robosanta = santa
    var c: Set<CGPoint> = [CGPoint(x: santa.0, y: santa.1)], c2 = c
    for ind in 0..<input.count {
        let i = input[ind]
        if ind % 2 == 0 {
            santa = coord(String(i), santa.0, santa.1)
            c.insert(CGPoint(x: santa.0, y: santa.1))
        } else {
            robosanta = coord(String(i), robosanta.0, robosanta.1)
            c2.insert(CGPoint(x: robosanta.0, y: robosanta.1))
        }
    }
    c=c.union(c2)
    return c.count
}
print(p1(),p2())
