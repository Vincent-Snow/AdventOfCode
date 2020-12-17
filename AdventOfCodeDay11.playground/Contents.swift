import UIKit
extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}

var str = "Hello, playground"
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
print(initialSeatRows)
for i in 0...initialSeatRows.count-1 {
    //foo bar".map { String($0) }
    seatRows.append(initialSeatRows[i].map { String($0) })
}
//print(seatRows)

var newSeatConfig = seatRows
//print(newSeatConfig)
//row +/- 1
//col +/- 1 newSeatConfig[row+x][col+y] = "#"
var counter = 0
for row in 0...seatRows.count-1 {
    for col in 0...seatRows[row].count-1 {
        if row == 0 || col == 0 || row == seatRows.count-1 || col == seatRows[seatRows.count-1].count-1 {
            if seatRows[row][col] == "L" {
                newSeatConfig[row][col] = "#"
            }
        }
    }
}

rowLoop: for row in 1...seatRows.count-2 {
    colLoop: for col in 1...seatRows[row].count-2 {
        if seatRows[row][col] == "L" {
            eachSeat: for _ in 1...9 {
                var x = -1
                var y = -1

                if x == 0 && y == 0 {
                    x+=1
                    continue
                }
                if seatRows[row+x][col+y] == "#" {
                    counter+=1
                }
                
                if x == y {
                    x+=1
                    continue
                } else if x > y {
                    y+=1
                    continue
                }

            }
            if counter
        }
    }
}
for i in newSeatConfig {
    print(i)
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
