import UIKit

var str = "Hello, playground"
var counter = 0
var diff1 = 0
var diff2 = 0
var diff3 = 0
var input = """
103
131
121
151
118
12
7
2
90
74
160
58
15
83
153
140
166
1
148
33
165
39
100
135
68
77
25
9
54
94
101
55
141
22
97
35
57
117
102
64
109
114
56
51
125
82
154
142
155
45
75
158
120
5
19
61
34
128
106
88
84
137
96
136
27
6
21
89
69
162
112
127
119
161
38
42
134
20
81
48
73
87
26
95
146
113
76
32
70
8
18
67
124
80
93
29
126
147
28
152
145
159
"""
var testInput1 = """
16
10
15
5
1
11
7
19
6
12
4
"""
var testInput2 = """
28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3
"""
var tempArray = input.components(separatedBy: "\n").map({Int($0) ?? 0})
tempArray.append(0)
var sortedArray = tempArray.sorted()
print(sortedArray)
var inARow = 0
var inARowArray: [Int] = []

for i in 0...sortedArray.count-1 {
    if sortedArray[i] - counter == 3 {
        diff3+=1
        counter+=3
        inARowArray.append(inARow)
        inARow = 1
    } else if sortedArray[i] - counter == 2 {
        diff2+=1
        counter+=2
    } else if sortedArray[i] - counter == 1 {
        diff1+=1
        counter+=1
        inARow+=1
    } else if sortedArray[i] == 0 {
        inARow+=1
    }
    print(counter)
    if sortedArray[i] == sortedArray.last {
        diff3+=1
        counter+=3
        inARowArray.append(inARow)
        print(counter)
    }
}
print("diff1: \(diff1)")
print("diff2: \(diff2)")
print("diff3: \(diff3)")
print(inARowArray)
var total = 1
var result = inARowArray.reduce(total){
    
    
    if $1 == 4 {
        total*=4
        print($1)
        print(total)
        
    } else if $1==3 {
        total*=2
        print($1)
        print(total)
        
    } else if $1==5 {
        total*=7
        print($1)
        print(total)
        
    }
    return total
}
print(result)







//countLoop: for i in 0...sortedArray.count-1 {
////    if i+3 > sortedArray.count-1 {
////        //break countLoop
////    }
////    if i+2 > sortedArray.count-1 {
////    }
////    if i+1 > sortedArray.count-1 {
////    }
//    for j in decrArray {
//
//    }
//    sortedArray[i+1] - sortedArray[i]
//
//
//}




for i in 0...sortedArray.count-1 {
    if sortedArray[i] - counter == 1 {
        diff1+=1
        counter+=1
    } else if sortedArray[i] - counter == 2 {
        diff2+=1
        counter+=2
    } else if sortedArray[i] - counter == 3 {
        diff3+=1
        counter+=3
    }
    print(counter)
    if sortedArray[i] == sortedArray.last {
        diff3+=1
        counter+=3
        print(counter)
    }
}
print("diff1: \(diff1)")
print("diff2: \(diff2)")
print("diff3: \(diff3)")
