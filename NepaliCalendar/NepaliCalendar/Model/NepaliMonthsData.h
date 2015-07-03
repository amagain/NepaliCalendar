//
//  NepaliMonthsData.h
//  NepaliCalendar
//
//  Created by Saugat Gautam on 7/3/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NepaliMonthsData : NSObject

@property (strong, nonatomic) NSDictionary *numberOfDaysInNepaliMonths;
@property (strong, nonatomic) NSMutableDictionary *nepaliDateComponents;
@property (strong, nonatomic) NSMutableDictionary *englishDateComponents;
@property NSUInteger startNepaliYear;
@property NSUInteger startEnglishYear;
@property NSUInteger startNepaliMonth;
@property NSUInteger startNepaliDay;

@end
