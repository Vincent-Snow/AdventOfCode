//
//  main.swift
//  Day5
//
//  Created by Vincent Snow on 12/7/23.
//

import Foundation

let testinput = """
a
e
i
o
u
aeiouaeiouaeiou
aei
xazegov
aabbccdd
abcdde
ugknbfddgicrmopn
aaa
jchzalrnumimnmhp
haegwjzuvuyypxyu
dvszwmarrgswjxmb
"""
let strs = testinput.components(separatedBy: "\n")
for str in strs {
    //print(str.range(of: #"[aeiou]"#,options: .regularExpression))
    
    let pattern =  #"a"#
    let regex = try NSRegularExpression(pattern: pattern, options: [])
    print(regex)
//    let v = /[aeiou]/
    break
}
//
//let mappedItems = c.map { ($0, 1) }
//let counts = Dictionary(mappedItems, uniquingKeysWith: +)
//let color = /(\d+) (red|green|blue)/
let invitation = "Fancy a game of Cluedo™?"
print(invitation.range(of: #"\bClue(do)?™?\b"#, options: .regularExpression) != nil)
//NSError error = NULL;
//NSRegularExpression test = [NSRegularExpression regularExpressionWithPattern:@"[aeiou]"
//                                                                       options:NSRegularExpressionCaseInsensitive
//                                                                         error:&error];
//
//NSUInteger numberOfMatches = [regex numberOfMatchesInString:string
//                                                    options:0
//                                                      range:NSMakeRange(0, [string length])];
