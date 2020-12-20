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

//1
//3
//0
//4
//0
//7
//11
//8
//23
//
var rules2  = """
            shiny gold bags contain 2 dark red bags.
            dark red bags contain 2 dark orange bags.
            dark orange bags contain 2 dark yellow bags.
            dark yellow bags contain 2 dark green bags.
            dark green bags contain 2 dark blue bags.
            dark blue bags contain 2 dark violet bags.
            dark violet bags contain no other bags.
            """
//1
//3
//7
//15
//31
//63
//127
var rulesArray = rules.split(separator: "\n")
var bagDict: [String:[String]] = [:]
var containsGoldArray: Set<String> = ["shiny gold"]
var count = 0
var inGoldBags = 0
var bagContentsDict: [String:Int] = [:]

for i in 0..<rulesArray.count {
    let firstBag = rulesArray[i].components(separatedBy: " bags contain ")
    bagDict[firstBag[0]] = firstBag[1].components(separatedBy: ", ")
}

var bagDive = ["", "shiny", "gold"]
var totalBags = 0
var tempBags = 0
var numBags = 0
var containingBags = 0
var test = 0
func bagRecurse() {
    
    bagDiveLoop: for i in bagDict["\(bagDive[1]) \(bagDive[2])"] ?? [""] {
        
        //bagDive = []
        if i.contains("no other bags.") {
           // print(bagDive)
            bagContentsDict["\(bagDive[1]) \(bagDive[2])"] = 0
            numBags = Int(bagDive[0]) ?? 0
            containingBags = 0
            print("end")
        
        } else {
           containingBags = tempBags
        }
        tempBags += numBags + (numBags * containingBags)
        
        if true {
            allBags: for j in bagDict.keys {
                if i.contains(j) {
                    bagDive = i.components(separatedBy: " ")
                    print(bagDive)
                    numBags = Int(bagDive[0]) ?? 0
                    bagRecurse()
                    containingBags = tempBags

                    print("temp bags", tempBags)
                }
            }
        }
        
    }
    test += tempBags
    print("test", test)
    //totalBags+=tempBags
    //containingBags = 0
}

bagRecurse()
print(tempBags)

//for _ in 0...6 {
//
//    bagDiveLoop: for i in bagDict["\(bagDive[0]) \(bagDive[1])"] ?? [""] {
//        print(i)
//        //bagDive = []
//        allBags: for j in bagDict.keys {
//            if i.contains(j) {
//                //print(bagDive[1], bagDive[2])
//                bagDive = j.components(separatedBy: " ")
//                //bagDive.append(contentsOf: j.components(separatedBy: " "))
//                //print(bagDive)
//
//
//            } else if i.contains("no other bags.") {
//                print("something")
//                break
//            }
//        }
//    }
//}
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

