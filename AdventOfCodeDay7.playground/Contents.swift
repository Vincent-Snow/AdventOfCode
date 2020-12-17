import UIKit
//class Bag {
//    var color: String
//    var containsBags: [Bag] = []
//
//    init(color:String, containsBags:[Bag]) {
//        self.color = color
//    }
//}

var str = "Hello, playground"
var rules = """
            light red bags contain 1 bright white bag, 2 muted yellow bags.
            dark orange bags contain 3 bright white bags, 4 muted yellow bags.
            bright white bags contain 1 shiny gold bag.
            muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
            shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
            dark olive bags contain 3 faded blue bags, 4 dotted black bags.
            vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
            faded blue bags contain no other bags.
            dotted black bags contain no other bags.
            """

var rulesArray = rules.split(separator: "\n")
print(rulesArray)
var firstBag = rulesArray[0].components(separatedBy: " contain ")
print(firstBag[1].
var bag = Bag(color: firstBag[0].components(separatedBy: " bags"), containsBags: [])
print(bag)

for i in rulesArray {
    if i.contains("shiny gold bag") {
        print("yes!")
    }
}

