//
//  Constents.h
//  Lohas
//
//  Created by Evan on 13-8-15.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

//Server Address
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//#define SERVER_URL @"http://192.168.1.5/lehuo/index.php?s="
#define SERVER_URL @"http://lehuo.d23684.51kweb.com/lehuo/index.php?s="


//Url Address
#define LoginUrl [NSString stringWithFormat:@"%@/ApiLogin/login", SERVER_URL]
#define RegisterUrl [NSString stringWithFormat:@"%@/ApiLogin/register", SERVER_URL]
#define VerifyUrl [NSString stringWithFormat:@"%@/ApiSend/register_send", SERVER_URL]