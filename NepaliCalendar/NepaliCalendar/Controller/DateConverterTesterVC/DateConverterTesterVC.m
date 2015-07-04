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
    NSString *nepaliDateString = self.nepaliDateTextField.text;
    NSLog(@"%@", nepaliDateString);
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *dateNotFormatted = [dateFormatter dateFromString:nepaliDateString];
    [dateFormatter setDateFormat:@"d MMM.YYYY"];
    NSString * dateFormatted = [dateFormatter stringFromDate:dateNotFormatted];
    NSLog(@"%@", dateFormatted);
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:dateNotFormatted]; // Get necessary date components
    
    NSUInteger month = [components month]; //gives you month
    NSUInteger day = [components day]; //gives you day
    NSUInteger year = [components year]; // gives
    
    NCNepaliDateConverter *converter = [[NCNepaliDateConverter alloc] init];
    NSMutableDictionary *nepaliDate = [converter convertEnglishDateToNepaliWithYear:year month:month andDay:day];
    NSMutableDictionary *englishDate = [converter convertNepaliDateToEnglishWithYear:year month:month andDay:day];
    englishDate = [converter translateRomanDateToNepali:dateNotFormatted];
    NSLog(@"%@", englishDate);
    for (NSString *key in englishDate) {
        NSString *value = [englishDate objectForKey:key];
        self.englishDateTextField.text = [[self.englishDateTextField.text stringByAppendingString:@", "] stringByAppendingString:value];
    }
    NSUInteger nepaliYear = [[nepaliDate objectForKey:@"year"] integerValue];
    NSLog(@"NEPALI YEAR : %lu", (unsigned long)nepaliYear);
}
@end
