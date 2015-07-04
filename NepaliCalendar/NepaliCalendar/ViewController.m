//
//  ViewController.m
//  NepaliCalendar
//
//  Created by shrstha kusal on 7/3/15.
//  Copyright (c) 2015 shrstha kusal. All rights reserved.
//

#import "ViewController.h"
#import "NepaliCalendarView.h"
#import "NCTableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NepaliCalendarView *calendar = [[NepaliCalendarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.width + 60)];
//    [self.view addSubview:calendar];
//    self.view.backgroundColor = [UIColor redColor];
    
    NCTableView *view = [[NCTableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:view];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
