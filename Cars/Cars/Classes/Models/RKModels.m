//
//  RKModels.m
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKModels.h"

@implementation RKModels

+ (NSString *)fullNameOfNibWithFileName:(NSString *)fileName {
    if (IS_IPHONE_5) {
        return [fileName stringByAppendingString:@"_ip5"];
    } else {
        return [fileName stringByAppendingString:@"_ip4"];
    }
}

@end
