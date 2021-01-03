//
//  main.swift
//  AdventOfCodeDay23
//
//  Created by Vincent Snow on 12/23/20.
//

import Foundation

var pickUpArray: [Int] = []
var input2 = [1,9,8,7,5,3,4,6,2]
var input = [3,8,9,1,2,5,4,6,7]

var currentIndex = 0
var currentVal = input[currentIndex]
var pickUpIndex = currentIndex+1
var dest = 0
var destIndex = 0
var hasLowerDest = false
var isPickUpAtEndOfArray = false
//print(input, input[currentIndex])
for _ in 1...10 {
    print(input, currentVal)
    
    // pick up cups and put them in their own array
    if pickUpIndex + 3 >= input.count {
        isPickUpAtEndOfArray = true
    }
    for _ in 1...3 {
        print(input.count, pickUpIndex)
        if pickUpIndex >= input.count-1 {
            pickUpArray.insert(input.remove(at: 0), at: 0)
        } else {
            //print(input)
            pickUpArray.append(input.remove(at: pickUpIndex))
        }
    }
    // set dest
    for x in 1...3 {
        if input.contains(currentVal-x) {
            dest = currentVal-x
            hasLowerDest = true
            break
        }
    }
    if !hasLowerDest {
        dest = input.max()!
    }
    print("dest", dest, input)
    
    destIndex = input.firstIndex(of: dest) ?? 0
    //print(currentVal, currentIndex, dest, destIndex, input, input.count, pickUpArray)
    print("dest index", destIndex)
    //put picked up cups to the right of dest
    for i in pickUpArray.reversed() {
        if destIndex == input.count-1 {
            input.append(i)
        } else {
            input.insert(i, at: destIndex+1)
        }
    }
    
    // set new current cup
    print(currentIndex, currentVal)
    currentIndex = input.firstIndex(of: currentVal) ?? 0
    if currentIndex == input.count-1 {
        currentIndex = 0
    } else {
        currentIndex+=1
    }
    //print(currentIndex)
    hasLowerDest = false
    currentVal = input[currentIndex]
    pickUpIndex = currentIndex+1
    pickUpArray = []
}
