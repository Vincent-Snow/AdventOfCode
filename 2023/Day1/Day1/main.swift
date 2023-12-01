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
nSwitch: switch ac {
    case "o":
        if c < arr.count - 2 && arr[c+1] == "n" && arr[c+2] == "e" {
            sNum += "1"
            break cLoop
        }
    case "t":
        if c < arr.count - 2 && arr[c+1] == "w" && arr[c+2] == "o" {
            sNum += "2"
            break cLoop
        } else if c < arr.count - 4 && arr[c+1] == "h" && arr[c+2] == "r" && arr[c+3] == "e" && arr[c+4] == "e" {
            sNum += "3"
            break cLoop
        }
    case "f":
        if c < arr.count - 3 && arr[c+1] == "o" && arr[c+2] == "u" && arr[c+3] == "r"{
            sNum += "4"
            break cLoop
        } else if c < arr.count - 3 && arr[c+1] == "i" && arr[c+2] == "v" && arr[c+3] == "e"{
            sNum += "5"
            break cLoop
        }
    case "s":
        if c < arr.count - 1 && arr[c+1] == "i" && arr[c+2] == "x" {
            sNum += "6"
            break cLoop
        } else if c < arr.count - 4 && arr[c+1] == "e" && arr[c+2] == "v" && arr[c+3] == "e" && arr[c+4] == "n" {
            sNum += "7"
            break cLoop
        }
    case "e":
        if c < arr.count - 4 && arr[c+1] == "i" && arr[c+2] == "g" && arr[c+3] == "h" && arr[c+4] == "t" {
            sNum += "8"
            break cLoop
        }
    case "n":
        if c < arr.count - 3 && arr[c+1] == "i" && arr[c+2] == "n" && arr[c+3] == "e"{
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
nSwitch: switch ac {
    case "e":
        if c < arr.count + 2 && arr[ind-c-1] == "n" && arr[ind-c-2] == "o" {
            sNum += "1"
            break cLoop
        } else if c < arr.count + 4 && arr[ind-c-1] == "e" && arr[ind-c-2] == "r" && arr[ind-c-3] == "h" && arr[ind-c-4] == "t" {
            sNum += "3"
            break cLoop
        } else if c < arr.count + 3 && arr[ind-c-1] == "v" && arr[ind-c-2] == "i" && arr[ind-c-3] == "f"{
            sNum += "5"
            break cLoop
        } else if c < arr.count + 3 && arr[ind-c-1] == "n" && arr[ind-c-2] == "i" && arr[ind-c-3] == "n"{
            sNum += "9"
            break cLoop
        }
    case "o":
        if c < arr.count + 2 && arr[ind-c-1] == "w" && arr[ind-c-2] == "t" {
            sNum += "2"
            break cLoop
        }
    case "r":
        if c < arr.count + 3 && arr[ind-c-1] == "u" && arr[ind-c-2] == "o" && arr[ind-c-3] == "f"{
            sNum += "4"
            break cLoop
        }
    case "x":
        if c < arr.count + 1 && arr[ind-c-1] == "i" && arr[ind-c-2] == "s" {
            sNum += "6"
            break cLoop
        }
    case "n":
        if c < arr.count + 4 && arr[ind-c-1] == "e" && arr[ind-c-2] == "v" && arr[ind-c-3] == "e" && arr[ind-c-4] == "s" {
                sNum += "7"
                break cLoop
            }
    case "t":
        if c < arr.count + 4 && arr[ind-c-1] == "h" && arr[ind-c-2] == "g" && arr[ind-c-3] == "i" && arr[ind-c-4] == "e" {
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
