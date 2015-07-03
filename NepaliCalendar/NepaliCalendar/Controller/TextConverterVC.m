//
//  TextConverterVC.m
//  NepaliCalendar
//
//  Created by Leapfrog on 7/3/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import "TextConverterVC.h"
// Category
#import "NSString+NepaliNumber.h"

@interface TextConverterVC ()

@end

@implementation TextConverterVC

- (IBAction)convertButtonAction:(id)sender {
    [self convertNumber];
}

- (void)convertNumber {
    self.nepaliLabel.text = [self.englishTextField.text stringToNepaliNumber];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
