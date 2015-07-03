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
@property (strong, nonatomic) FakeTextContainer *nepaliDayLabel;

@end

@implementation TestDayNameConverter

// Put setup code here. This method is called before the invocation of each test method in the class.
- (void)setUp {
    [super setUp];
    
    self.textConverterVC    = [[TextConverterVC alloc] init];
    self.englishTextField   = [[FakeTextContainer alloc] init];
    self.nepaliDayLabel     = [[FakeTextContainer alloc] init];
    
    self.textConverterVC.nepaliDay          = (UILabel *)self.nepaliDayLabel;
    self.textConverterVC.englishTextField   = (UITextField *)self.englishTextField;
}

- (void)testSunday {
    self.englishTextField.text = @"1";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliDayLabel.text, @"आइतवार", @"1st Day (Sunday) of Nepali should be आइतवार");
}

- (void)testMonday {
    self.englishTextField.text = @"2";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliDayLabel.text, @"सोमवार", @"2nd Day (Monday) of Nepali should be सोमवार");
}

- (void)testTuesday {
    self.englishTextField.text = @"3";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliDayLabel.text, @"मङ्लबार", @"3rd Day (Tuesday) of Nepali should be मङ्लबार");
}

- (void)testWenesday {
    self.englishTextField.text = @"4";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliDayLabel.text, @"बुधबार", @"4th Day (Wenesday) of Nepali should be बुधबार");
}

- (void)testThursday {
    self.englishTextField.text = @"5";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliDayLabel.text, @"बिहिबार", @"5th Day (Thursday) of Nepali should be बिहिबार");
}

- (void)testFriday {
    self.englishTextField.text = @"6";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliDayLabel.text, @"शुक्रबार", @"6th Day (Friday) of Nepali should be शुक्रबार");
}

- (void)testSaturday {
    self.englishTextField.text = @"7";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliDayLabel.text, @"शनिबार", @"7th Day (Saturday) of Nepali should be शनिबार");
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
