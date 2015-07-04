//
//  NCNepaliCalendarVC.m
//  NepaliCalendar
//
//  Created by Leapfrog on 7/4/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import "NCNepaliCalendarVC.h"
#import "NCNepaliMonthVC.h"

@interface NCNepaliCalendarVC ()

@end

@implementation NCNepaliCalendarVC

#pragma mark Design 

- (void)designVCs {
    NCNepaliMonthVC *nepaliMonthVC = [[NCNepaliMonthVC alloc] init];
    [self addChildViewController:nepaliMonthVC];
    [self.view addSubview:nepaliMonthVC.view];
    [nepaliMonthVC didMoveToParentViewController:self];
}

#pragma mark - View LifeCycle

// Do any additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self designVCs];
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
