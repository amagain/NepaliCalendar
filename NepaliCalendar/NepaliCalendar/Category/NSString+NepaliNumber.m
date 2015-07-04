//
//  NSString+NepaliNumber.m
//
//
//  The MIT License (MIT)
/*
 Copyright (c) <year> <copyright holders>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
//  Created by Leapfrog on 7/3/15.
//  Copyright (c) 2015 Leapfrog. All rights reserved.
//

#import "NSString+NepaliNumber.h"

@implementation NSString (NepaliNumber)

- (NSString *)stringToNepaliNumber {
    NSString *finalString = [self convertToNepaliString:self];
    return finalString;
}

- (NSString *)convertToNepaliString:(NSString *)numberValue {
    NSString *nepaliValue = [[NSString alloc] init];
    NSUInteger charLength = numberValue.length;
    @try {
        for (int i=0; i < charLength; i++) {
            nepaliValue = [nepaliValue stringByAppendingString:[self convert2SingleNepaliChar:[numberValue substringWithRange:NSMakeRange(i, 1)]]];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    return nepaliValue;
}

- (NSString *)convert2SingleNepaliChar:(NSString *)engChar {
    NSString* unicodeChar;
    if ([engChar isEqualToString:@"1"]) {
        unicodeChar = @"१";
    }
    else if ([engChar isEqualToString:@"2"]) {
        unicodeChar = @"२";
    }
    else if ([engChar isEqualToString:@"3"]) {
        unicodeChar = @"३";
    }
    else if ([engChar isEqualToString:@"4"]) {
        unicodeChar = @"४";
    }
    else if ([engChar isEqualToString:@"5"]) {
        unicodeChar = @"५";
    }
    else if ([engChar isEqualToString:@"6"]) {
        unicodeChar = @"६";
    }
    else if ([engChar isEqualToString:@"7"]) {
        unicodeChar = @"७";
    }
    else if ([engChar isEqualToString:@"8"]) {
        unicodeChar = @"८";
    }
    else if ([engChar isEqualToString:@"9"]) {
        unicodeChar = @"९";
    }
    else if ([engChar isEqualToString:@"0"]) {
        unicodeChar = @"०";
    }
    else if ([engChar isEqualToString:@":"]) {
        unicodeChar = @":";
    }
    else if ([engChar isEqualToString:@"a"]) {
        unicodeChar = @"a";
    }
    else if ([engChar isEqualToString:@"m"]) {
        unicodeChar = @"m";
    }
    else if ([engChar isEqualToString:@"p"]) {
        unicodeChar = @"p";
    }
    else if ([engChar isEqualToString:@" "]) {
        unicodeChar = @" ";
    }
    else if ([engChar isEqualToString:@"°"]) {
        unicodeChar = @"°";
    }
    return unicodeChar;
}

@end
