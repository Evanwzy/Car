//
//  EvanViewController.h
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface EvanViewController : UIViewController <RKNetWorkingManagerDelegate>{
    //button
    UIButton *backBtn;
    
    //label
    UILabel *titleLbl;
    
    //image
    UIImageView *topBg;
    UIImageView *bottomBg;
    UIImageView *bgImageView;
    
    RKNetWorkingManager *manager;
}

@property (nonatomic, retain) UIButton *backBtn;

@property (nonatomic, retain) UILabel *titleLbl;

@property (nonatomic, retain) RKNetWorkingManager *manager;

@property (nonatomic, retain) UIImageView *topBg;
@property (nonatomic, retain) UIImageView *bottomBg;
@property (nonatomic, retain) UIImageView *bgImageView;

@end
