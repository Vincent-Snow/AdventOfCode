//
//  main.swift
//  Day3
//
//  Created by Vincent Snow on 12/8/24.
//
extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

import Foundation

let testInput2 = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
let testInput = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
let arr = Array(input).map({String($0)})
let truth = ["m","u","l","("]
var sum: [Int] = []
var sum2: [Int] = []

var i = 0
while (i < arr.count - 3) {
    if i + 3 < arr.count && arr[i] == "m" && arr[i+1] == "u" && arr[i+2] == "l" && arr[i+3] == "(" {

        i+=4
        var x = ""
        while(i < arr.count && arr[i].isInt) {
            x += arr[i]
            i+=1
        }
        if i < arr.count && arr[i] == "," {
            i+=1
            var y = ""
            while(i < arr.count && arr[i].isInt) {
                y += arr[i]
                i+=1
            }
            if i < arr.count && arr[i] == ")" {
                sum.append(Int(x)!*Int(y)!)
            }
        }
        continue
    }
    i+=1
}
print(sum,sum.reduce(0, +))
i=0
var doing = true
while (i < arr.count - 6) {
    if i + 4 < arr.count && arr[i] == "d" && arr[i+1] == "o" && arr[i+2] == "n" && arr[i+3] == "'"  && arr[i+4] == "t" && arr[i+5] == "(" && arr[i+6] == ")" {
        i+=7
        doing = false
        continue
    }
    if i + 4 < arr.count && arr[i] == "d" && arr[i+1] == "o" && arr[i+2] == "(" && arr[i+3] == ")" {
        i+=4
        doing = true
        continue
    }
    if i + 3 < arr.count && doing && arr[i] == "m" && arr[i+1] == "u" && arr[i+2] == "l" && arr[i+3] == "(" {
        i+=4
        var x = ""
        while(i < arr.count && arr[i].isInt) {
            x += arr[i]
            i+=1
        }
        if i < arr.count && arr[i] == "," {
            i+=1
            var y = ""
            while(i < arr.count && arr[i].isInt) {
                y += arr[i]
                i+=1
            }
            if i < arr.count && arr[i] == ")" {
                sum2.append(Int(x)!*Int(y)!)
            }
        }
        continue
    }
    i+=1
}
print(sum2,sum2.reduce(0, +))
