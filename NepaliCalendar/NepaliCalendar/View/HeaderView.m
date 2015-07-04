//
//  HeaderView.m
//  NepaliCalendar
//
//  Created by shrstha kusal on 7/3/15.
//  Copyright (c) 2015 shrstha kusal. All rights reserved.
//

#import "HeaderView.h"
#import "NCConstants.h"
#import "NCNepaliDateConverter.h"

@implementation HeaderView

// Initialization code
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *arrayColor = @[[UIColor grayColor], [UIColor blackColor], [UIColor blackColor], [UIColor blackColor], [UIColor blackColor], [UIColor blackColor], [UIColor grayColor]];
        NSUInteger cellSpace = 2;
        
        CGFloat width = (self.frame.size.width - 6 * cellSpace) / 7.;
        
        NCNepaliDateConverter *dateConverter = [[NCNepaliDateConverter alloc] init];
        NSArray *weeksName = dateConverter.nepaliDaysNameShortArray;
        
        for (int i = 0; i < [weeksName count]; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*(width+cellSpace), -5, width-10., self.frame.size.height)];
            [label setTextAlignment:NSTextAlignmentRight];
            [label setText:[weeksName objectAtIndex:i]];
            [label setTextColor:[arrayColor objectAtIndex:i]];
            [label setFont:[UIFont boldSystemFontOfSize:label.font.pointSize]];
            [label setAutoresizingMask:NC_LEFT_RIGHT | UIViewAutoresizingFlexibleWidth];
            [self addSubview:label];
        }
    }
    return self;
}


@end
