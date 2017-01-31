//
//  ProductList.h
//  ProductListiOS
//
//  Created by YinYin Chiu on 31/1/2017.
//  Copyright © 2017 YinYin Chiu. All rights reserved.
//
@import UIKit;
#import "Product.h"

@interface ProductList : UIView

@property (nonatomic) UIViewController *viewController;
@property (nonatomic) NSArray<Product *> *products;

- (instancetype)initWithViewController:(UIViewController *)viewController;

@end
