//
//  main.swift
//  Day6
//
//  Created by Vincent Snow on 12/7/22.
//

import Foundation
let t1 = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
let t2 = "bvwbjplbgvbhsrlpgdmjqwftvncz"
let t3 = "nppdvjthqldpwncqszvftbrmjlhg"
let t4 = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
let t5 = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"

let tester = input
for i in 0..<tester.count-3 {
    if Set([tester[i],tester[i+1],tester[i+2],tester[i+3]]).count == 4 {
        print([tester[i],tester[i+1],tester[i+2],tester[i+3]])
        print(i+3+1)
        break
    }
}

for i in 0..<tester.count-13 {
    var s: Set<Character> = []
    for j in i...i+13 {
        s.insert(tester[j])
    }
    if s.count == 14 {
        print(i+14)
        break
    }
}
