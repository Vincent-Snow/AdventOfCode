//
//  main.swift
//  Day3
//
//  Created by Vincent Snow on 12/2/23.
//

import Foundation

let testinput = """
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..

"""

let nums = ["1","2","3","4","5","6","7","8","9","0"]
var nDict: [String: Bool] = [:]
var nPlus: [String:Bool] = [:]
for i in nums {
    nDict[i]=true
    nPlus[i]=true
}
nPlus["."]=true
let lineChar = testinput.components(separatedBy: "\n")
var lines: [[String]] = []
for l in lineChar {
    lines.append(l.map({String($0)}))
}
var s = 0
lLoop: for lineInd in 0..<lines.count {
    let line = lines[lineInd]
    var ind = 0
    while ind < line.count {
        let str = line[ind]
        var snum = ""
    mIf: if nDict[str] == true {
        nLoop: for n in 0...3 where (ind + n) < line.count {
            let dig = line[ind+n]
            if nDict[dig] == true {
                snum+=dig
                if dig == line.last! && ind + n == line.count-1 {
                    ind += n+1
                }
                continue nLoop
            } else {
                ind += n
                break nLoop
            }

        }
            if snum != "" {
                print(snum,ind)
                let c = snum.count
                if lineInd > 0 { // line above
                    for tInd in ind-c-1...ind where tInd >= 0 && tInd < line.count {
                        let tester = lines[lineInd-1][tInd]
                        if nPlus[tester] != true {
                            s+=Int(snum)!
                            break mIf
                        }
                    }
                }
                if ind - c >= 1 { // to the left
                    let tester = line[ind-c-1]
                    if nPlus[tester] != true {
                        s+=Int(snum)!
                        break mIf
                    }
                }
                if ind < line.count { // to the right
                    let tester = line[ind]
                    if nPlus[tester] != true {
                        s+=Int(snum)!
                        break mIf
                    }
                }
                if lineInd < line.count - 1 { // line below
                    for tInd in ind-c-1...ind where tInd >= 0 && tInd < line.count {
                        let tester = lines[lineInd+1][tInd]
                        if nPlus[tester] != true {
                            s+=Int(snum)!
                            break mIf
                        }
                    }
                }
            }
        }
        ind+=1
    }
}
print(s)
for lineInd in 0..<lines.count {
    let line = lines[lineInd]
    for cInd in 0..<line.count {
        let c = line[cInd]
        if c == "*" {
            if lineInd > 0 { // up
                var tArr: [String] = []
                if cInd-1>=0 {
                    let t1 = lines[lineInd-1][cInd-1]
                    tArr.append(t1)
                }
                let t2 = lines[lineInd-1][cInd]
                tArr.append(t2)
                if cInd+1<line.count {
                    let t3 = lines[lineInd-1][cInd+1]
                    tArr.append(t3)
                }
                for t in tArr {
                    if nDict[t] == true {
                        
                    }
                }
            }
            if cInd > 0 { // left
                
            }
            if cInd < line.count { // right
                
            }
            if lineInd < lines.count { // down
                
            }
            print(line,lineInd)
            
        }
    }
}
