//
//  main.swift
//  Day8
//
//  Created by Vincent Snow on 12/12/22.
//

import Foundation

let rows = input.components(separatedBy: "\n")
var trees: [[Int]] = []
var visibleTrees: Set<(String)> = []
var max = (0, "")

for row in rows {
    var rowArr: [Int] = []
    for tree in row {
        rowArr.append(Int(String(tree))!)
    }
    trees.append(rowArr)
}


for row in 0..<trees.count {
    var high = -1
    
    for ind in 0..<trees[row].count {
        if trees[row][ind] > high {
            visibleTrees.insert(String(row)+","+String(ind))
            high = trees[row][ind]
        }
    }
    let stri = stride(from: trees[row].count-1, to: 0, by: -1)
    high = -1
    for ind in stri {
        if trees[row][ind] > high {
            visibleTrees.insert(String(row)+","+String(ind))
            high = trees[row][ind]
        }
    }
}
for col in 0..<trees.count {
    var high = -1
    for tree in 0..<trees[col].count {
        if trees[tree][col] > high {
            visibleTrees.insert(String(tree)+","+String(col))
            high = trees[tree][col]
        }
    }
    high = -1
    let stri = stride(from: trees[col].count-1, through: 0, by: -1)
    for tree in stri {
        if trees[tree][col] > high {
            visibleTrees.insert(String(tree)+","+String(col))
            high = trees[tree][col]
        }
    }
}

//for i in visibleTrees.sorted() {
//    print(i)
//}
print(visibleTrees.count)


for i in visibleTrees where i.contains("0") != true && i.contains(String(trees.count-1)) != true {
    let coord = i.components(separatedBy: ",").map({ Int($0)! })
    let x = coord[1]
    let y = coord[0]
    let treeVal = trees[y][x]
    let up = stride(from: y-1, through: 0, by: -1)
    let down = stride(from: y+1, through: trees.count-1, by: 1)
    let left = stride(from: x-1, through: 0, by: -1)
    var sum = 0
    var prod = 1
    
upLoop: for tInd in up {
        let tree = trees[tInd][x]
        if tree < treeVal {
            sum+=1
        } else {
            sum+=1
            break upLoop
        }
    }

    prod*=sum
    sum = 0
downLoop: for tInd in down {
        let tree = trees[tInd][x]
        if tree < treeVal {
            sum+=1
        } else {
            sum+=1
            break downLoop
        }
    }

    prod*=sum
    sum = 0
rightLoop: for tInd in x+1..<trees[y].count {
        let tree = trees[y][tInd]
        if tree < treeVal {
            sum+=1
        } else {
            sum+=1
            break rightLoop
        }
    }

    prod*=sum
    sum = 0
leftLoop: for tInd in left {
        let tree = trees[y][tInd]
        if tree < treeVal {
            sum+=1
        } else {
            sum+=1
            break leftLoop
        }
    }
    prod*=sum

    if prod > max.0 {
        max = (prod,i)
    }
}
print(max)
