//
//  TestMonthNameConverter.m
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

@interface TestMonthNameConverter : XCTestCase

@property (strong, nonatomic) TextConverterVC   *textConverterVC;
@property (strong, nonatomic) FakeTextContainer *englishTextField;
@property (strong, nonatomic) FakeTextContainer *nepaliMonthLabel;

@end

@implementation TestMonthNameConverter

// Put setup code here. This method is called before the invocation of each test method in the class.
- (void)setUp {
    [super setUp];
    
    self.textConverterVC    = [[TextConverterVC alloc] init];
    self.englishTextField   = [[FakeTextContainer alloc] init];
    self.nepaliMonthLabel   = [[FakeTextContainer alloc] init];
    
    self.textConverterVC.nepaliMonth        = (UILabel *)self.nepaliMonthLabel;
    self.textConverterVC.englishTextField   = (UITextField *)self.englishTextField;
}

- (void)testBaisakh {
    self.englishTextField.text = @"1";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"बैशाख", @"1st Month of Nepali should be बैशाख");
}

- (void)testJestha {
    self.englishTextField.text = @"2";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"जेष्ठ", @"2nd Month of Nepali should be जेष्ठ");
}

- (void)testAsar {
    self.englishTextField.text = @"3";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"असार", @"3rd Month of Nepali should be असार");
}

- (void)testSharwan {
    self.englishTextField.text = @"4";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"साउन", @"4th Month of Nepali should be साउन");
}

- (void)testBhadra {
    self.englishTextField.text = @"5";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"भदौ", @"5th Month of Nepali should be भदौ");
}

- (void)testAsoj {
    self.englishTextField.text = @"6";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"अशोज", @"6th Month of Nepali should be अशोज");
}

- (void)testKartik {
    self.englishTextField.text = @"7";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"कार्तिक", @"7th Month of Nepali should be कार्तिक");
}

- (void)testMansir {
    self.englishTextField.text = @"8";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"मंसिर", @"8th Month of Nepali should be मंसिर");
}

- (void)testPoush {
    self.englishTextField.text = @"9";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"पुस", @"9th Month of Nepali should be पुस");
}

- (void)testMagh {
    self.englishTextField.text = @"10";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"माघ", @"10th Month of Nepali should be माघ");
}

- (void)testFalgun {
    self.englishTextField.text = @"11";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"फाल्गुन", @"11th Month of Nepali should be फाल्गुन");
}

- (void)testChaitra {
    self.englishTextField.text = @"12";
    [self.textConverterVC convertNumber];
    XCTAssertEqualObjects(self.nepaliMonthLabel.text, @"चैत्र", @"12th Month of Nepali should be चैत्र");
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
