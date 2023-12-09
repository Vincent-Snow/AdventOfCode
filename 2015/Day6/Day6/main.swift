//
//  main.swift
//  Day6
//
//  Created by Vincent Snow on 12/8/23.
//


import Foundation
let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}

extension CGPoint : Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(x)
    hasher.combine(y)
  }
}
public func ==(lhs: CGPoint, rhs: CGPoint) -> Bool {
    return Int(lhs.x) == Int(rhs.x) && Int(lhs.y) == Int(rhs.y)
}

let testinput = """
turn on 0,0 through 999,999
toggle 0,0 through 999,0
turn off 499,499 through 500,500
"""

var lights: [(CGPoint):Bool] = [:]
var l: [(CGPoint):Int] = [:]
for x in 0...999 {
    for y in 0...999 {
        lights[CGPoint(x: Double(x), y: Double(y))] = false
        l[CGPoint(x: Double(x), y: Double(y))] = 0
    }
}

let instructions = input.components(separatedBy: "\n")
for line in instructions {
    let line = line.replacingOccurrences(of: " through ", with: " ")
    let xs,xe,ys,ye: Int
    var vals = line.components(separatedBy: " ")
    let ton = line.contains("turn on"); let tog = line.contains("toggle"); let toff = line.contains("turn off");
    if ton {
        vals.removeFirst(); vals.removeFirst();
    } else if tog {
        vals.removeFirst();
    } else if toff {
        vals.removeFirst(); vals.removeFirst();
    }
    xs = Int(vals[0].components(separatedBy: ",")[0])!
    xe = Int(vals[1].components(separatedBy: ",")[0])!
    ys = Int(vals[0].components(separatedBy: ",")[1])!
    ye = Int(vals[1].components(separatedBy: ",")[1])!
    
    for x in xs...xe {
        for y in ys...ye {
            if ton {
                lights[CGPoint(x: Double(x), y: Double(y))] = true
            } else if tog {
                if lights[CGPoint(x: Double(x), y: Double(y))] == true {
                    lights[CGPoint(x: Double(x), y: Double(y))] = false
                } else {
                    lights[CGPoint(x: Double(x), y: Double(y))] = true
                }
            } else if toff {
                lights[CGPoint(x: Double(x), y: Double(y))] = false
            }
        }
    }
}

print(lights.values.filter({$0==true}).count,t())

var c = 0
for line in instructions {
    let line = line.replacingOccurrences(of: " through ", with: " ")
    let xs,xe,ys,ye: Int
    var vals = line.components(separatedBy: " ")
    let ton = line.contains("turn on"); let tog = line.contains("toggle"); let toff = line.contains("turn off");
    if ton {
        vals.removeFirst(); vals.removeFirst();
    } else if tog {
        vals.removeFirst();
    } else if toff {
        vals.removeFirst(); vals.removeFirst();
    }
    xs = Int(vals[0].components(separatedBy: ",")[0])!
    xe = Int(vals[1].components(separatedBy: ",")[0])!
    ys = Int(vals[0].components(separatedBy: ",")[1])!
    ye = Int(vals[1].components(separatedBy: ",")[1])!
    
    for x in xs...xe {
        for y in ys...ye {
            if ton {
                l[CGPoint(x: Double(x), y: Double(y))] = l[CGPoint(x: Double(x), y: Double(y))]! + 1
            } else if tog {
                l[CGPoint(x: Double(x), y: Double(y))] = l[CGPoint(x: Double(x), y: Double(y))]! + 2
            } else if toff {
                if l[CGPoint(x: Double(x), y: Double(y))] != 0 {
                    l[CGPoint(x: Double(x), y: Double(y))] = l[CGPoint(x: Double(x), y: Double(y))]! - 1
                }
            }
        }
    }
}
print(l.values.reduce(0, +),t())
