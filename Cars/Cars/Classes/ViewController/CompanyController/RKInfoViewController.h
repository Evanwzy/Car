//
//  RKInfoViewController.h
//  Cars
//
//  Created by Evan on 13-8-14.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EvanViewController.h"

@interface RKInfoViewController : EvanViewController {
    IBOutlet UIScrollView *sv;
}

@property (retain, nonatomic) IBOutlet UIScrollView *sv;
@end
