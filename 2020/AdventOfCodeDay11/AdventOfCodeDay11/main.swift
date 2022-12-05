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
var otrosInput = """
                .......#.
                ...#.....
                .#.......
                .........
                ..#L....#
                ....#....
                .........
                #........
                ...#.....
                """
var yetAnotherInput = """
                .............
                .L.L.#.#.#.#.
                .............
                """
var oneLastInput = """
                .##.##.
                #.#.#.#
                ##...##
                ...L...
                ##...##
                #.#.#.#
                .##.##.
                """

var initialSeatRows = input.components(separatedBy: "\n")
//print(initialSeatRows)
for i in 0...initialSeatRows.count-1 {
    seatRows.append(initialSeatRows[i].map { String($0) })
}

var seatCounter = 0
var newSeatConfig = seatRows
var counter = 0
var probcounter = 0

func doThis(row:Int,col:Int,tempx:Int,tempy:Int) -> Bool {
    if seatRows[row+tempx][col+tempy] == "#" {
        counter+=1
        return true
    } else if seatRows[row+tempx][col+tempy] == "L" {
        return true
    } else {
        return false
    }
}

    func eachSeat(row: Int, col: Int) {
        eachSeat: for x in 0...2 {
            innerLoop: for y in 0...2 {
                var tempx = x-1
                var tempy = y-1
                
                while row + tempx > -2 && row + tempx < seatRows.count && col + tempy > -2  && col + tempy < seatRows[row].count  {
                    if row + tempx < 0 || row + tempx > seatRows.count - 1 {
                        continue innerLoop
                    } else if col + tempy < 0  || col + tempy > seatRows[row].count - 1 {
                        continue innerLoop
                    }
                    switch (x-1, y-1) {
                    case (-1,-1):
                        if doThis(row: row, col: col, tempx: tempx, tempy: tempy) {
                            continue innerLoop
                        } else {
                            tempx-=1
                            tempy-=1
                        }
                    case (-1,0):
                        if doThis(row: row, col: col, tempx: tempx, tempy: tempy) {
                            continue innerLoop
                        } else {
                            tempx-=1
                        }
                    case (0,-1):
                        if doThis(row: row, col: col, tempx: tempx, tempy: tempy) {
                            continue innerLoop
                        } else {
                            tempy-=1
                        }
                    case (1,-1):
                        if doThis(row: row, col: col, tempx: tempx, tempy: tempy) {
                            continue innerLoop
                        } else {
                            tempx+=1
                            tempy-=1
                        }
                    case (0,0):
                        continue innerLoop
                    case (-1,1):
                        if doThis(row: row, col: col, tempx: tempx, tempy: tempy) {
                            continue innerLoop
                        } else {
                            tempx-=1
                            tempy+=1
                        }
                    case (1,0):
                        if doThis(row: row, col: col, tempx: tempx, tempy: tempy) {
                            continue innerLoop
                        } else {
                            tempx+=1
                        }
                    case (0,1):
                        if doThis(row: row, col: col, tempx: tempx, tempy: tempy) {
                            continue innerLoop
                        } else {
                            tempy+=1
                        }
                    case (1,1):
                        if doThis(row: row, col: col, tempx: tempx, tempy: tempy) {
                            continue innerLoop
                        } else {
                            tempx+=1
                            tempy+=1
                        }
                    default:
                        continue innerLoop
                }
            }
        }
    }
}

func problem() {

    rowLoop: for row in 0...seatRows.count-1 {
        colLoop: for col in 0...seatRows[row].count-1 {
            counter=0
            if seatRows[row][col] == "L" {
                eachSeat(row: row, col: col)
                if counter == 0 {
                    newSeatConfig[row][col] = "#"
                }
            } else if seatRows[row][col] == "#" {
                eachSeat(row: row, col: col)
                if counter >= 5 {
                    newSeatConfig[row][col] = "L"
                    //print("is it ever getting here")
                }
            }
        }
    }

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





func pt1(initialSeatRows:[String]) {
    for i in 0...initialSeatRows.count-1 {
        seatRows.append(initialSeatRows[i].map { String($0) })
    }
    print(seatRows[0].count-1)
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
    func problem2() {

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
        problem2()
    }
    problem2()
    print(seatCounter)
}



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

