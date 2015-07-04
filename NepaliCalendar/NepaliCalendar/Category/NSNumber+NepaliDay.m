//
//  NSNumber+NepaliDay.m
//  NepaliCalendar
//
//  The MIT License (MIT)
/*
 Copyright (c) <year> <copyright holders>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
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
    } else if (self.integerValue <= 0 ) {
        return [nepaliDaysName firstObject];
    }
    return [nepaliDaysName objectAtIndex:(self.integerValue - 1)];
}

@end
