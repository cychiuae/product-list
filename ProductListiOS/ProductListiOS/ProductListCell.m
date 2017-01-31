//
//  ProductListCell.m
//  ProductListiOS
//
//  Created by YinYin Chiu on 31/1/2017.
//  Copyright © 2017 YinYin Chiu. All rights reserved.
//

#import "ProductListCell.h"
#import <YogaKit/UIView+Yoga.h>

@interface ProductListCell()
@property (nonatomic) UIView *container;
@property (nonatomic) UIView *topContainer;
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UILabel *priceLabel;
@end

@implementation ProductListCell

- (UIView *)container
{
    if (!_container) {
        _container = [[UIView alloc] init];
        _container.yoga.isEnabled = YES;
    }
    return _container;
}

- (UIView *)topContainer
{
    if (!_topContainer) {
        _topContainer = [[UIView alloc] init];
        _topContainer.yoga.isEnabled = YES;
        _topContainer.backgroundColor = [UIColor redColor];
    }
    return _topContainer;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.yoga.isEnabled = YES;
    }
    return _nameLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.yoga.isEnabled = YES;
    }
    return _priceLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        self.container.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        self.container.yoga.isEnabled = YES;
        
        [self addSubview:self.container];
        [self.container addSubview:self.topContainer];
        [self.topContainer addSubview:self.nameLabel];
        [self.topContainer addSubview:self.priceLabel];
        
        self.topContainer.yoga.height = 22.0f;
        self.topContainer.yoga.flexDirection = YGFlexDirectionRow;
        self.topContainer.yoga.justifyContent = YGJustifyCenter;
        self.nameLabel.yoga.flexGrow = 1;
        self.priceLabel.yoga.flexGrow = 1;
        
        [self.container.yoga applyLayout];
    }
    return self;
}

- (void)setProduct:(Product *)product
{
    _product = product;
    self.nameLabel.text = product.name;
    self.priceLabel.text = [NSString stringWithFormat:@"$%f.2", product.price];
    [self.container.yoga applyLayout];
}

@end
