//
//  main.swift
//  AdventOfCodeDay13
//
//  Created by Vincent Snow on 1/6/21.
//

import Foundation

let testEarliest = 939
let testBusIDs = "7,13,x,x,59,x,31,19"
var remainder = 0
var lowestRemainder = 100
var lowestBus = 0
var busArray = busIDs.components(separatedBy: ",").filter({$0 != "x"}).map({Int($0)!})
for i in busArray {
    remainder = i - (earliest % i)
    if remainder < lowestRemainder {
        lowestRemainder = remainder
        lowestBus = i
    }
}
print(lowestRemainder, lowestBus, lowestRemainder * lowestBus)
