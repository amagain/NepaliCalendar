//  The MIT License (MIT)
/*
 Copyright (c) 2015 Leapfrog Technology. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
//
//  NCNepaliDateConverter.h
//  NepaliCalender
//

#import <Foundation/Foundation.h>

@interface NCNepaliDateConverter : NSObject

@property (strong, nonatomic) NSArray *englishDaysNameArray;
@property (strong, nonatomic) NSArray *nepaliMonthsNameInNepaliArray;
@property (strong, nonatomic) NSArray *nepaliDaysNameInNepaliArray;
@property (strong, nonatomic) NSArray *nepaliDaysNameShortArray;
@property (strong, nonatomic) NSDictionary *numbersMappingEnglishToNepaliDict;
@property (strong, nonatomic) NSMutableDictionary *nepaliDateComponents;
@property (strong, nonatomic) NSMutableDictionary *englishDateComponents;
@property (strong, nonatomic) NSArray *nepaliMonthsNameInEnglishArray;
@property (strong, nonatomic) NSArray *englishMonthsNameArray;
@property (copy, nonatomic) NSString *debugString;

- (BOOL)isLeapYear:(NSUInteger)year;
- (NSArray *)convertEnglishDateToNepaliWithYear:(NSUInteger)year month:(NSUInteger)month andDay:(NSUInteger)day;
- (NSDictionary *)convertNepaliDateToEnglishWithYear:(NSUInteger)nepaliYear
                                                      month:(NSUInteger)nepaliMonth
                                                     andDay:(NSUInteger)nepaliDay;
- (NSDictionary *)convertNepaliDateToEnglishWithDate:(NSDate *)nepaliDate;
- (NSDictionary *)convertEnglishDateToNepaliWithDate:(NSDate *)englishDate;
/**
 *  Returns a mutable dictionary conatining nepali date components.
 *
 *  @param date an NSDate object that needs to be translated to Nepali.
 *
 *  @return an NSMutableDictionary object that contains both the names and numbers of days, months and year in Nepali.
 */
- (NSDictionary *)translateRomanDateToNepali:(NSDate *)date;

@end
