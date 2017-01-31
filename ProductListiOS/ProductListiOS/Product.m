//
//  Product.m
//  ProductListiOS
//
//  Created by YinYin Chiu on 31/1/2017.
//  Copyright © 2017 YinYin Chiu. All rights reserved.
//

#import "Product.h"

@implementation Product

- (id<NSObject>)diffIdentifier
{
    return self.ID;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object
{
    Product *rhs = (Product *)object;
    BOOL nameIsEqual = [self.name isEqualToString:rhs.name];
    BOOL priceIsEqual = ABS(self.price - rhs.price) < FLT_EPSILON;
    return nameIsEqual && priceIsEqual;
}

@end
