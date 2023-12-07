//
//  main.swift
//  Day7
//
//  Created by Vincent Snow on 12/6/23.
//

import Foundation

let testinput = """
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
44433 123
99999 90
19111 789
12111 89
13111 89
14111 90
15111 80
45678 78
91119 23
JJ89J 145
11111 123
22222 123
1111A 142
33333 123
44444 123
AAAAA 123
KKKKK 123
QQQQQ 123
JJJJJ 123
TTTTT 123
2222Q 123
3333A 123
AAAA1 414
33332 123
2AAAA 123
22J99 123
1234J 123
JJ123 123
33391 123
99881 123
AA12J 123
"""
let hands = input.components(separatedBy: "\n")
var sum = 0
var rank: [(String,String)] = []
var five: [(String,String,String)] = []
var four: [(String,String,String)] = []
var full: [(String,String,String)] = []
var three: [(String,String,String)] = []
var twopair: [(String,String,String)] = []
var two: [(String,String,String)] = []
var high: [(String,String,String)] = []
for h in hands {
    let hand = h.components(separatedBy: " ")
    let s = hand[1]
    var c = hand[0]
    c = c.replacingOccurrences(of: "A", with: "Z")
    c = c.replacingOccurrences(of: "K", with: "Y")
    c = c.replacingOccurrences(of: "Q", with: "X")
    c = c.replacingOccurrences(of: "J", with: "0")
    c = c.replacingOccurrences(of: "T", with: "V")
    let mappedItems = c.map { ($0, 1) }
    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
iloop: for i in counts.sorted(by: {$0.value > $1.value}) {
//    if c == "00890" {
//        print(counts["0"] ?? 0)
//    }

    if i.key == "0" && i.value == 5 {
        five.append((c,"five",s))
    }
    if i.key == "0" {
            continue iloop
        }
        
        let v = i.value + (counts["0"] ?? 0)
        if v == 5 {
            five.append((c,"five",s))
            break iloop
        }
        if v == 4 {
            four.append((c,"four",s))
            break iloop
        }
    if counts.count == 2 || (counts.count == 3 && counts["0"] != nil){
            full.append((c, "full house",s))
            break iloop
        }
        if v == 3 {
            three.append((c,"three",s))
            break iloop
        }
        if counts.count == 3 {
            twopair.append((c,"two pair",s))
            break iloop
        }
        if v == 2 {
            two.append((c,"two",s))
            break iloop
        }
        if counts.count == 5 {
            high.append((c,"high card",s))
            break iloop
        }
    }
}
let s = [five,four,full,three,twopair,two,high]
for i in s {
    for hand in i.sorted(by: {$0>$1}) {
        rank.append((hand.0,hand.2))
    }
}
for ind in 0..<rank.count {
    let i = rank[ind]
    print(i)
    sum += Int(i.1)! * (rank.count-ind)
}
print(sum)
