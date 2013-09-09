//
//  RKShopDetailViewController.h
//  Cars
//
//  Created by Asee on 9/9/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "EvanViewController.h"

@interface RKShopDetailViewController : EvanViewController {
    UIScrollView *sv;
    UIImageView *imageV;
}

@property (retain, nonatomic) IBOutlet UIScrollView *sv;
@property (retain, nonatomic) UIImageView *imageV;
@end
