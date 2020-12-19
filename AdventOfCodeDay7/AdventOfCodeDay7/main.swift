//
//  main.swift
//  AdventOfCodeDay7
//
//  Created by Vincent Snow on 12/17/20.
//

import Foundation

var rules = """
            light red bags contain 1 bright white bag, 2 muted yellow bags.
            dark orange bags contain 3 bright white bags, 4 muted yellow bags.
            bright white bags contain 1 shiny gold bag.
            muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
            shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
            dark olive bags contain 3 faded blue bags, 4 dotted black bags.
            vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
            faded blue bags contain no other bags.
            dotted black bags contain no other bags.
            """
var rulesArray = rules.split(separator: "\n")
var bagDict: [String:[String]] = [:]
var containsGoldArray: Set<String> = ["shiny gold"]
var count = 0
var inGoldBags = 0

for i in 0..<rulesArray.count {
    let firstBag = rulesArray[i].components(separatedBy: " bags contain ")
    bagDict[firstBag[0]] = firstBag[1].components(separatedBy: ", ")
}


for i in bagDict["shiny gold"] ?? [""] {
    for j in bagDict {
        if i.contains(j.key) {
            print(bagDict["shiny gold"]?.count ?? 0, j.value)
        }
    }
}
// pt1
//while count != containsGoldArray.count {
//    count = containsGoldArray.count
//    for i in bagDict {
//        for j in i.value {
//            for x in containsGoldArray {
//                if j.contains(x) {
//                    containsGoldArray.insert(i.key)
//                }
//            }
//        }
//    }
//    if count > 1000000 {
//        print("broke")
//        break
//    }
//}
//print(containsGoldArray, containsGoldArray.count-1)

