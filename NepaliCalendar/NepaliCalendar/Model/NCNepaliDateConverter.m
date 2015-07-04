//  The MIT License (MIT)
/*
Copyright (c) 2015 Leapfrog Technology. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
//
//  NCNepaliDateConverter.m
//  NepaliCalender
//

#import "NCNepaliDateConverter.h"
#import "NepaliMonthsData.h"
#import "NSString+NepaliNumber.h"
#import "NSNumber+NepaliDay.h"

@interface NCNepaliDateConverter()

@property NSUInteger counter;
@property (strong, nonatomic) NepaliMonthsData *objNepaliMonthsData;

@end

@implementation NCNepaliDateConverter

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
    
    NSArray *nepaliDaysNameShort = @[ @"आ",@"सो",@"म",@"बु",@"बि",@"शु",@"श" ];
    self.nepaliDaysNameShortArray = [[NSArray alloc] initWithArray:nepaliDaysNameShort];
    
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

- (NSDictionary *)convertEnglishDateToNepaliWithYear:(NSUInteger)engYear
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
<<<<<<< HEAD

=======
            
>>>>>>> 95fdd99fb23f194cd2251e83ed7aa38cf8634ebe
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

- (NSDictionary *)convertNepaliDateToEnglishWithYear:(NSUInteger)nepaliYear
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
<<<<<<< HEAD

=======
                
>>>>>>> 95fdd99fb23f194cd2251e83ed7aa38cf8634ebe
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
<<<<<<< HEAD

=======
            
>>>>>>> 95fdd99fb23f194cd2251e83ed7aa38cf8634ebe
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
<<<<<<< HEAD
            totalNepaliDays--;	
=======
            totalNepaliDays--;
>>>>>>> 95fdd99fb23f194cd2251e83ed7aa38cf8634ebe
        }
        numDay = day;
        
        self.englishDateComponents[@"year"] = [NSNumber numberWithInteger:y];
        self.englishDateComponents[@"date"] = [NSNumber numberWithInteger:totalEnglishDays];
        self.englishDateComponents[@"day"] = [NSNumber numberWithInteger:day];
        self.englishDateComponents[@"month"] = [NSNumber numberWithInteger:m];
<<<<<<< HEAD

=======
        
>>>>>>> 95fdd99fb23f194cd2251e83ed7aa38cf8634ebe
        
        return self.englishDateComponents;
    }
}

- (NSDictionary *)convertNepaliDateToEnglishWithDate:(NSDate *)nepaliDate {
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:nepaliDate];
    
    NSUInteger nepaliMonth = [components month];
    NSUInteger nepaliDay = [components day];
    NSUInteger nepaliYear = [components year];
    
    return  [self convertNepaliDateToEnglishWithYear:nepaliYear month:nepaliMonth andDay:nepaliDay];
}

- (NSDictionary *)convertEnglishDateToNepaliWithDate:(NSDate *)englishDate {
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:englishDate];
    
    NSUInteger nepaliMonth = [components month];
    NSUInteger nepaliDay = [components day];
    NSUInteger nepaliYear = [components year];
    
    return [self convertNepaliDateToEnglishWithYear:nepaliYear month:nepaliMonth andDay:nepaliDay];
}

/**
 *  Returns a mutable dictionary conatining nepali date components.
 *
 *  @param date an NSDate object that needs to be translated to Nepali.
 *
 *  @return an NSMutableDictionary object that contains both the names and numbers of days, months and year in Nepali.
 */
- (NSDictionary *)translateRomanDateToNepali:(NSDate *)date {
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    
    NSUInteger month = [components month];
    NSUInteger day = [components day];
    NSUInteger year = [components year];
    
    NSString *monthString = [NSString stringWithFormat: @"%ld", (long)month];
    NSString *monthStringNepali = [monthString stringToNepaliNumber];
    
    NSString *dayString = [NSString stringWithFormat: @"%ld", (long)day];
    NSString *dayStringNepali= [dayString stringToNepaliNumber];
    
    NSString *yearString = [NSString stringWithFormat:@"%ld", (long)year];
    NSString *yearStringNepali = [yearString stringToNepaliNumber];
    
    NSNumber *dayName = [self getDayNumberFromDate:date];
    NSString *dayNameInNepali = [dayName nepaliDayForNumber];
    
    NSArray *keys = @[ @"day", @"month", @"year", @"dayName" ];
    NSArray *values = @[ dayStringNepali, monthStringNepali, yearStringNepali, dayNameInNepali ];
    NSMutableDictionary *devnagariString = [[NSMutableDictionary alloc] initWithObjects:values forKeys:keys];
    return devnagariString;
}

- (NSNumber *)getDayNumberFromDate:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    
    [dateFormatter setTimeZone:zone];
    [dateFormatter setDateFormat:@"e"];
    
    NSString *dayName = [dateFormatter stringFromDate:date];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [numberFormatter numberFromString:dayName];
    
    return myNumber;
}

<<<<<<< HEAD

=======
>>>>>>> 95fdd99fb23f194cd2251e83ed7aa38cf8634ebe
@end
