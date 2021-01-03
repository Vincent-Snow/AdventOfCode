//
//  main.swift
//  AdventOfCodeDay21
//
//  Created by Vincent Snow on 1/2/21.
//

import Foundation

var input = """
mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
trh fvjkl sbzzf mxmxvkd (contains dairy)
sqjhc fvjkl (contains soy)
sqjhc mxmxvkd sbzzf (contains fish)
"""

var inputByLine = input.components(separatedBy: "\n")
for i in inputByLine {
    print(i.components(separatedBy: " (contains "))
    
    
}

