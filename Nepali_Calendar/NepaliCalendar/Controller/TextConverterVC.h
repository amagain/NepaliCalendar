//
//  TextConverterVC.h
//  NepaliCalendar
//
//  Created by Leapfrog on 7/3/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextConverterVC : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel     *nepaliLabel;
@property (weak, nonatomic) IBOutlet UILabel     *nepaliDay;
@property (weak, nonatomic) IBOutlet UILabel     *nepaliMonth;
@property (weak, nonatomic) IBOutlet UITextField *englishTextField;

- (void)convertNumber;

@end
