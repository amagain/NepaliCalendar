//
//  TestConverter.m
//  NepaliCalendar
//
//  Created by Leapfrog on 7/3/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

// 3rd Party Framework
#import <UIKit/UIKit.h>
@import XCTest;
// View Controler
#import "TextConverterVC.h"
// Fake Test Object
#import "FakeTextContainer.h"

@interface TestNumberConverter : XCTestCase

@property (strong, nonatomic) TextConverterVC   *textConverterVC;
@property (strong, nonatomic) FakeTextContainer *englishTextField;
@property (strong, nonatomic) FakeTextContainer *nepaliLabel;

@end

@implementation TestNumberConverter

// Put setup code here. This method is called before the invocation of each test method in the class.
- (void)setUp {
    [super setUp];
    self.textConverterVC = [[TextConverterVC alloc] init];
    self.englishTextField = [[FakeTextContainer alloc] init];
    self.nepaliLabel = [[FakeTextContainer alloc] init];

    self.textConverterVC.nepaliLabel = (UILabel *)self.nepaliLabel;
    self.textConverterVC.englishTextField = (UITextField *)self.englishTextField;
}

- (void)testNumberOne {
    self.englishTextField.text = @"1";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"१", @"Converter of English Number 1 should return १");
}

- (void)testNumberTwo {
    self.englishTextField.text = @"2";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"२", @"Converter of English Number 2 should return २");
}

- (void)testNumberThree {
    self.englishTextField.text = @"3";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"३", @"Converter of English Number 3 should return ३");
}

- (void)testNumberFour {
    self.englishTextField.text = @"4";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"४", @"Converter of English Number 4 should return ४");
}

- (void)testNumberFive {
    self.englishTextField.text = @"5";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"५", @"Converter of English Number 5 should return ५");
}

- (void)testNumberSix {
    self.englishTextField.text = @"6";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"६", @"Converter of English Number 6 should return ६");
}

- (void)testNumberSeven {
    self.englishTextField.text = @"7";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"७", @"Converter of English Number 7 should return ७");
}

- (void)testNumberEight {
    self.englishTextField.text = @"8";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"८", @"Converter of English Number 8 should return ८");
}

- (void)testNumberNine {
    self.englishTextField.text = @"9";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"९", @"Converter of English Number 9 should return ९");
}

- (void)testNumberZero {
    self.englishTextField.text = @"0";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"०", @"Converter of English Number 0 should return ०");
}

- (void)testOneNotTwo {
    self.englishTextField.text = @"1";
    [self.textConverterVC convertNumber];
    XCTAssertNotEqual(self.nepaliLabel.text, @"२", @"Converter of English Number 0 should not return २");
}

- (void)testConbinationTextTest {
    self.englishTextField.text = @"12";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliLabel.text, @"१२", @"Convert of Englsih Number 12 should should return १२");
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
