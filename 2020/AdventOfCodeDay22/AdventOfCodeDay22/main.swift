//
//  main.swift
//  AdventOfCodeDay22
//
//  Created by Vincent Snow on 1/19/21.
//

import Foundation

var deck1 = [9,2,6,3,1]
var deck2 = [5,8,4,7,10]
var turnCounter = 0
var deck1T = player1.components(separatedBy: "\n").map({Int($0)!})
var deck2T = player2.components(separatedBy: "\n").map({Int($0)!})
var deck1win: Bool = false
func pt2(_ dck1:[Int],_ dck2:[Int]) -> Bool {
    var deck1 = dck1;var deck2 = dck2
    while deck1 != [] && deck2 != [] {
        let d1f = deck1.removeFirst(); let d2f = deck2.removeFirst()
        if d1f <= deck1.count && d2f <= deck2.count {
            print(turnCounter, deck1, deck2)
            deck1win = pt2(deck1, deck2)
        }
        
        if d1f > d2f {
            deck1.append(d1f); deck1.append(d2f)
        } else {
            deck2.append(d2f);deck2.append(d1f)
        }
        if deck1 == [] {
            return false
        } else if deck2 == [] {
            return true
        }
        turnCounter+=1
        print(turnCounter, deck1, deck2)
    }
    return deck1win
}

pt2(deck1,deck2)
var i = 0
if deck1 == [] {
    deck2 = deck2.reversed().map({ i+=1; return $0 * i })
    print(deck2, deck2.reduce(0, +))
} else if deck2 == [] {
    deck1 = deck1.reversed().map({ i+=1; return $0 * i })
    print(deck1, deck1.reduce(0, +))
}





func pt1() {
    while deck1 != [] && deck2 != [] {
        let d1f = deck1.removeFirst(); let d2f = deck2.removeFirst()
        if d1f > d2f {
            deck1.append(d1f); deck1.append(d2f)
        } else {
            deck2.append(d2f);deck2.append(d1f)
        }
        turnCounter+=1
        print(turnCounter, deck1, deck2)
    }
    var i = 0
    if deck1 == [] {
        deck2 = deck2.reversed().map({ i+=1; return $0 * i })
        print(deck2, deck2.reduce(0, +))
    } else if deck2 == [] {
        deck1 = deck1.reversed().map({ i+=1; return $0 * i })
        print(deck1, deck1.reduce(0, +))
    }
}
