//
//  Product.h
//  ProductListiOS
//
//  Created by YinYin Chiu on 31/1/2017.
//  Copyright © 2017 YinYin Chiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>

@interface Product : NSObject <IGListDiffable>
@property (nonatomic) NSString *ID;
@property (nonatomic) NSString *name;
@property (nonatomic) CGFloat price;
@end
