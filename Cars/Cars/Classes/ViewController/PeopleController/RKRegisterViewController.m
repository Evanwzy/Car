//
//  RKRegisterViewController.m
//  Cars
//
//  Created by Asee on 9/6/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKRegisterViewController.h"

@interface RKRegisterViewController ()

@end

@implementation RKRegisterViewController

@synthesize accountText, pwdConfirmText, pwdText, verifyText, verifyBtn, registerBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated {
    keyBoardController=[[UIKeyboardViewController alloc] initWithControllerDelegate:self];
    
    [keyBoardController addToolbarToKeyboard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [keyBoardController release];
    [accountText release];
    [pwdText release];
    [pwdConfirmText release];
    [verifyText release];
    [registerBtn release];
    [verifyBtn release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setAccountText:nil];
    [self setPwdText:nil];
    [self setPwdConfirmText:nil];
    [self setVerifyText:nil];
    [self setRegisterBtn:nil];
    [self setVerifyBtn:nil];
    [super viewDidUnload];
}

#pragma mark settingUI 
- (void)setupUI {
    [registerBtn addTarget:self action:@selector(registerBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [verifyBtn addTarget:self action:@selector(verifyBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - button action
- (void)registerBtnPressed:(id)sender {
    if (accountText.text.length !=0 &&pwdText.text.length !=0&& pwdConfirmText.text.length!=0&& verifyText.text.length !=0) {
        NSArray *postArr =@[accountText.text, pwdText.text, pwdConfirmText.text, verifyText.text];
        NSArray *postKeyArr =@[@"account", @"password", @"password_confirm", @"verify"];
        
        [manager asiFormDataRequestWithUrlStr:RegisterUrl AndPostValue:postArr PostKey:postKeyArr];
    } else {
        [Common showNetWorokingAlertWithMessage:@"请填写完整信息"];
    }
}

- (void)verifyBtnPressed:(id)sender {
    
    if (accountText.text.length !=0) {
        NSArray *postArr =@[accountText.text];
        NSArray *postKeyArr =@[@"telephone"];
        
        [manager asiFormDataRequestWithUrlStr:VerifyUrl AndPostValue:postArr PostKey:postKeyArr];
    } else {
        [Common showNetWorokingAlertWithMessage:@"请填写完整信息"];
    }
}

- (void)requestSuccWithData:(NSDictionary *)data {
    NSLog(@"%@", data);
}

- (void)requestFailedWithData:(NSString *)msgStr {
    [Common showNetWorokingAlertWithMessage:msgStr];
}

#pragma mark - UIKeyboardViewController delegate methods



- (void)alttextFieldDidEndEditing:(UITextField *)textField {
    
}

-(void)alttextFieldDidBeginEditing:(UITextField *)textField {
    
}
@end
