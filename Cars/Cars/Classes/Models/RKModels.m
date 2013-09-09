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

+ (void)saveKey:(NSString *)keyStr {
    [[NSUserDefaults standardUserDefaults] setValue:keyStr forKey:@"user_key"];
}

+ (NSString *)getKey {
    NSString *str =[[NSUserDefaults standardUserDefaults] objectForKey:@"user_key"];
    return str;
}

+ (NSString *)pathForImageWithFileName:(NSString *)fileName {
    NSString *pathStr;
    if (IS_IPHONE_5) {
        pathStr =[NSString stringWithFormat:@"%@_ip5.png", fileName];
    } else {
        pathStr =[NSString stringWithFormat:@"%@_ip4.png", fileName];
    }
    return pathStr;
}

@end
