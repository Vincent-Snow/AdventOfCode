//
//  main.swift
//  Day4
//
//  Created by Vincent Snow on 12/5/22.
//

import Foundation

let testInput = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""

let assignments = input.components(separatedBy: "\n")
var c1 = 0
var c2 = 0
for i in assignments {
    let assigns = i.components(separatedBy: ",")
    let one = assigns[0].components(separatedBy: "-").map({Int($0)!})
    let two = assigns[1].components(separatedBy: "-").map({Int($0)!})
    if (one[0]<=two[0] && one[1]>=two[1]) || (one[0]>=two[0] && one[1]<=two[1]) {
        c1+=1
    }
}

for i in assignments {
    let assigns = i.components(separatedBy: ",")
    let one = assigns[0].components(separatedBy: "-").map({Int($0)!})
    let two = assigns[1].components(separatedBy: "-").map({Int($0)!})
    if (two[0] <= one[1] && two[0] >= one[0]) || (one[0] >= two[0] && one[0] <= two[1]) {
        c2+=1
    }
}
print(c1)
print(c2)
