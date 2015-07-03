//
//  NepaliMonthsData.m
//  NepaliCalendar
//
//  Created by Saugat Gautam on 7/3/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import "NepaliMonthsData.h"
@interface NepaliMonthsData ()

@end
@implementation NepaliMonthsData

- (instancetype)init {
    self = [super init];
    NSDictionary *nepaliMonthsDataDict = @{
                                             @0 : @[ @2000, @30, @32, @31, @32, @31, @30, @30, @30, @29 ,@30, @29, @31 ],
                                             @1 : @[ @2001, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @2 : @[ @2002, @31, @31, @32, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @3 : @[ @2003, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @4 : @[ @2004, @30, @32, @31, @32, @31, @30, @30, @30, @29, @30, @29, @31 ],
                                             @5 : @[ @2005, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @6 : @[ @2006, @31, @31, @32, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @7 : @[ @2007, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @8 : @[ @2008, @31, @31, @31, @32, @31, @31, @29, @30, @30, @29, @29, @31 ],
                                             @9 : @[ @2009, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @10 : @[ @2010, @31, @31, @32, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @11 : @[ @2011, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @12 : @[ @2012, @31, @31, @31, @32, @31, @31, @29, @30, @30, @29, @30, @30 ],
                                             @13 : @[ @2013, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @14 : @[ @2014, @31, @31, @32, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @15 : @[ @2015, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @16 : @[ @2016, @31, @31, @31, @32, @31, @31, @29, @30, @30, @29, @30, @30 ],
                                             @17 : @[ @2017, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @18 : @[ @2018, @31, @32, @31, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @19 : @[ @2019, @31, @32, @31, @32, @31, @30, @30, @30, @29, @30, @29, @31 ],
                                             @20 : @[ @2020, @31, @31, @31, @32, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @21 : @[ @2021, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @22 : @[ @2022, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @30 ],
                                             @23 : @[ @2023, @31, @32, @31, @32, @31, @30, @30, @30, @29, @30, @29, @31 ],
                                             @24 : @[ @2024, @31, @31, @31, @32, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @25 : @[ @2025, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @26 : @[ @2026, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @27 : @[ @2027, @30, @32, @31, @32, @31, @30, @30, @30, @29, @30, @29, @31 ],
                                             @28 : @[ @2028, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @29 : @[ @2029, @31, @31, @32, @31, @32, @30, @30, @29, @30, @29, @30, @30 ],
                                             @30 : @[ @2030, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @31 : @[ @2031, @30, @32, @31, @32, @31, @30, @30, @30, @29, @30, @29, @31 ],
                                             @32 : @[ @2032, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @33 : @[ @2033, @31, @31, @32, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @34 : @[ @2034, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @35 : @[ @2035, @30, @32, @31, @32, @31, @31, @29, @30, @30, @29, @29, @31 ],
                                             @36 : @[ @2036, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @37 : @[ @2037, @31, @31, @32, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @38 : @[ @2038, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @39 : @[ @2039, @31, @31, @31, @32, @31, @31, @29, @30, @30, @29, @30, @30 ],
                                             @40 : @[ @2040, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @41 : @[ @2041, @31, @31, @32, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @42 : @[ @2042, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @43 : @[ @2043, @31, @31, @31, @32, @31, @31, @29, @30, @30, @29, @30, @30 ],
                                             @44 : @[ @2044, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @45 : @[ @2045, @31, @32, @31, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @46 : @[ @2046, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @47 : @[ @2047, @31, @31, @31, @32, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @48 : @[ @2048, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @49 : @[ @2049, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @30 ],
                                             @50 : @[ @2050, @31, @32, @31, @32, @31, @30, @30, @30, @29, @30, @29, @31 ],
                                             @51 : @[ @2051, @31, @31, @31, @32, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @52 : @[ @2052, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @53 : @[ @2053, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @30 ],
                                             @54 : @[ @2054, @31, @32, @31, @32, @31, @30, @30, @30, @29, @30, @29, @31 ],
                                             @55 : @[ @2055, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @56 : @[ @2056, @31, @31, @32, @31, @32, @30, @30, @29, @30, @29, @30, @30 ],
                                             @57 : @[ @2057, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @58 : @[ @2058, @30, @32, @31, @32, @31, @30, @30, @30, @29, @30, @29, @31 ],
                                             @59 : @[ @2059, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @60 : @[ @2060, @31, @31, @32, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @61 : @[ @2061, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @62 : @[ @2062, @30, @32, @31, @32, @31, @31, @29, @30, @29, @30, @29, @31 ],
                                             @63 : @[ @2063, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @64 : @[ @2064, @31, @31, @32, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @65 : @[ @2065, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @66 : @[ @2066, @31, @31, @31, @32, @31, @31, @29, @30, @30, @29, @29, @31 ],
                                             @67 : @[ @2067, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @68 : @[ @2068, @31, @31, @32, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @69 : @[ @2069, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @70 : @[ @2070, @31, @31, @31, @32, @31, @31, @29, @30, @30, @29, @30, @30 ],
                                             @71 : @[ @2071, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @72 : @[ @2072, @31, @32, @31, @32, @31, @30, @30, @29, @30, @29, @30, @30 ],
                                             @73 : @[ @2073, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @31 ],
                                             @74 : @[ @2074, @31, @31, @31, @32, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @75 : @[ @2075, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @76 : @[ @2076, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @30 ],
                                             @77 : @[ @2077, @31, @32, @31, @32, @31, @30, @30, @30, @29, @30, @29, @31 ],
                                             @78 : @[ @2078, @31, @31, @31, @32, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @79 : @[ @2079, @31, @31, @32, @31, @31, @31, @30, @29, @30, @29, @30, @30 ],
                                             @80 : @[ @2080, @31, @32, @31, @32, @31, @30, @30, @30, @29, @29, @30, @30 ],
                                             @81 : @[ @2081, @31, @31, @32, @32, @31, @30, @30, @30, @29, @30, @30, @30 ],
                                             @82 : @[ @2082, @30, @32, @31, @32, @31, @30, @30, @30, @29, @30, @30, @30 ],
                                             @83 : @[ @2083, @31, @31, @32, @31, @31, @30, @30, @30, @29, @30, @30, @30 ],
                                             @84 : @[ @2084, @31, @31, @32, @31, @31, @30, @30, @30, @29, @30, @30, @30 ],
                                             @85 : @[ @2085, @31, @32, @31, @32, @30, @31, @30, @30, @29, @30, @30, @30 ],
                                             @86 : @[ @2086, @30, @32, @31, @32, @31, @30, @30, @30, @29, @30, @30, @30 ],
                                             @87 : @[ @2087, @31, @31, @32, @31, @31, @31, @30, @30, @29, @30, @30, @30 ],
                                             @88 : @[ @2088, @30, @31, @32, @32, @30, @31, @30, @30, @29, @30, @30, @30 ],
                                             @89 : @[ @2089, @30, @32, @31, @32, @31, @30, @30, @30, @29, @30, @30, @30 ],
                                             @90 : @[ @2090, @30, @32, @31, @32, @31, @30, @30, @30, @29, @30, @30, @30 ]
                                             };
    self.numberOfDaysInNepaliMonths = [[NSDictionary alloc] initWithDictionary:nepaliMonthsDataDict];
    self.startNepaliYear = 2000;
    self.startEnglishYear = 1944;
    self.startNepaliMonth = 9;
    self.startNepaliDay = 17 - 1;

    
       
    return self;
}

@end
