//
//  DateConverterTesterVC.m
//  NepaliCalendar
//
//  Created by Saugat Gautam on 7/4/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import "DateConverterTesterVC.h"
#import "NCNepaliDateConverter.h"
@interface DateConverterTesterVC ()
@property (strong, nonatomic) IBOutlet UITextField *englishDateTextField;
@property (strong, nonatomic) IBOutlet UITextField *nepaliDateTextField;
- (IBAction)convertEnglishToNepali:(id)sender;

@end

@implementation DateConverterTesterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertEnglishToNepali:(id)sender {
    // dd/mm/yy
    NSString *dateString = self.nepaliDateTextField.text;
    dateString = @"04-07-2015";
    NCNepaliDateConverter *converter = [[NCNepaliDateConverter alloc] init];
    
    NSDate *date = [converter convertStringToDate:dateString];
    NSLog(@"String to Date : %@", date);
    
    NSDictionary *dateDictionary = [converter translateRomanDateToNepali:date];
    self.englishDateTextField.text = [self getFormattedDateStringFromDictionary:dateDictionary];
    
    
    NSLog(@"Date to String : %@", [converter convertDateToString:date]);
    
    NSDictionary *nepaliDate = [converter convertEnglishDateToNepaliWithDate:date];
    NSLog(@"Date to Nepali : %@", nepaliDate);
    
    NSLog(@"Date to English : %@", [converter convertNepaliDateToEnglishWithDate:date]);
    
    NSLog(@"Translate to nepali : %@", [converter translateRomanDateToNepali:date]);
    
    NSLog(@"Week Number : %lu", [converter getWeekNumberOfEnglishDate:date]);
    
    NSLog(@"Week Number : %lu", [converter getWeekNumberOfNepaliDate:date]);
          
    
}

- (NSString *)getFormattedDateStringFromDictionary:(NSDictionary *)dateDictionary {
    NSString *day = [dateDictionary objectForKey:@"date"];
    NSString *month = [dateDictionary objectForKey:@"month"];
    NSString *year = [dateDictionary objectForKey:@"year"];
    NSString *dateString = [NSString stringWithFormat:@"Nepali Date: %@-%@-%@ BS", day, month, year];
    return dateString;
}




@end
