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

var rules2  = """
            shiny gold bags contain 2 dark red bags.
            dark red bags contain 2 dark orange bags.
            dark orange bags contain 2 dark yellow bags.
            dark yellow bags contain 2 dark green bags.
            dark green bags contain 2 dark blue bags.
            dark blue bags contain 2 dark violet bags.
            dark violet bags contain no other bags.
            """



var rulesArray = textInput.split(separator: "\n")
var bagDictPartOne: [String:[String]] = [:]
var bagDictPartTwo: [String:[String]] = [:]
var totalBagsPartOne = 0
var totalBagsPartTwo = 0

for i in 0..<rulesArray.count {
    var x = rulesArray[i].replacingOccurrences(of: ".", with: "")
    x = x.replacingOccurrences(of: " bags", with: "")
    x = x.replacingOccurrences(of: " bag", with: "")
    let firstBag = x.components(separatedBy: " contain ")
    var removeNumbersArray: [String] = []
    if firstBag[1] != "no other" {
        for j in firstBag[1].components(separatedBy: ", ") {
            var temp = j
            temp.remove(at: temp.startIndex); temp.remove(at: temp.startIndex)
            removeNumbersArray.append(temp)
        }
    }
    bagDictPartOne[firstBag[0]] = removeNumbersArray
}


func bagContains(_ bagType: String) -> Bool {
    if (bagType.contains("shiny gold")) {
        return true
    }
    if (bagType.contains("no other")) {
        return false
    }
    for i in bagDictPartOne[bagType]! {
        if (bagContains(i) == true) {
            return true
        }
    }
    return false
}

for i in bagDictPartOne.keys {
    if (bagContains(i) == true) {
        totalBagsPartOne+=1
    }
}

for i in 0..<rulesArray.count {
    var x = rulesArray[i].replacingOccurrences(of: ".", with: "")
    x = x.replacingOccurrences(of: " bags", with: "")
    x = x.replacingOccurrences(of: " bag", with: "")
    let firstBag = x.components(separatedBy: " contain ")
    bagDictPartTwo[firstBag[0]] = firstBag[1].components(separatedBy: ", ")
}

func shinyCount(_ bagType: String) -> Int {
    if (bagType == "no other") {
        return 0
    }
    let bagCount = Int(String(bagType.first!))!
    var temp = 0
    var tempStr = bagType
    tempStr.remove(at: tempStr.startIndex)
    tempStr.remove(at: tempStr.startIndex)
    
    for i in bagDictPartTwo[tempStr]! {
        temp+=bagCount*shinyCount(i)
    }
    
    temp+=bagCount
    return temp
}

print(totalBagsPartOne-1)
print(shinyCount("1 shiny gold")-1)




