//
//  EvanViewController.h
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvanViewController : UIViewController {
    //button
    UIButton *backBtn;
    
    //label
    UILabel *titleLbl;
    
    //image
    UIImageView *topBg;
    UIImageView *bottomBg;
    UIImageView *bgImageView;
    
}

@property (nonatomic, retain) UIButton *backBtn;

@property (nonatomic, retain) UILabel *titleLbl;

@property (nonatomic, retain) UIImageView *topBg;
@property (nonatomic, retain) UIImageView *bottomBg;
@property (nonatomic, retain) UIImageView *bgImageView;

@end
