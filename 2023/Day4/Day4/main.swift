//
//  main.swift
//  Day4
//
//  Created by Vincent Snow on 12/3/23.
//

import Foundation
let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}

let testinput = """
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
"""

var s = 0
var s2 = 0
var cards = input.components(separatedBy: "\n")
var cardDict: [String:Int] = [:]
var cardDict2: [Int:String] = [:]
var cardArr: [String] = []
var scoreDict: [Int:Int] = [:]
for card in cards {
    var sub = 0
    let no_colon = card.components(separatedBy: ": ")
    let cards = no_colon[1].components(separatedBy: " | ")
    var winners: [String:Bool] = [:]
    var mine: [String:Bool] = [:]
    for winner in cards[0].components(separatedBy: " ") {
        winners[winner] = true
    }
    for m in cards[1].components(separatedBy: " ") {
        mine[m] = true
    }
    winners.removeValue(forKey: "")
    mine.removeValue(forKey: "")
    for m in mine {
        if winners[m.key] == true {
            if sub == 0 {
                sub = 1
            } else {
                sub *= 2
            }
        }
    }
    s+=sub
}
print(s,t())

for card in cards {
    let comp = card.components(separatedBy: ": ")
    let game = Int(comp[0].components(separatedBy: " ").last!)!
    cardDict[comp[1]] = game
    cardArr.append(comp[1])
    cardDict2[game] = comp[1]
}
for card in cards {
    var c = 0
    let no_colon = card.components(separatedBy: ": ")
    let cards = no_colon[1].components(separatedBy: " | ")
    var winners: [String:Bool] = [:]
    var mine: [String:Bool] = [:]
    for winner in cards[0].components(separatedBy: " ") {
        winners[winner] = true
    }
    for m in cards[1].components(separatedBy: " ") {
        mine[m] = true
    }
    winners.removeValue(forKey: "")
    mine.removeValue(forKey: "")
    for m in mine {
        if winners[m.key] == true {
            c+=1
        }
    }
    scoreDict[cardDict[no_colon[1]]!] = c
}

var ind = 0
while ind < cardArr.count {
    let card = cardArr[ind]
    let game = cardDict[card]!
    let c = scoreDict[game]!
    if c != 0 {
        for i in cardDict[card]!+1...cardDict[card]!+c {
            cardArr.append(cardDict2[i]!)
        }
    }
    s2+=c
    ind+=1
}
s2+=cardDict.count
print(s2, t())
