//
//  main.swift
//  Day2
//
//  Created by Vincent Snow on 12/2/23.
//

import Foundation

var s = 0
var s2 = 0
let testinput = """
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
"""
let games = input.components(separatedBy: "\n")

for i in 1...games.count {
    s+=i
}
gLoop: for g in games {
    let game = g.components(separatedBy: ": ")
    let gNum = Int(game[0].components(separatedBy: " ")[1])!
    let rounds = game[1].components(separatedBy: "; ")
    for round in rounds {
        let colors = round.components(separatedBy: ", ")
        for color in colors {
            let count = color.components(separatedBy: " ")
            let c = Int(count[0])!
            switch count[1] {
            case "red":
                if c > 12 {
                    s-=gNum
                    continue gLoop
                }
            case "green":
                if c > 13 {
                    s-=gNum
                    continue gLoop
                }
            case "blue":
                if c > 14 {
                    s-=gNum
                    continue gLoop
                }
            default:
                break
            }
        }
    }
}

print(s)

gLoop: for g in games {
    let game = g.components(separatedBy: ": ")
    var rmax = 0
    var gmax = 0
    var bmax = 0
    var power = 0
    let rounds = game[1].components(separatedBy: "; ")
    for round in rounds {
        let colors = round.components(separatedBy: ", ")
        for color in colors {
            let count = color.components(separatedBy: " ")
            let c = Int(count[0])!
            switch count[1] {
            case "red":
                if c > rmax {
                    rmax = c
                }
            case "green":
                if c > gmax {
                    gmax = c
                }
            case "blue":
                if c > bmax {
                    bmax = c
                }
            default:
                break
            }
        }
    }
    power=rmax*gmax*bmax
    s2+=power
}
print(s2)
