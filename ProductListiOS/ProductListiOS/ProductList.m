//
//  ProductList.m
//  ProductListiOS
//
//  Created by YinYin Chiu on 31/1/2017.
//  Copyright © 2017 YinYin Chiu. All rights reserved.
//

#import "ProductList.h"
#import <IGListKit/IGListKit.h>
#import <YogaKit/UIView+Yoga.h>
#import "ProductListCellSectionController.h"

@interface ProductList() <IGListAdapterDataSource>
@property (nonatomic) IGListCollectionView *collectionView;
@property (nonatomic) IGListAdapter *adapter;
@end

@implementation ProductList

- (IGListCollectionView *)collectionView
{
    if (!_collectionView) {
        IGListGridCollectionViewLayout *layout = [[IGListGridCollectionViewLayout alloc] init];
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        int numberOfCols = 2;
        CGFloat cellMargin = 3.0f;
        CGFloat cellWidth = (width - (numberOfCols + 1) * cellMargin) / numberOfCols;
        CGFloat cellHeight = cellWidth + 22.0f;
        CGSize size = CGSizeMake(cellWidth, cellHeight);
        layout.itemSize = size;
        _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectZero
                                                 collectionViewLayout:layout];
        _collectionView.yoga.isEnabled = YES;
        _collectionView.yoga.flexGrow = 1;
    }
    return _collectionView;
}

- (IGListAdapter *)adapter
{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init]
                                           viewController:self.viewController
                                         workingRangeSize:0];
    }
    return _adapter;
}

- (instancetype)initWithViewController:(UIViewController *)viewController
{
    self = [super init];
    if (self) {
        self.yoga.isEnabled = YES;
        self.viewController = viewController;
        [self addSubview:self.collectionView];
        self.adapter.collectionView = self.collectionView;
        self.adapter.dataSource = self;
        [self.yoga applyLayout];
    }
    return self;
}

- (void)setProducts:(NSArray<Product *> *)products
{
    _products = products;
    [self.adapter performUpdatesAnimated:YES
                              completion:nil];
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
    return self.products;
}

- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    return [ProductListCellSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter
{
    return nil;
}

@end
