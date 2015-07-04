//
//  NewViewController.m
//  NepaliCalendar
//
//  Created by shrstha kusal on 7/4/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import "NewViewController.h"
#import "NCTableView.h"


@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NCTableView *view = [[NCTableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:view];
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
