//
//  NSNumber+NepaliMonth.m
//  NepaliCalendar
//
//  Created by Leapfrog on 7/3/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import "NSNumber+NepaliMonth.h"

@implementation NSNumber (NepaliMonth)

- (NSString *)nepaliMonthForNumber {
    NSArray *nepaliMonthsNameInNepali = @[
                                          @"बैशाख",     // 1
                                           @"जेष्ठ",     // 2
                                           @"असार",    // 3
                                           @"साउन",    // 4
                                           @"भदौ",     // 5
                                           @"अशोज",   // 6
                                           @"कार्तिक",  // 7
                                           @"मंसिर",   // 8
                                           @"पुस",    // 9
                                           @"माघ",   // 10
                                           @"फाल्गुन", // 11
                                           @"चैत्र",   // 12
                                          ];
    if (self.integerValue > [nepaliMonthsNameInNepali count]) {
        return [nepaliMonthsNameInNepali lastObject];
    }
    return [nepaliMonthsNameInNepali objectAtIndex:(self.integerValue -1)];;
}

@end
