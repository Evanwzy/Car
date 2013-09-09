//
//  RKRegisterViewController.h
//  Cars
//
//  Created by Asee on 9/6/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "EvanViewController.h"
#import "UIKeyboardViewController.h"
#import "RKModels.h"
#import "Constents.h"
#import <time.h>

@interface RKRegisterViewController : EvanViewController <UIKeyboardViewControllerDelegate, UITextFieldDelegate> {
    UITextField *accountText;
    UITextField *pwdText;
    UITextField *pwdConfirmText;
    UITextField *verifyText;
    
    UIButton *registerBtn;
    UIButton *verifyBtn;
    
    UIKeyboardViewController *keyBoardController;
    
    NSString *account;
    NSString *password;
    
}

@property int waitCount;
@property int type;
@property (retain , nonatomic) NSTimer *timer;

@property (retain, nonatomic) UIKeyboardViewController *keyBoardController;

@property (retain, nonatomic) NSString *account;
@property (retain, nonatomic) NSString *password;

@property (retain, nonatomic) IBOutlet UITextField *accountText;
@property (retain, nonatomic) IBOutlet UITextField *pwdText;
@property (retain, nonatomic) IBOutlet UITextField *pwdConfirmText;
@property (retain, nonatomic) IBOutlet UITextField *verifyText;

@property (retain, nonatomic) IBOutlet UIButton *registerBtn;
@property (retain, nonatomic) IBOutlet UIButton *verifyBtn;
@end
