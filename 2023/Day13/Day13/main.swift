//
//  main.swift
//  Day13
//
//  Created by Vincent Snow on 12/12/23.
//

import Foundation

let testinput = """
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#
"""

//
//let patterns = testinput.components(separatedBy: "\n\n")
//for pattern in patterns {
//    var l: [[String]] = []
//    let lines = pattern.components(separatedBy: "\n")
//    for line in lines {
//        l.append(line.map({String($0)}))
//    }
//    print(l.count)
////    for ind in 0..<l.count-1 {
////        if l[ind] == l[ind+1] {
////            print(ind,ind+1)
////        }
////    }
////    for yind in 0..<l.count {
////        let y = l[yind]
////        for xind in 0..<y.count {
////            let x = y[xind]
////
////        }
////    }
//
//    print("")
//}
//
func eratosthenesSieve(to n: Int) -> [Int] {
    var composite = Array(repeating: false, count: n + 1) // The sieve
    var primes: [Int] = []
    
    if n >= 150 {
        let d = Double(n)
        let upperBound = Int(d / (log(d) - 4))
        primes.reserveCapacity(upperBound)
    } else {
        primes.reserveCapacity(n)
    }
    
    let squareRootN = Int(Double(n).squareRoot())
    var p = 2
    while p <= squareRootN {
        if !composite[p] {
            primes.append(p)
            for q in stride(from: p * p, through: n, by: p) {
                composite[q] = true
            }
        }
        p += 1
    }
    while p <= n {
        if !composite[p] {
            primes.append(p)
        }
        p += 1
    }
    return primes
}

let sieve = eratosthenesSieve(to: 10000000)
for i in sieve {
    print(i)
}
