//
//  SGNepaliDateConverter.h
//  NepaliCalender
//
//  Created by Saugat Gautam on 7/3/15.
//  Copyright (c) 2015 Leapfrog Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGNepaliDateConverter : NSObject
//public	$nep_month	= array('Baisakh','Jestha','Asar','Sharwan','Bhadra','Asoj','Kartik','Mansir','Poush','Magh','Falgun','Chaitra');
//public	$eng_month	= array("January","February","March","April","May","June","July","August","September","October","November","December");

@property (strong, nonatomic) NSArray *nepaliMonthsNameInEnglishArray;
@property (strong, nonatomic) NSArray *englishMonthsNameArray;
@property (copy, nonatomic) NSString *debugString;
- (BOOL)isLeapYear:(NSUInteger)year;
- (NSMutableDictionary *)convertEnglishDateToNepaliWithYear:(NSUInteger)year month:(NSUInteger)month andDay:(NSUInteger)day;
- (NSMutableDictionary *)convertNepaliDateToEnglishWithYear:(NSUInteger)year month:(NSUInteger)month andDay:(NSUInteger)day;


@end
