//
//  NSString+NepaliNumber.m
//
//
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
