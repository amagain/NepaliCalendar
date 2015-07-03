//
//  ParentCell.m
//  NepaliCalendar
//
//  Created by shrstha kusal on 7/3/15.
//  Copyright (c) 2015 shrstha kusal. All rights reserved.
//

#import "ParentCell.h"

@implementation ParentCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //init here
        [self designCell];
    }
    return self;
}

- (void)designCell {
    self.label = [[UILabel alloc] initWithFrame:self.bounds];
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
}

@end
