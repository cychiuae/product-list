//
//  ProductListCellSectionController.m
//  ProductListiOS
//
//  Created by YinYin Chiu on 31/1/2017.
//  Copyright © 2017 YinYin Chiu. All rights reserved.
//

#import "ProductListCellSectionController.h"
#import "ProductListCell.h"
#import "Product.h"

@interface ProductListCellSectionController()
@property (nonatomic, strong) Product *product;
@end

@implementation ProductListCellSectionController

- (CGFloat)minimumInteritemSpacing
{
    return 3.0f;
}

- (CGFloat)minimumLineSpacing
{
    return 3.0f;
}

- (NSInteger)numberOfItems
{
    return self.product ? 1 : 0;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    ProductListCell *cell = (ProductListCell *) [self.collectionContext dequeueReusableCellOfClass:[ProductListCell class]
                                                                              forSectionController:self
                                                                                           atIndex:index];
    cell.product = self.product;
    return cell;
}

- (void)didUpdateToObject:(id)object
{
    self.product = (Product *)object;
}

- (void)didSelectItemAtIndex:(NSInteger)index
{

}

@end
