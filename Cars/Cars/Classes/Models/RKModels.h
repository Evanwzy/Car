//
//  RKModels.h
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"
#import "RKHomeViewController.h"

@interface RKModels : NSObject

+ (NSString *)fullNameOfNibWithFileName:(NSString *)fileName;

+ (void)saveKey:(NSString *)keyStr;

+ (NSString *)pathForImageWithFileName:(NSString *)fileName;

@end
