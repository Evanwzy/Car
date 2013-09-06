//
//  RKDriveViewController.h
//  Cars
//
//  Created by Asee on 9/5/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "EvanViewController.h"
#import "NIDropDown.h"

@interface RKDriveViewController : EvanViewController <NIDropDownDelegate>{
    IBOutlet UIButton *carBtn;
    IBOutlet UIButton *sirBtn;
    IBOutlet UIButton *yearBtn;
    IBOutlet UIButton *dateBtn;
    
    
    NIDropDown *dropDown;
    NIDropDown *dropDown2;
    NIDropDown *dropDown3;
    NIDropDown *dropDown4;
}

@property (retain, nonatomic) IBOutlet UIButton *carBtn;
@property (retain, nonatomic) IBOutlet UIButton *sirBtn;
@property (retain, nonatomic) IBOutlet UIButton *yearBtn;
@property (retain, nonatomic) IBOutlet UIButton *dateBtn;
@end
