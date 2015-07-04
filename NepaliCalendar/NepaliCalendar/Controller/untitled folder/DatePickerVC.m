//
//  DatePickerVC.m
//  NepaliCalendar
//
//  Created by Saugat Gautam on 7/4/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import "DatePickerVC.h"
#import "NCNepaliDateConverter.h"

@interface DatePickerVC ()
@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerOutlet;
@property (strong, nonatomic) IBOutlet UILabel *dateStringLabel;

@end

@implementation DatePickerVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.datePickerOutlet.date = [NSDate date];
    self.datePickerOutlet.datePickerMode = UIDatePickerModeDate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.dateFormat = @"dd-MM-yyyy";
    NCNepaliDateConverter *converter = [[NCNepaliDateConverter alloc] init];
    NSDictionary *nepaliDateDict = [converter convertEnglishDateToNepaliWithDate:[NSDate date]];
     NSString *dateString = [self getFormattedDateStringFromDictionary:nepaliDateDict];
    self.dateStringLabel.text = dateString;
    [self.datePickerOutlet addTarget:self action:@selector(dateChange:)forControlEvents:UIControlEventValueChanged];

}

//method for change date
- (void)dateChange:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NCNepaliDateConverter *converter = [[NCNepaliDateConverter alloc] init];
    NSDictionary *nepaliDateDict = [converter convertEnglishDateToNepaliWithDate:self.datePickerOutlet.date];
    NSString *dateString = [self getFormattedDateStringFromDictionary:nepaliDateDict];
    self.dateStringLabel.text = dateString;
}

- (NSString *)getFormattedDateStringFromDictionary:(NSDictionary *)dateDictionary {
    NSString *day = [dateDictionary objectForKey:@"date"];
    NSString *month = [dateDictionary objectForKey:@"month"];
    NSString *year = [dateDictionary objectForKey:@"year"];
    NSString *dateString = [NSString stringWithFormat:@"Nepali Date: %@-%@-%@ BS", day, month, year];
    return dateString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
