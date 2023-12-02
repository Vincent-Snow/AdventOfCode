//
//  main.swift
//  Day1
//
//  Created by Vincent Snow on 11/30/23.
//

import Foundation

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

let testInput = """
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
"""

let testInput2 = """
two1nine
eightwo2three
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"""

var s1 = 0
var s2 = 0
let strArr: [String] = input.components(separatedBy: "\n")
func checkNum() {
    
}
for str in strArr {
    var sNum = ""
cLoop: for char in str {
        if char.isNumber {
            sNum += String(char)
            break cLoop
        }
    }
cLoop: for char in str.reversed() {
        if char.isNumber {
            sNum += String(char)
            break cLoop
        }
    }
    s1 += Int(sNum)!
}
print(s1)

for str in strArr {
    var sNum = ""
    let arr = str.map({ String($0) })
cLoop: for c in 0..<arr.count {
        let ac = arr[c]
        if ac.isInt {
            sNum += String(ac)
            break cLoop
        }
        let one = c < arr.count - 1, two = c < arr.count - 2, three = c < arr.count - 3, four = c < arr.count - 4
        let ind1 = arr[c+1], ind2 = arr[c+2], ind3 = arr[c+3], ind4 = arr[c+4]
nSwitch: switch ac {
    case "o":
        if two && ind1 == "n" && ind2 == "e" {
            sNum += "1"
            break cLoop
        }
    case "t":
        if one && ind1 == "w" && ind2 == "o" {
            sNum += "2"
            break cLoop
        } else if four && ind1 == "h" && ind2 == "r" && ind3 == "e" && ind4 == "e" {
            sNum += "3"
            break cLoop
        }
    case "f":
        if three && ind1 == "o" && ind2 == "u" && ind3 == "r"{
            sNum += "4"
            break cLoop
        } else if three && ind1 == "i" && ind2 == "v" && ind3 == "e"{
            sNum += "5"
            break cLoop
        }
    case "s":
        if one && ind1 == "i" && ind2 == "x" {
            sNum += "6"
            break cLoop
        } else if four && ind1 == "e" && ind2 == "v" && ind3 == "e" && ind4 == "n" {
            sNum += "7"
            break cLoop
        }
    case "e":
        if four && ind1 == "i" && ind2 == "g" && ind3 == "h" && ind4 == "t" {
            sNum += "8"
            break cLoop
        }
    case "n":
        if three && ind1 == "i" && ind2 == "n" && ind3 == "e"{
            sNum += "9"
            break cLoop
        }
    default:
        break
    }
        }

    
cLoop: for c in 0..<arr.count {
    let ind = arr.count-1
    let ac = arr[ind-c]
    if ac.isInt {
        sNum += String(ac)
        break cLoop
    }
    let one = c < arr.count + 1, two = c < arr.count + 2, three = c < arr.count + 3, four = c < arr.count + 4
    let ind1 = arr[ind-c-1], ind2 = arr[ind-c-2], ind3 = arr[ind-c-3], ind4 = arr[ind-c-4]
nSwitch: switch ac {
    case "e":
        if two && ind1 == "n" && ind2 == "o" {
            sNum += "1"
            break cLoop
        } else if four && ind1 == "e" && ind2 == "r" && ind3 == "h" && ind4 == "t" {
            sNum += "3"
            break cLoop
        } else if three && ind1 == "v" && ind2 == "i" && ind3 == "f"{
            sNum += "5"
            break cLoop
        } else if three && ind1 == "n" && ind2 == "i" && ind3 == "n"{
            sNum += "9"
            break cLoop
        }
    case "o":
        if two && ind1 == "w" && ind2 == "t" {
            sNum += "2"
            break cLoop
        }
    case "r":
        if three && ind1 == "u" && ind2 == "o" && ind3 == "f"{
            sNum += "4"
            break cLoop
        }
    case "x":
        if one && ind1 == "i" && ind2 == "s" {
            sNum += "6"
            break cLoop
        }
    case "n":
        if four && ind1 == "e" && ind2 == "v" && ind3 == "e" && ind4 == "s" {
                sNum += "7"
                break cLoop
            }
    case "t":
        if four && ind1 == "h" && ind2 == "g" && ind3 == "i" && ind3 == "e" {
            sNum += "8"
            break cLoop
        }
    default:
        break
        }
    }
    s2 += Int(sNum)!
}
print(s2)
