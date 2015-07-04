//  The MIT License (MIT)
/*
 Copyright (c) 2015 Leapfrog Technology. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
//
//  NSNumber+NepaliMonth.m
//  NepaliCalendar
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
    } else if (self.integerValue <= 0) {
        return [nepaliMonthsNameInNepali firstObject];
    }
    return [nepaliMonthsNameInNepali objectAtIndex:(self.integerValue -1)];;
}

@end
