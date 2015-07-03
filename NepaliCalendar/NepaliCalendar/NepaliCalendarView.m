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

@interface NepaliCalendarView() <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) HeaderView *headerView;

@end

@implementation NepaliCalendarView

#define kPaddingLeft 1
#define kPaddingTop  1
#define kPaddingRight 1
#define kPaddingBottom 1
#define kInterItemSpace 1
#define kLineSpace 1
#define kCellPerRow 7

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //initialize here
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        layout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 60.f);
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        [self mainFunction];
    }
    return self;
}

- (void)mainFunction {
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
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 49;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row >= 0 && indexPath.row <= 6) {
        //month header
        static NSString *identifier = @"header";
        [self.collectionView registerClass:[NCCollectionViewHeaderCell class] forCellWithReuseIdentifier:identifier];
        NCCollectionViewHeaderCell *cell = (NCCollectionViewHeaderCell *)[collectionView dequeueReusableCellWithReuseIdentifier: identifier forIndexPath:indexPath];
        cell.backgroundColor = [UIColor purpleColor];
        cell.label.text = @"Week";
        return cell;
    } else {
        static NSString *identifier = @"row";
        [self.collectionView registerClass:[NCCollectionViewCell class] forCellWithReuseIdentifier:identifier];
        NCCollectionViewCell *cell = (NCCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.label.text = [[NSString alloc] initWithFormat:@"%ld", indexPath.row];
        return cell;
    }
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
