//
//  NCTableView.m
//  NepaliCalendar
//
//  Created by shrstha kusal on 7/4/15.
//  Copyright (c) 2015 shrstha kusal. All rights reserved.
//

#import "NCTableView.h"
#import "NepaliCalendarView.h"
#import "NepaliMonthsData.h"

@interface NCTableView() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSDictionary *dateDictionary;
@property (strong, nonatomic) NepaliMonthsData *nepaliMonth;

@property (assign, nonatomic) NSUInteger startNepaliYear;
@property (assign, nonatomic) NSUInteger startEnglishYear;
@property (assign, nonatomic) NSUInteger startNepaliMonth;
@property (assign, nonatomic) NSUInteger startNepaliDay;

@end

static NSInteger kYearFlag = 0;
static NSInteger kDateFlag = 1;
static NSInteger kStartIndex = 4;

@implementation NCTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self mainFunction];
    }
    return self;
}

- (void)mainFunction {
    [self getDataFromModel];

    self.tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.pagingEnabled = YES;
    [self addSubview:self.tableView];

    // self.week = @[@"Sun", @"Mon", @"Tue", @"Wed", @"Thurs", @"Fri", @"Sat"];
}

- (void)getDataFromModel {
    self.nepaliMonth = [[NepaliMonthsData alloc] init];
    self.dateDictionary = self.nepaliMonth.numberOfDaysInNepaliMonths;
    self.startEnglishYear = self.nepaliMonth.startEnglishYear;
    self.startNepaliYear = self.nepaliMonth.startingNepaliYear;
    self.startNepaliMonth = self.nepaliMonth.startingNepaliMonth;
    self.startNepaliDay = self.nepaliMonth.startingNepaliDay;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dateDictionary.count * 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *month = [self.dateDictionary objectForKey:@(kYearFlag)];
    NSInteger monthDate = [month[kDateFlag] integerValue];
    static NSString *cellIdentifier = @"eventCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NepaliCalendarView *calendar = [[NepaliCalendarView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width,  self.frame.size.width + 60) andStartIndex:kStartIndex andDayCount:monthDate];
    [cell.contentView addSubview:calendar];
    
    //date flag for month key eg: 30
    kDateFlag ++;
    if (kDateFlag > 12) {
        kDateFlag = 1;
        kYearFlag ++;
    }
    
    //counting start index for next month
    for (NSInteger i = 1; i <= monthDate ; i++) {
        kStartIndex ++;
        if (kStartIndex > 7) {
            kStartIndex = 1;
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60.0f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.frame.size.height;
}

@end
