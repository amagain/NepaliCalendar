//
//  NCNepaliDateConverter.h
//  NepaliCalender
//
//  Created by Saugat Gautam on 7/3/15.
//  Copyright (c) 2015 Leapfrog Technology. All rights reserved.
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

@end
