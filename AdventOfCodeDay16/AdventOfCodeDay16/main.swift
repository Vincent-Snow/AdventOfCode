//
//  main.swift
//  AdventOfCodeDay16
//
//  Created by Vincent Snow on 1/5/21.
//

import Foundation





//              fields:
var testFields = """
                class: 1-3 or 5-7
                row: 6-11 or 33-44
                seat: 13-40 or 45-50
                """

//                your ticket:
var testYourTicket = """
                7,1,14
                """

//                nearby tickets:
var testNearBy =    """
                7,3,47
                40,4,50
                55,2,20
                38,6,12
                """
var ticketCounter = 0
var validTicket = false
var nearByArray = nearBy.components(separatedBy: "\n")
print(nearByArray)
//
//var ticketArray = yourTicket.components(separatedBy: ",")
//print(ticketArray)

var fieldsArray = fields.components(separatedBy: "\n")
//print(fieldsArray)
var rangeArray: [String] = []
var rangeDict: [String: [String]] = [:]
var rangeIndex: [String: Int] = [:]
fieldsLoop: for i in fieldsArray {
    let temp = i.components(separatedBy: ": ")
    let fieldsRanges = temp[1].components(separatedBy: " or ")
    rangeArray.append(fieldsRanges[0])
    rangeArray.append(fieldsRanges[1])
    rangeDict[temp[0]] = [fieldsRanges[0], fieldsRanges[1]]
}

for i in rangeDict {
    print(i)
}
mainLoop: for i in nearByArray {
    let ticketArray = i.components(separatedBy: ",")
    ticketLoop: for ticketField in ticketArray {
        for j in rangeArray {
            let highLowRange = j.components(separatedBy: "-")
            if Int(ticketField) ?? 0 >= Int(highLowRange[0]) ?? 0 && Int(ticketField) ?? 0 <= Int(highLowRange[1]) ?? 0  {
                continue ticketLoop
            }
        }
        let index = nearByArray.firstIndex(of: i)!
        nearByArray.remove(at: index)
        ticketCounter+=Int(ticketField) ?? 0
        continue mainLoop
    }
}
//for i in nearByArray {
//
//}
print(nearByArray.count)
var counter = 0
var fieldIndex = 0

for i in nearByArray {
    let ticketArray = i.components(separatedBy: ",")
    tickLoop: for ind in 0..<ticketArray.count {
    counter = 0
    let tickInd = Int(ticketArray[ind])!
        for j in rangeDict {
            let highLowArray1 = j.value[0].components(separatedBy: "-").map({Int($0)!})
            let highLowArray2 = j.value[1].components(separatedBy: "-").map({Int($0)!})
            let lowRange = highLowArray1[0]...highLowArray1[1]
            let highRange = highLowArray2[0]...highLowArray2[1]
            if lowRange.contains(tickInd) || highRange.contains(tickInd) {
                    counter+=1
                if counter > 1 {
                    break tickLoop
                }
                    fieldIndex = ind
            }
        }
//        if counter > 0
    }
}

//print(ticketCounter)




func pt1() {
    var nearByArray = nearBy.components(separatedBy: "\n")
    var fieldsArray = fields.components(separatedBy: "\n")
    var rangeArray: [String] = []
    fieldsLoop: for i in fieldsArray {
        let temp = i.components(separatedBy: ": ")
        let fieldsRanges = temp[1].components(separatedBy: " or ")
        rangeArray.append(fieldsRanges[0])
        rangeArray.append(fieldsRanges[1])
    }
    print(rangeArray)
    mainLoop: for i in nearByArray {
        let ticketArray = i.components(separatedBy: ",")
        ticketLoop: for ticketField in ticketArray {
            for j in rangeArray {
                let highLowRange = j.components(separatedBy: "-")
                if Int(ticketField) ?? 0 >= Int(highLowRange[0]) ?? 0 && Int(ticketField) ?? 0 <= Int(highLowRange[1]) ?? 0  {
                    continue ticketLoop
                }
            }
            ticketCounter+=Int(ticketField) ?? 0
            continue mainLoop
        }
    }
    print(ticketCounter)
}














//for i in nearByArray {
//    let ticketArray = i.components(separatedBy: ",")
//    ticketLoop: for ticket in ticketArray {
//        fieldsLoop: for i in fieldsArray {
//            let temp = i.components(separatedBy: ": ")
//            let fieldsRanges = temp[1].components(separatedBy: " or ")
//            for j in fieldsRanges {
//                let highLowRange = j.components(separatedBy: "-")
//                if Int(ticket) ?? 0 >= Int(highLowRange[0]) ?? 0 && Int(ticket) ?? 0 <= Int(highLowRange[1]) ?? 0  {
//                    print(highLowRange)
//                    print(ticket)
//                    continue ticketLoop
//                }
//            }
//        }
//            ticketCounter+=Int(ticket) ?? 0
//    }
//}

