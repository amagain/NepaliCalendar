//
//  NSNumber+NepaliDay.m
//  NepaliCalendar
//
//  Created by Leapfrog on 7/3/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import "NSNumber+NepaliDay.h"

@implementation NSNumber (NepaliDay)

- (NSString *)nepaliDayForNumber {
    NSArray *nepaliDaysName = @[
                                @"आइतवार",  //  1
                                @"सोमवार",   //  2
                                @"मङ्लबार",  //  3
                                @"बुधबार",   //  4
                                @"बिहिबार",  //  5
                                @"शुक्रबार",  //  6
                                @"शनिबार"   //  7
                                ];
    if (self.integerValue > [nepaliDaysName count]) {
        return [nepaliDaysName lastObject];
    }
    return [nepaliDaysName objectAtIndex:(self.integerValue - 1)];
}

@end
