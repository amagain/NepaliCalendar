//
//  NepaliCalendarView.m
//  NepaliCalendar
//
//  Created by shrstha kusal on 7/3/15.
//  Copyright (c) 2015 shrstha kusal. All rights reserved.
//

#import "NepaliCalendarView.h"
//For Section Header -> Year Title
#import "HeaderView.h"
//For Cell Header -> Weeks Title
#import "NCCollectionViewHeaderCell.h"
//For collcetion view cell
#import "NCCollectionViewCell.h"
#import "NepaliMonthsData.h"

@interface NepaliCalendarView() <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) HeaderView *headerView;
@property NSInteger startIndex;
@property NSInteger dayCount;

@end

@implementation NepaliCalendarView

#define kPaddingLeft 1
#define kPaddingTop  1
#define kPaddingRight 1
#define kPaddingBottom 1
#define kInterItemSpace 1
#define kLineSpace 1
#define kCellPerRow 7

- (instancetype)initWithFrame:(CGRect)frame andStartIndex:(NSInteger)index andDayCount:(NSInteger)count{
    self = [super initWithFrame:frame];
    if (self) {
        //initialize here
        self.startIndex = index;
        self.dayCount = count;
        [self mainFunction];
    }
    return self;
}

- (void)mainFunction {
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 60.f);    //for collection view header
    //        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.pagingEnabled = YES;
    [self addSubview:self.collectionView];
    
    //register for collection view header
    [self.collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" withReuseIdentifier:@"header"];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 42;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"row";
    [self.collectionView registerClass:[NCCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    NCCollectionViewCell *cell = (NCCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.row >= self.startIndex - 1 && indexPath.row <= self.dayCount + self.startIndex - 2) {
        cell.label.text = [[NSString alloc] initWithFormat:@"%ld", indexPath.row - self.startIndex + 2];
    } else {
        cell.label.text = @"-";
    }

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        self.headerView =
        (HeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        self.headerView.label.text = @"December";
        return self.headerView;
    }
    return nil;
}


- (CGSize)collectionView:(UICollectionViewCell *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cellSize;
    CGFloat width = (self.frame.size.width - (kPaddingLeft + kPaddingRight + (kCellPerRow - 1) * kInterItemSpace))/kCellPerRow;
    CGFloat height = width;
    cellSize = CGSizeMake(width, height);
    return cellSize;
}


//interitem spacing
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return kInterItemSpace;
}

//line spacing
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return kLineSpace;
}



@end
