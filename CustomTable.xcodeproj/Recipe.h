//
//  Recipe.h
//  CustomTable
//
//  Created by Hemant V. Torsekar on 2015-04-20.
//  Copyright (c) 2015 Hemant V. Torsekar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic,copy) NSString *images;
@property (nonatomic, copy) NSString *prepTime;
@property (nonatomic, assign) BOOL isChecked;

@end
