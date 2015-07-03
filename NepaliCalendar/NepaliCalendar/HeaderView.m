//
//  HeaderView.m
//  NepaliCalendar
//
//  Created by shrstha kusal on 7/3/15.
//  Copyright (c) 2015 shrstha kusal. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self designView];
    }
    return self;
}

- (void)designView {
    self.label = [[UILabel alloc] initWithFrame:self.frame];
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
}

@end
