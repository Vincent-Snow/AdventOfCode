//
//  main.swift
//  AdventOfCodeDay14
//
//  Created by Vincent Snow on 1/11/21.
//

import Foundation

let testInput = """
mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
mem[8] = 11
mem[7] = 101
mem[8] = 0
"""

var x = 1
var pow = [x]
while x < 34359738368 {
    x*=2
    pow.append(x)
}
pow = pow.reversed()
func convertToBin(_ x: Int) -> [Character] {
    var bin: [Character] = []
    var x = x
    for i in pow {
        if x / i != 0 {
            bin.append("1")
            x %= i
        } else {
            bin.append("0")
        }
    }
    return bin
}
let lines = input.components(separatedBy: "\n")
var mem: [Int:Int] = [:]
var mask = ""
for i in lines {
    var str = i.components(separatedBy: " = ")
    
    if str[0] != "mask" {
        str[0].removeLast();str[0].removeFirst();str[0].removeFirst();str[0].removeFirst(); str[0].removeFirst();
        var num = Int(str[0])!
        //print(num)
        var unmasked = convertToBin(Int(str[1])!)
        //print(unmasked)
        for j in 0..<mask.count {
            if mask[j] != "X" {
                unmasked[j] = mask[j]
            }
        }
        var maskedNum = 0
        for j in 0..<pow.count {
            maskedNum += pow[j] * Int(String(unmasked[j]))!
        }
        print(unmasked, num, maskedNum)
        mem[num] = maskedNum
    } else {
        mask = str[1]
    }
    //print(mask)
}


