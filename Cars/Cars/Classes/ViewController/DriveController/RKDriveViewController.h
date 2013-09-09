//
//  RKDriveViewController.h
//  Cars
//
//  Created by Asee on 9/5/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "EvanViewController.h"
#import "NIDropDown.h"
#import "UIKeyboardViewController.h"

@interface RKDriveViewController : EvanViewController <NIDropDownDelegate, UIKeyboardViewControllerDelegate>{
    IBOutlet UIButton *carBtn;
    IBOutlet UIButton *sirBtn;
    IBOutlet UIButton *yearBtn;
    IBOutlet UIButton *dateBtn;
    IBOutlet UIButton *commitBtn;
    
    UITextField *familyNameText;
    UITextField *nameText;
    UITextField *cellphoneText;
    UITextField *mailText;
    UITextField *cardText;
    
    NIDropDown *dropDown;
    NIDropDown *dropDown2;
    NIDropDown *dropDown3;
    NIDropDown *dropDown4;
    
    UIKeyboardViewController *keyBoardController;
}

@property (retain, nonatomic) IBOutlet UIButton *carBtn;
@property (retain, nonatomic) IBOutlet UIButton *sirBtn;
@property (retain, nonatomic) IBOutlet UIButton *yearBtn;
@property (retain, nonatomic) IBOutlet UIButton *dateBtn;

@property (retain, nonatomic) IBOutlet UIButton *commitBtn;

@property (retain, nonatomic) IBOutlet UITextField *familyNameText;
@property (retain, nonatomic) IBOutlet UITextField *nameText;
@property (retain, nonatomic) IBOutlet UITextField *cellphoneText;
@property (retain, nonatomic) IBOutlet UITextField *mailText;
@property (retain, nonatomic) IBOutlet UITextField *cardText;

@end
