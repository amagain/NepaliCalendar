//
//  TestDayNameConverter.m
//  NepaliCalendar
//
//  Created by Leapfrog on 7/3/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

// View Controler
#import "TextConverterVC.h"
// Fake Test Object
#import "FakeTextContainer.h"

@interface TestDayNameConverter : XCTestCase

@property (strong, nonatomic) TextConverterVC   *textConverterVC;
@property (strong, nonatomic) FakeTextContainer *englishTextField;
@property (strong, nonatomic) FakeTextContainer *nepaliMonthLabel;

@end

@implementation TestDayNameConverter

// Put setup code here. This method is called before the invocation of each test method in the class.
- (void)setUp {
    [super setUp];
    
    self.textConverterVC    = [[TextConverterVC alloc] init];
    self.englishTextField   = [[FakeTextContainer alloc] init];
    self.nepaliMonthLabel   = [[FakeTextContainer alloc] init];
    
    self.textConverterVC.nepaliMonth        = (UILabel *)self.nepaliMonthLabel;
    self.textConverterVC.englishTextField   = (UITextField *)self.englishTextField;
}



- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
