//
//  NepaliCalendarView.m
//  NepaliCalendar
//
//  Created by shrstha kusal on 7/3/15.
//  Copyright (c) 2015 shrstha kusal. All rights reserved.
//

#import "NepaliCalendarView.h"

//For Header
#import "NCCollectionViewHeaderCell.h"
//For collcetion view cell
#import "NCCollectionViewCell.h"

@interface NepaliCalendarView() <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation NepaliCalendarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //initialize here
        [self mainFunction];
    }
    return self;
}

- (void)mainFunction {
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

- (NCCollectionViewHeaderCell *)makeHeaderCellWithIdentifier:(NSString *)identifier {
    NCCollectionViewHeaderCell *cell = [[NCCollectionViewHeaderCell alloc] initWithFrame:CGRectZero];
    return cell;
}

- (NCCollectionViewCell *)makeCollectionViewCellWithIdentifier:(NSString *)identifier {
    NCCollectionViewCell *cell = [[NCCollectionViewCell alloc] initWithFrame:CGRectZero];
    return cell;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 49;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row >= 0 && indexPath.row <= 6) {
        //month header
        static NSString *identifier = @"header";
        NCCollectionViewHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: identifier forIndexPath:indexPath];
        if (!cell) {
            cell = [self makeHeaderCellWithIdentifier:identifier];
        }
        return cell;
    } else {
        static NSString *identifier = @"row";
        NCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        if (!cell) {
            cell = [self makeCollectionViewCellWithIdentifier:identifier];
        }
        return cell;
    }
}





@end
