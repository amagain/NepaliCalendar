//
//  SGNepaliDateConverter.m
//  NepaliCalender
//
//  Created by Saugat Gautam on 7/3/15.
//  Copyright (c) 2015 Leapfrog Technology. All rights reserved.
//

#import "SGNepaliDateConverter.h"
#import "NepaliMonthsData.h"

@interface SGNepaliDateConverter()

@property (strong, nonatomic) NSArray *englishDaysNameArray;
@property (strong,nonatomic) NSArray *nepaliMonthsNameInNepaliArray;
@property (strong, nonatomic) NSArray *nepaliDaysNameInNepaliArray;
@property (strong, nonatomic) NSDictionary *numbersMappingEnglishToNepaliDict;
@property (strong, nonatomic) NSMutableDictionary *nepaliDateComponents;
@property (strong, nonatomic) NepaliMonthsData *objNepaliMonthsData;
@property (strong, nonatomic) NSMutableDictionary *englishDateComponents;
@property NSUInteger counter;

@end

@implementation SGNepaliDateConverter

- (instancetype)init {
    
    [self initializeInstanceVariables];
    return self;
}

- (void)initializeInstanceVariables {
    
    //Public Arrays
    NSArray *nepaliMonthsNameInEnglish = @[ @"Baisakh",@"Jestha",@"Asar",@"Sharwan",@"Bhadra",@"Asoj",@"Kartik",@"Mansir",@"Poush",@"Magh",@"Falgun",@"Chaitra" ];
    self.nepaliMonthsNameInEnglishArray = [[NSArray alloc] initWithArray:nepaliMonthsNameInEnglish];
    
    NSArray *englishMonthsNameArray = @[ @"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December" ];
    self.englishMonthsNameArray = [[NSArray alloc] initWithArray:englishMonthsNameArray];
    
    //Private Arrays
    NSArray *englishDaysNames = @[ @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday"];
    self.englishDaysNameArray = [[NSArray alloc] initWithArray:englishDaysNames];
    
    NSArray *nepaliMonthsNameInNepali = @[ @"बैशाख", @"जेष्ठ", @"असार", @"साउन", @"भदौ", @"अशोज", @"कार्तिक", @"मंसिर", @"पुस", @"माघ", @"फाल्गुन", @"चैत्र" ];
    self.nepaliMonthsNameInNepaliArray = [[NSArray alloc] initWithArray:nepaliMonthsNameInNepali];
    
    NSArray *nepaliDaysNameInNepali = @[ @"आइतवार",@"सोमवार",@"मङ्लबार",@"बुधबार",@"बिहिबार",@"शुक्रबार",@"शनिबार" ];
    self.nepaliDaysNameInNepaliArray = [[NSArray alloc] initWithArray:nepaliDaysNameInNepali];
    
    NSDictionary *numbersMappingEnglishToNepali = @{ @"0" : @"०",
                                                     @"1" : @"१",
                                                     @"2" : @"२",
                                                     @"3" : @"३",
                                                     @"4" : @"४",
                                                     @"5" : @"५",
                                                     @"6" : @"६",
                                                     @"7" : @"७",
                                                     @"8" : @"८",
                                                     @"9" : @"९"
                                                     };
    self.numbersMappingEnglishToNepaliDict = [[NSDictionary alloc] initWithDictionary:numbersMappingEnglishToNepali];
    NSDictionary *nepaliDateComponents = @{ @"year" : @"", @"month" : @"", @"date" : @"", @"day" : @"", @"nmonth" : @"", @"num_day" : @"", @"nepali" : @YES};
    self.nepaliDateComponents = [[NSMutableDictionary alloc] initWithDictionary:nepaliDateComponents];
    
    NSDictionary *englishDateComponents = @{ @"year" : @"", @"month" : @"", @"date" : @"", @"day" : @"", @"emonth" : @"", @"num_day" : @"", @"nepali" : @NO};
    self.englishDateComponents = [[NSMutableDictionary alloc] initWithDictionary:englishDateComponents];
    
    self.objNepaliMonthsData = [[NepaliMonthsData alloc] init];
    
    self.debugString = @"";
}

- (BOOL)isLeapYear:(NSUInteger)year {
    
    if (year % 100 == 0) {
        if(year % 400 == 0){
            return YES;
        } else {
            return NO;
        }
        
    } else {
        if (year % 4 == 0)
        {
            return YES;
        } else {
            return NO;
        }
    }
}

- (BOOL)isInRangeEnglishWithYear:(NSUInteger)year
                           month:(NSUInteger)month
                          andDay:(NSUInteger)day {
    if (year < 1944 || year > 2033) {
        self.debugString = @"Supported only between 1944-2022";
        NSLog(@"%@", self.debugString);
        return NO;
    }
				
    if (month < 1 || month > 12) {
        self.debugString = @"Error! value 1-12 only";
        NSLog(@"%@", self.debugString);
        return NO;
    }
				
    if (day < 1 || day > 31) {
        self.debugString = @"Error! value 1-31 only";
        NSLog(@"%@", self.debugString);
        return NO;
    }
    
    return YES;
}

- (BOOL)isInRangeNepaliWithYear:(NSUInteger)year
                          month:(NSUInteger)month
                         andDay:(NSUInteger)day {
    if(year < 2000 || year > 2089){
        self.debugString = @"Supported only between 2000-2089";
        return NO;
    }
    
    if(month < 1 || month > 12) {
        self.debugString = @"Error! value 1-12 only";
        return NO;
    }
    
    if(day < 1 || day > 32){
        self.debugString = @"Error! value 1-31 only";
        return NO;
    }
    
    return YES;
    
}

- (NSMutableDictionary *)convertEnglishDateToNepaliWithYear:(NSUInteger)engYear
                                                      month:(NSUInteger)engMonth
                                                     andDay:(NSUInteger)engDay {
    if ([self isInRangeEnglishWithYear:engYear month:engMonth andDay:engDay] == false){
        return nil;
    } else {
        
        // english month data.
        NSArray *englishMonthsArray = @[ @31, @28, @31, @30, @31, @30, @31, @31, @30, @31, @30, @31 ];
        NSArray *englishLeapYearMonthsArray = @[ @31, @29, @31, @30, @31, @30, @31, @31, @30, @31, @30, @31 ];
        
        NSUInteger totalEnglishDays = 0;
        NSUInteger totalNepaliDays = 0;
        NSUInteger a=0; NSUInteger day = 7-1;		//all the initializations...
        NSUInteger m = 0;
        NSUInteger y = 0;
        NSUInteger i =0;
        NSUInteger j = 0;
        NSUInteger numDay = 0;
        
        // count total no. of days in-terms of year
        for(i = 0; i < (engYear - self.objNepaliMonthsData.startEnglishYear);  i++){
            //total days for month calculation...(english)
            if([self isLeapYear:(self.objNepaliMonthsData.startEnglishYear + i)] == YES) {
                for(j = 0;  j < 12; j++) {
                    totalEnglishDays += [englishLeapYearMonthsArray[j] integerValue];
                }
            } else
                for(j = 0; j < 12; j++)
                    totalEnglishDays += [englishMonthsArray[j] integerValue];
        }
        
        // count total no. of days in-terms of month
        for(i = 0; i < (engMonth - 1); i++){
            if([self isLeapYear:engYear] == YES) {
                totalEnglishDays += [englishLeapYearMonthsArray[i] integerValue];
            }
            else {
                totalEnglishDays += [englishMonthsArray[i] integerValue];
            }
        }
        
        // count total no. of days in-terms of date
        totalEnglishDays += engDay;
        
        i = 0; j = self.objNepaliMonthsData.startingNepaliMonth;
        totalNepaliDays = self.objNepaliMonthsData.startingNepaliDay;
        m = self.objNepaliMonthsData.startingNepaliMonth;
        y = self.objNepaliMonthsData.startingNepaliYear;
        
        // count nepali date from array
        while(totalEnglishDays != 0) {
            NSNumber *key = [NSNumber numberWithInteger:i];
            NSArray *currentNepaliMonth = [self.objNepaliMonthsData.numberOfDaysInNepaliMonths objectForKey:key];
            NSNumber *numberOfDaysInCurrentMonth = currentNepaliMonth[j];

            a = [numberOfDaysInCurrentMonth integerValue];
            totalNepaliDays++;						//count the days
            day++;								//count the days interms of 7 days
            if(totalNepaliDays > a) {
                m++;
                totalNepaliDays = 1;
                j++;
            }
            if(day > 7)
                day = 1;
            if(m > 12) {
                y++;
                m = 1;
            }
            if(j > 12) {
                j = 1; i++;
            }
            totalEnglishDays--;
        }
        
        numDay = day;
        
        self.nepaliDateComponents[@"year"] = [NSNumber numberWithInteger:y];
        self.nepaliDateComponents[@"date"] = [NSNumber numberWithInteger:totalNepaliDays];
        self.nepaliDateComponents[@"day"] = [NSNumber numberWithInteger:day];
        self.nepaliDateComponents[@"month"] = [NSNumber numberWithInteger:m];
        return self.nepaliDateComponents;
    }
}

- (NSMutableDictionary *)convertNepaliDateToEnglishWithYear:(NSUInteger)nepaliYear
                                                      month:(NSUInteger)nepaliMonth
                                                     andDay:(NSUInteger)nepaliDay {
    
    NSUInteger startingEnglishYear = 1943;
    NSUInteger startingEnglishMonth = 4 ;
    NSUInteger startingEnglishDay = 14-1;
    NSUInteger startingNepaliYear = 2000;
    NSUInteger totalEnglishDays = 0;
    NSUInteger totalNepaliDays = 0;
    NSUInteger a = 0;
    NSUInteger day = 4-1;
    NSUInteger m = 0;
    NSUInteger y = 0;
    NSUInteger i = 0;
    NSUInteger k = 0;
    NSUInteger numDay = 0;
    
    NSArray *month = @[ @0, @31, @28, @31, @30, @31, @30, @31, @31, @30, @31, @30, @31 ];
    NSArray *lmonth = @[ @0, @31, @29, @31, @30, @31, @30, @31, @31, @30, @31, @30, @31 ];
    
    if( [self isInRangeNepaliWithYear:nepaliYear month:nepaliMonth andDay:nepaliDay] == NO ){
        return false;
        
    } else {
        
        // count total days in-terms of year
        for(i=0; i<(nepaliYear - startingNepaliYear); i++) {
            for(NSUInteger j = 1; j <= 12; j++) {
                
                NSNumber *key = [NSNumber numberWithInteger:k];
                NSArray *currentNepaliMonth = [self.objNepaliMonthsData.numberOfDaysInNepaliMonths objectForKey:key];
                NSNumber *numberOfDaysInCurrentMonth = currentNepaliMonth[j];

                totalNepaliDays += [numberOfDaysInCurrentMonth integerValue];
            }
            k++;
        }
        
        // count total days in-terms of month
        for(NSUInteger j = 1; j < nepaliMonth; j++) {
            
            NSNumber *key = [NSNumber numberWithInteger:k];
            NSArray *currentNepaliMonth = [self.objNepaliMonthsData.numberOfDaysInNepaliMonths objectForKey:key];
            NSNumber *numberOfDaysInCurrentMonth = currentNepaliMonth[j];
            
            totalNepaliDays += [numberOfDaysInCurrentMonth integerValue];

        }
        
        // count total days in-terms of dat
        totalNepaliDays += nepaliDay;
        
        //calculation of equivalent english date...
        totalEnglishDays = startingEnglishDay;
        m = startingEnglishMonth;
        y = startingEnglishYear;
        while(totalNepaliDays != 0){
            if([self isLeapYear:y]) {
                a = [lmonth[m] integerValue];
            } else {
                a = [month[m] integerValue];
            }
            totalEnglishDays++;
            day++;
            if(totalEnglishDays > a){
                m++;
                totalEnglishDays = 1;
                if(m > 12){
                    y++;
                    m = 1;
                }
            }
            if(day > 7)
                day = 1;
            totalNepaliDays--;	
        }
        numDay = day;
        
        self.englishDateComponents[@"year"] = [NSNumber numberWithInteger:y];
        self.englishDateComponents[@"date"] = [NSNumber numberWithInteger:totalEnglishDays];
        self.englishDateComponents[@"day"] = [NSNumber numberWithInteger:day];
        self.englishDateComponents[@"month"] = [NSNumber numberWithInteger:m];

        
        return self.englishDateComponents;
    }
}

- (NSMutableDictionary *)convertNepaliDateToEnglishWithDate:(NSDate *)nepaliDate {
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:nepaliDate];
    
    NSUInteger nepaliMonth = [components month];
    NSUInteger nepaliDay = [components day];
    NSUInteger nepaliYear = [components year];
    
    NSMutableDictionary *englishDateDictionary = [[NSMutableDictionary alloc] init];
    englishDateDictionary = [self convertNepaliDateToEnglishWithYear:nepaliYear month:nepaliMonth andDay:nepaliDay];
    
    return englishDateDictionary;
}

- (NSMutableDictionary *)convertEnglishDateToNepaliWithDate:(NSDate *)englishDate {
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:englishDate];
    
    NSUInteger nepaliMonth = [components month];
    NSUInteger nepaliDay = [components day];
    NSUInteger nepaliYear = [components year];
    
    NSMutableDictionary *nepaliDateDictionary = [[NSMutableDictionary alloc] init];
    nepaliDateDictionary = [self convertNepaliDateToEnglishWithYear:nepaliYear month:nepaliMonth andDay:nepaliDay];
    
    return nepaliDateDictionary;
}


@end
