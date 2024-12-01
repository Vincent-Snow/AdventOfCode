//
//  PuzzleInput.swift
//  AdventOfCodeDay14
//
//  Created by Vincent Snow on 1/11/21.
//
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

import Foundation
let input = """
mask = 100X000X100X00XX1010X0001X11XX100110
mem[33470] = 43619
mem[17642] = 12960
mem[54949] = 1594
mem[25705] = 17992
mem[28651] = 47662
mask = 1000X01110X1101X111X010XX110000X0010
mem[12764] = 8190
mem[19395] = 450940
mem[29461] = 13796
mem[7984] = 2208
mem[5722] = 224803
mask = X0X100001000101010X0000001XXX00X11X0
mem[35213] = 1839
mem[62594] = 437706588
mem[24939] = 26442
mem[56565] = 1170057
mem[38970] = 1610
mem[12859] = 191077
mask = 11000001X0010X1111XX010001X01XX0X011
mem[28644] = 6832
mem[648] = 510
mem[26425] = 45751198
mem[6121] = 877133150
mem[645] = 504190
mask = 1X0X0X10000100010X00101111X101X0X1XX
mem[574] = 5087144
mem[31091] = 4987
mem[30827] = 704
mem[9302] = 63804165
mem[62608] = 12748
mem[13509] = 342715
mask = 100X000010011011110001X111X0X11111X0
mem[20873] = 16020708
mem[2848] = 1636
mem[56955] = 14139429
mem[26453] = 102379
mem[33525] = 1767526
mask = 1010001X00X0X01X0101XXX110X000000001
mem[21984] = 924398411
mem[3374] = 1319620
mem[48132] = 92618
mask = 1X00000X100100110X0XX10011000000X010
mem[648] = 35751
mem[32653] = 3342
mem[36924] = 34287704
mem[52556] = 9004703
mem[30098] = 397
mem[65066] = 1309
mem[12146] = 78457
mask = X001000X10010011111001000X011XX00010
mem[65334] = 1386
mem[21909] = 447915212
mem[1243] = 154088
mem[7330] = 542311
mem[25436] = 1409628
mem[49661] = 1707251
mask = 1110X000XX001XX1110001000000110110X1
mem[24816] = 140319030
mem[19331] = 1397
mem[36701] = 26868
mem[6958] = 59463077
mem[23880] = 64111
mem[14155] = 494925
mask = 100100XX000X0X01X000X000100000000000
mem[34272] = 321335
mem[2789] = 800055021
mem[31890] = 1268179
mem[15735] = 64614
mask = 10XX1X1000X1001X110000110X1100000010
mem[52959] = 119
mem[65334] = 240968
mem[33670] = 984
mem[29240] = 10577416
mem[6234] = 42426
mem[50296] = 4021
mem[52522] = 282916082
mask = 1X0000XXX001001X1100001X11111X0X0101
mem[512] = 1718
mem[24603] = 319597952
mem[45957] = 490061
mask = 1000X0111011011X1111XX101X001XXX1100
mem[48088] = 3760968
mem[12195] = 134
mem[13250] = 125184937
mem[6378] = 1909743
mem[4524] = 34079900
mem[33793] = 2715490
mask = 10010X00X0X010X1110X0X100X000001X111
mem[44762] = 164638769
mem[1307] = 493922
mem[2789] = 106385
mask = 000000X0000X01X101X11001101011100010
mem[33232] = 324866264
mem[58828] = 13712
mem[9792] = 500596
mask = X00000111101X010111001X10100000X0100
mem[35062] = 229144
mem[13214] = 8870
mem[29008] = 509129
mem[23977] = 474
mem[64509] = 232243215
mem[539] = 213782318
mem[41932] = 99693595
mask = 1X0000XXX0010011X100X10X0111100X11X0
mem[64393] = 12134
mem[27639] = 51028341
mem[8519] = 233404408
mem[58948] = 1364
mem[41638] = 969
mask = 100000X0X10X0011X1001111X001110X110X
mem[48925] = 27022695
mem[1668] = 555
mask = 10XX00010111X001010X0X00110101101110
mem[34785] = 107013907
mem[30862] = 116531
mem[37609] = 1169
mem[29159] = 79893589
mem[24124] = 4435
mem[15848] = 211140
mask = 1X1X0000X0X01011110001100X0X0101XX01
mem[7306] = 9297181
mem[39624] = 56652
mem[19395] = 30903
mem[26699] = 875378250
mask = 10101X1000011X11110001XX111001010010
mem[56955] = 131498335
mem[13479] = 253473
mem[32536] = 988562
mask = X0XX0001X0011010XX1001010111010X1000
mem[1872] = 79920634
mem[14860] = 28428262
mem[15623] = 48262125
mask = 10010000X0X110111100XXX001000111XXXX
mem[8003] = 27178
mem[19025] = 20797909
mem[8426] = 594719044
mem[19673] = 495624
mask = 1X01000X100X0011111000110100101001X1
mem[25330] = 326966540
mem[17662] = 314119
mem[61013] = 61395
mem[5973] = 102759224
mem[49957] = 94512
mask = 100000X1X00110101110X11011111XX01100
mem[962] = 30767404
mem[53469] = 1017922130
mem[45444] = 523349
mask = X00100110X1100010X0000X0X1X000XX0011
mem[9510] = 907
mem[43012] = 935883084
mem[54252] = 234136
mem[26591] = 186879
mask = 1100001X100X001111XXX110011X11011001
mem[35978] = 382347
mem[65344] = 2627
mem[48039] = 425081487
mem[25436] = 211461256
mask = 10000110000100010100101XX100X0111X00
mem[46678] = 2550
mem[6842] = 94620
mem[17740] = 331402
mem[369] = 585126
mem[29003] = 3361567
mask = 00001X10000100110X01100110000X001X01
mem[6641] = 3291
mem[57684] = 1288724
mem[10368] = 3092
mem[1691] = 113
mem[53521] = 66841458
mask = XXX0001X00010011010X11X11XX01100000X
mem[14359] = 31504294
mem[26973] = 65316095
mem[25330] = 4502057
mem[28782] = 391
mem[50820] = 3613708
mem[7396] = 2070289
mask = 100X00000X11X011110010001X1X01110000
mem[33830] = 2489618
mem[10778] = 25554734
mem[50275] = 4814
mem[1337] = 894496769
mem[22221] = 20298
mem[32653] = 6210730
mem[14132] = 20180210
mask = 100X000X1001X01111X001XXX00010X11X11
mem[9428] = 1226484
mem[26591] = 41638310
mem[9548] = 464177
mask = 000100X1X01100010XX01X1X1X0000000110
mem[43013] = 20788
mem[31840] = 6618
mem[55203] = 86199
mem[18436] = 1218590
mem[48492] = 54642
mask = 11X10000101X1XX1X10001100000X1011011
mem[13388] = 58912508
mem[55154] = 1575819
mem[14536] = 40492746
mem[32028] = 899121184
mem[19040] = 39364
mem[30536] = 483556
mem[39091] = 3409
mask = 101XX010XX01X01111000X101101X1X00010
mem[15883] = 954907
mem[48631] = 791524
mem[6842] = 392470
mem[18541] = 3325672
mask = 100000X0000100111100011111101XXX0101
mem[53324] = 1115
mem[19724] = 60827
mem[226] = 145184
mem[17218] = 3776
mem[41773] = 26713
mem[59756] = 239511831
mask = 0X00X0XX0001001101011X011000X10X0X01
mem[27218] = 21421
mem[7812] = 23327426
mem[333] = 7770
mask = 1X0000X00X01001101XXX11000X101001111
mem[39960] = 151
mem[42954] = 6588004
mask = X010XX0010001XX1X1X000000101X000X001
mem[17822] = 11981484
mem[64005] = 13365
mem[14356] = 4133695
mem[41591] = 1910
mask = 101010X011X10011X10000011010111X1000
mem[64393] = 246340
mem[11682] = 335
mem[4551] = 192
mem[62286] = 7157612
mask = X10X000XX00X011X010X1111000100101000
mem[41086] = 24182
mem[52688] = 13433903
mem[27952] = 472864
mem[15623] = 658
mem[53618] = 13420832
mem[50687] = 7916
mask = 10X0X0011X01101011X00101X0000X101001
mem[21585] = 79669
mem[40443] = 667
mem[11223] = 192963
mem[64509] = 237828
mem[59756] = 120881
mask = 1X000011X0X10X1X110001X0X100X110100X
mem[41776] = 114946562
mem[17318] = 12138
mask = 1001X0100X010001X000XX111X0001001101
mem[45444] = 39574336
mem[45767] = 1001138
mem[54857] = 28854058
mem[53618] = 119933702
mem[16087] = 217172082
mem[39965] = 1038124
mask = X001X010X1010X0X0110110001010100X101
mem[26168] = 10252507
mem[11431] = 517718220
mem[9157] = 174396
mem[50097] = 52617175
mem[33525] = 22980
mem[25687] = 438640
mem[22317] = 186754300
mask = X0001XX10001111X11XX1X11111001110010
mem[43430] = 52170
mem[7089] = 89721988
mem[31879] = 17771306
mask = 100000001000X011X11X010X010011001010
mem[55787] = 20255
mem[12215] = 2673234
mem[27699] = 41544
mem[43730] = 37137202
mem[22189] = 2171684
mem[16916] = 8417
mem[59117] = 493
mask = 0100XX100X0X00X1010X1XX110100000X011
mem[21942] = 84253124
mem[8387] = 285989
mem[47595] = 43238786
mem[11273] = 5891
mem[18870] = 14700
mem[31397] = 18891861
mask = X1000001X0010X110100011100X1001X01X0
mem[57801] = 61
mem[24881] = 116648550
mem[45565] = 8353393
mem[30104] = 2206
mem[47328] = 95481
mask = 1XX1000010010001101110X01X011110011X
mem[54055] = 1602
mem[20200] = 58023
mem[30037] = 638
mask = 100000111X0110X01110011X00000X01011X
mem[29371] = 3431
mem[42750] = 3528
mem[58948] = 181
mem[50006] = 673
mem[56011] = 27999
mem[13828] = 12063430
mask = XX0XX01000000XX101011100110110001X11
mem[1905] = 12823719
mem[333] = 1372760
mask = X010XXX01101001111000XX111XX01X01000
mem[23642] = 75901831
mem[34749] = 609008654
mem[12955] = 127972294
mem[18507] = 4830711
mem[21470] = 2045
mem[37284] = 251298
mem[49714] = 201296
mask = 1X1000X0X00010111X00X1X0X10X01011101
mem[2789] = 22193
mem[7660] = 63
mem[42432] = 50568
mem[286] = 765
mem[33793] = 469339
mem[18119] = 35341
mask = 1000000X0011101XX1000000111000X01001
mem[35490] = 2442
mem[20611] = 12075048
mem[34677] = 3133
mem[33881] = 894
mem[8346] = 3515
mask = 100X000X1X0X00111X1001XX000X1X001010
mem[26390] = 624351
mem[30882] = 13200
mem[58137] = 104562
mem[37620] = 36784591
mask = 1X0000X00X0100X1X1000100X1101101X1X0
mem[8667] = 620484
mem[45957] = 828
mem[38134] = 8355359
mem[8519] = 5218065
mem[64260] = 7873
mask = 010X0X100X00001101001101X001XX0XX11X
mem[9421] = 372657
mem[56122] = 62813
mem[47934] = 978793189
mem[32792] = 26560
mem[31304] = 1765
mask = 1001X00100X11101110000100111X110X1XX
mem[14692] = 25633
mem[23742] = 637
mem[50109] = 407566
mask = 10XX0010000X0011010XX0X010X01X0000X1
mem[55203] = 46787013
mem[11467] = 3191791
mem[41125] = 93231592
mem[20366] = 27729722
mem[31879] = 22982
mem[61816] = 6962
mask = 1X000001100XX0111110010XX0000001000X
mem[40255] = 55627314
mem[50613] = 46448557
mem[45214] = 23418478
mem[7236] = 3872572
mem[12215] = 769893
mem[34578] = 24974787
mask = 000XX00X00010111010X001111X00110XX0X
mem[37067] = 823
mem[31124] = 11297
mem[62421] = 738
mem[10716] = 59263363
mem[21184] = 12111474
mem[46944] = 422007
mask = 100XX00XX0011XX11100X11011X11111X011
mem[14201] = 18573
mem[15883] = 625820659
mem[63146] = 15834139
mem[32183] = 53278160
mask = 100X00XX01X1000101XX11X101100100110X
mem[23880] = 254387
mem[17709] = 535
mem[12764] = 233258822
mem[48039] = 4269
mem[50109] = 68584
mem[7591] = 122179383
mask = 010X000000000110X1011X100X0000011110
mem[37974] = 1548
mem[63233] = 8930
mem[44778] = 580
mem[10051] = 1040
mem[26492] = 30761
mem[37244] = 112642
mask = 110000X000010011X100X1110111X0101010
mem[1292] = 3437
mem[35025] = 9366905
mask = 1X0X0000000110X11101X0001X001X100X0X
mem[7591] = 1608710
mem[41818] = 12566
mem[36016] = 116197417
mask = 100000X110011X1X111001X1X10XX10100X0
mem[18119] = 4227630
mem[14505] = 15635472
mem[48279] = 1404607
mem[28911] = 69031387
mem[24966] = 15866
mem[42764] = 14196595
mem[30536] = 144959
mask = 1X000011X0011110111X10001011X100X1X0
mem[15897] = 1863569
mem[37284] = 731018
mem[48279] = 2085462
mask = 10X0X001X001101111X0010110100001X010
mem[28911] = 16197451
mem[6925] = 165614747
mem[22080] = 265387922
mem[59318] = 1779761
mask = 00000XXX00X10011010011001100100X0111
mem[65156] = 112050975
mem[19901] = 889831505
mem[58996] = 1264160
mem[30802] = 2605
mem[12608] = 1327785
mask = 10000000100100111100001X00X1X000X10X
mem[30536] = 27834493
mem[26591] = 245069
mem[1428] = 520474
mem[53343] = 17883
mem[2814] = 23356
mask = 10000011X001111XX11X00X00X0X110X111X
mem[28058] = 418
mem[47970] = 3379204
mem[32241] = 102702752
mem[40499] = 252023
mem[23125] = 1672
mem[9536] = 63991
mask = 10XX0010X0X10X011100XX1111101X0X0111
mem[16311] = 126300735
mem[58427] = 40289
mem[32982] = 3884
mem[14356] = 54916
mem[17348] = 224162
mem[48317] = 61261036
mem[35998] = 729091
mask = 10000X111X0X101011100X01000000010100
mem[24655] = 85021463
mem[61136] = 836486
mem[35978] = 4899339
mem[65066] = 4025758
mem[52424] = 1033481
mem[9536] = 3374650
mem[8519] = 10572
mask = 10X00001100100X11010010X0010001X1110
mem[403] = 495031
mem[26453] = 37096
mem[55416] = 701491
mem[33450] = 1673825
mask = X0001X11X011X11X11X11000X1X0100011X1
mem[22597] = 770136
mem[11273] = 27425065
mask = 0010001X00010011X100X01001X000111X11
mem[29980] = 365
mem[63378] = 228883
mem[53819] = 66035413
mask = 10010000100XX0XX101X0XXX01X010001100
mem[28534] = 1807
mem[47970] = 7119644
mem[18194] = 1735
mem[47877] = 3151
mask = 1011000010X0X0111100X000101110X10011
mem[25154] = 29964570
mem[63129] = 10159624
mask = 1000000110X100111X00X1010011X1001100
mem[56487] = 870
mem[58828] = 290175
mask = X001000X10000010X010X010000110X11110
mem[7471] = 39984
mem[25738] = 966851148
mask = 101X001X0010101101011X011011X000X111
mem[24018] = 4476674
mem[13140] = 291
mem[25421] = 40046
mem[15399] = 1294317
mask = X0000001001XX010110010001110010110X1
mem[112] = 311
mem[3121] = 6243634
mem[53286] = 4539
mem[11587] = 103665767
mask = 10X000010001001X110X01001X1XX1011000
mem[5973] = 1483346
mem[16087] = 18208048
mem[31515] = 16445771
mask = 1X10X0001X001011X00X000001101111X000
mem[63378] = 436
mem[25436] = 302283
mem[46198] = 11243
mem[11662] = 3899
mem[52857] = 258122375
mem[18733] = 714131
mask = X1001001000X01110XXX1X1101X11110X110
mem[37620] = 623911
mem[49205] = 17280
mem[15039] = 35801359
mem[21629] = 739
mem[48696] = 3250862
mem[20379] = 953585581
mask = 11X00X001001001100X0111X111X1000110X
mem[14356] = 6011
mem[41598] = 136971765
mem[12195] = 636
mem[21511] = 501639396
mem[19096] = 10274
mem[51716] = 65184
mask = 100100001X01001111X0XX110X001111X001
mem[14156] = 2218677
mem[45629] = 98324
mem[18461] = 3590995
mem[871] = 53862879
mem[14400] = 23945494
mask = X001X000X00110XX11X00000100011011010
mem[65400] = 8312366
mem[17561] = 21548519
mem[2814] = 128148
mask = 1000X010X0X10001110000XX1110110X011X
mem[58996] = 30993534
mem[15623] = 1021
mem[25554] = 318162731
mem[32046] = 51129
mem[61190] = 8349331
mem[31091] = 30157588
mask = XX00X001XX010111010X10100X01010X00X1
mem[14900] = 187327555
mem[56145] = 1592827
mem[26453] = 6842063
mem[53679] = 93694
mem[28489] = 1913
mask = 10XX00001000X0XX110011000110110X1001
mem[32609] = 26490
mem[17188] = 150719
mem[1396] = 140150
mem[48631] = 290304
mem[29618] = 31699
mask = XX0X001110X1X1111111X1X100111X0X1100
mem[14350] = 15950
mem[28058] = 24716
mem[39402] = 2278565
mask = 001000100001X011X1001111X1X0XXX1XX11
mem[8502] = 118162
mem[42034] = 2943
mem[64089] = 22975
mem[612] = 961538
mem[2245] = 618000
mem[8426] = 838813335
mask = 10XX00X0100X1011110001X00000XX001111
mem[55977] = 263096128
mem[1243] = 11494211
mem[27129] = 44889227
mem[17879] = 526818471
mem[20967] = 68907
mem[19821] = 101439
mask = X00X00X01011000111X00010X11111000110
mem[41820] = 57481789
mem[47715] = 15667172
mem[16108] = 601
mem[42045] = 64000414
mem[3396] = 16801
mem[41933] = 192293
mem[21511] = 1735
mask = 1X000X1110011XX11110XX010000110101X0
mem[12491] = 1582234
mem[35490] = 1901772
mem[19673] = 137803450
mem[48817] = 821120
mem[17876] = 24649
mem[53314] = 5813
mem[10808] = 1281
mask = 1001X00000X11011110XXX001X000X01X000
mem[18609] = 22890216
mem[9726] = 42312
mem[14459] = 15520
"""
