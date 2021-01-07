//
//  main.swift
//  AdventOfCodeDay13
//
//  Created by Vincent Snow on 1/6/21.
//
/*
 the earliest timestamp that matches the list 17,x,13,19 is 3417.
 67,7,59,61 first occurs at timestamp 754018.
 67,x,7,59,61 first occurs at timestamp 779210.
 67,7,x,59,61 first occurs at timestamp 1261476.
 1789,37,47,1889 first occurs at timestamp 1202161486.
 */

import Foundation
let start = Date()
func modInverse(a:Int, m:Int) -> Int? {
    let tmp = a % m
    for i in 1..<m {
        if (tmp * i % m == 1) {
            return i;
        }
    }
    return nil
}

let testEarliest = 939
let testBusIDs = "7,13,x,x,59,x,31,19"
let testBusIDs2 = "67,7,59,61"
let testBusIDs3 = "1789,37,47,1889"
let testBusIDs4 = "17,x,13,19"
var remainder = 0
var lowestRemainder = 100
var lowestBus = 0
var counter = 0
var busArray = busIDs.components(separatedBy: ",").map({Int($0) ?? 0})
var busIDDict: [Int: Int] = [:]

for i in 0..<busArray.count {
    if busArray[i] == 0 {
        counter+=1
        continue
    } else {
        counter = 0
    }
        busIDDict[busArray[i]] =  i + counter

}
var N: Int
var sum: [Int] = []
N = busIDDict.map({$0.key}).reduce(1, *)
print(N)
for i in busIDDict.sorted(by: {$0.value < $1.value }) {
    print(i)
    let bi: Int
    if i.value == 0 {
        bi = 0
    } else {
        bi = i.key - i.value
    }
    let ni = N / i.key
    let xi = modInverse(a: ni, m: i.key) ?? 0
    sum.append(bi*ni*xi)
}
print(sum, sum.reduce(0, +), sum.reduce(0, +) % N)


//brute force
//let largeStride = stride(from: 0, to: 100000000000000, by: busIDDict.keys.min()!)
//largeLoop: for j in largeStride {
//
//    for i in busIDDict.sorted(by: {$0.value < $1.value}) {
//        if (j+i.value) % i.key != 0 {
//            continue largeLoop
//        }
//    }
//    print(j, j/busIDDict.keys.min()!)
//    break
//}

func pt1() {
    let busArraypt1 = busIDs.components(separatedBy: ",").filter({$0 != "x"}).map({Int($0)!})
    for i in busArraypt1 {
        remainder = i - (earliest % i)
        if remainder < lowestRemainder {
            lowestRemainder = remainder
            lowestBus = i
        }
    }
    print(lowestRemainder, lowestBus, lowestRemainder * lowestBus, Date().timeIntervalSince(start))
}
pt1()
