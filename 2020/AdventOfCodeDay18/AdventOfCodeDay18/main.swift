//
//  main.swift
//  AdventOfCodeDay18
//
//  Created by Vincent Snow on 10/31/21.
//

import Foundation

infix operator +: MultiplicationPrecedence

print(1 + 2 * 3 + 4 * 5 + 6)
print(1 + (2 * 3) + (4 * (5 + 6)))
print(2 * 3 + (4 * 5))// becomes 26.
print(5 + (8 * 3 + 9 + 3 * 4 * 3)) //becomes 437.
print(5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))) // becomes 12240.
print(((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2) //becomes 13632.

//print(input)
let exp = NSExpression(format: "1 + 2 * 3 + 4 * 5 + 6")
if let result = exp.expressionValue(with: .none, context: .none) as? Int {
  print(result)
} else {
  print("error evaluating expression")
}
