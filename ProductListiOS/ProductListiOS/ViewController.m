//
//  ViewController.m
//  ProductListiOS
//
//  Created by YinYin Chiu on 31/1/2017.
//  Copyright © 2017 YinYin Chiu. All rights reserved.
//

#import "ViewController.h"
#import <YogaKit/UIView+Yoga.h>

#import "ProductList.h"
#import "Product.h"

@interface ViewController ()
@property (nonatomic) ProductList *productList;
@property (nonatomic) UIButton *addMoreButton;
@property (nonatomic) NSMutableArray<Product *> *products;
@end

@implementation ViewController

- (NSMutableArray<Product *> *)products
{
    if (!_products) {
        _products = [NSMutableArray array];
        for (int i = 0; i < 10; ++i) {
            Product *product = [[Product alloc] init];
            product.ID = [NSString stringWithFormat:@"Product-ID-%d", i];
            product.name = [NSString stringWithFormat:@"Product-%d", i];
            product.price = i * 10;
            [_products addObject:product];
        }
    }
    return _products;
}

- (ProductList *)productList
{
    if (!_productList) {
        _productList = [[ProductList alloc] initWithViewController:self];
        _productList.yoga.isEnabled = YES;
        _productList.yoga.flexGrow = 1;
    }
    return _productList;
}

- (UIButton *)addMoreButton
{
    if (!_addMoreButton) {
        _addMoreButton = [[UIButton alloc] init];
        [_addMoreButton setTitle:@"Add more"
                        forState:UIControlStateNormal];
        _addMoreButton.yoga.isEnabled = YES;
        _addMoreButton.yoga.height = 50.f;
        [_addMoreButton addTarget:self
                           action:@selector(addMore)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    return _addMoreButton;
}

- (void)viewDidLoad {
    self.view.yoga.isEnabled = YES;
    [self.view addSubview:self.productList];
    [self.view addSubview:self.addMoreButton];
    self.productList.products = self.products;
    [self.view.yoga applyLayout];
}

- (void)addMore
{
    NSMutableArray *newProducts = [NSMutableArray array];
    for (int i = 10; i < 20; ++i) {
        Product *product = [[Product alloc] init];
        product.ID = [NSString stringWithFormat:@"Product-ID-%d", i];
        product.name = [NSString stringWithFormat:@"Product-%d", i];
        product.price = i * 10;
        [newProducts addObject:product];
    }
    for (Product *p in self.products) {
        p.name = [NSString stringWithFormat:@"c-%@", p.name];
    }
    [newProducts addObjectsFromArray:self.products];
    self.products = newProducts;
    self.productList.products = self.products;
}

@end
