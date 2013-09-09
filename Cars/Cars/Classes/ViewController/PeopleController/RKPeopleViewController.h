//
//  RKPeopleViewController.h
//  Cars
//
//  Created by Asee on 9/6/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "EvanViewController.h"
#import "UIKeyboardViewController.h"
#import "RKModels.h"

@interface RKPeopleViewController : EvanViewController <UIKeyboardViewControllerDelegate,  UITextFieldDelegate> {
    UIButton *loginBtn;
    UIButton *registerBtn;
    
    UIKeyboardViewController *keyBoardController;
}

@property (retain, nonatomic) IBOutlet UIButton *loginBtn;
@property (retain, nonatomic) IBOutlet UIButton *registerBtn;

@property (retain, nonatomic) IBOutlet UITextField *accountText;
@property (retain, nonatomic) IBOutlet UITextField *pwdText;

@property (retain, nonatomic) UIKeyboardViewController *keyBoardController;
@end
