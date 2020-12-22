//
//  main.swift
//  AdventOfCodeDay11
//
//  Created by Vincent Snow on 12/21/20.
//

import Foundation

var seatRows: [[String]] = []
var testInput = """
        L.LL.LL.LL
        LLLLLLL.LL
        L.L.L..L..
        LLLL.LL.LL
        L.LL.LL.LL
        L.LLLLL.LL
        ..L.L.....
        LLLLLLLLLL
        L.LLLLLL.L
        L.LLLLL.LL
        """
var initialSeatRows = testInput.components(separatedBy: "\n")
//print(initialSeatRows)
for i in 0...initialSeatRows.count-1 {
    seatRows.append(initialSeatRows[i].map { String($0) })
}
print(seatRows[0].count-1)
var seatCounter = 0
var newSeatConfig = seatRows
var counter = 0
func eachSeat(row: Int, col: Int) {
    counter = 0
    eachSeat: for x in 0...2 {
        for y in 0...2 {
            //print(x-1, y-1)
            if row + x - 1 < 0 || row + x - 1 > seatRows.count - 1 {
                continue
            } else if col + y - 1 < 0  || col + y - 1 > seatRows[row].count - 1 {
                continue
            }
            if x - 1 == 0 && y - 1 == 0 {
                continue
            }
            if seatRows[row+(x-1)][col+(y-1)] == "#" {
                counter+=1
            }
        }
    }
}
func problem() {

    rowLoop: for row in 0...seatRows.count-1 {
        colLoop: for col in 0...seatRows[row].count-1 {
            if seatRows[row][col] == "L" {
                eachSeat(row: row, col: col)
                if counter == 0 {
                    newSeatConfig[row][col] = "#"
                }
            } else if seatRows[row][col] == "#" {
                eachSeat(row: row, col: col)
                if counter >= 4 {
                    newSeatConfig[row][col] = "L"
                    //print("is it ever getting here")
                }
            }
        }
    }
//    print("break")
//    for i in newSeatConfig {
//        //print(i)
//    }
    if newSeatConfig == seatRows {
        print("the end")
        for i in newSeatConfig {
            //print(i)
            for j in i {
                if j == "#" {
                    seatCounter+=1
                }
            }
        }
        
        return
    }
    seatRows = newSeatConfig
    problem()
}
problem()
print(seatCounter)
//if corner check 3
//if edge check 5
//if middle check 8
////
//
//seatRows[row-1][col-1]
//seatRows[row-1][col]
//seatRows[row-1][col+1]
//seatRows[row][col-1]
//seatRows[row][col+1]
//seatRows[row+1][col-1]
//seatRows[row+1][col]
//seatRows[row+1][col+1]

