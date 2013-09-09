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

@synthesize keyBoardController, accountText, pwdConfirmText, pwdText, verifyText, verifyBtn, registerBtn, account, password;

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
    [account release];
    [password release];
    [keyBoardController release];
    [_timer release];
    [accountText release];
    [pwdText release];
    [pwdConfirmText release];
    [verifyText release];
    [registerBtn release];
    [verifyBtn release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setAccount:nil];
    [self setPassword:nil];
    [self setKeyBoardController:nil];
    [self setTimer:nil];
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
    backBtn.tag =901;
    
    [self.view sendSubviewToBack:bgImageView];
    self.waitCount =60;
    [registerBtn addTarget:self action:@selector(registerBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [verifyBtn addTarget:self action:@selector(verifyBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - button action
- (void)registerBtnPressed:(id)sender {
    if (accountText.text.length !=0 &&pwdText.text.length !=0&& pwdConfirmText.text.length!=0&& verifyText.text.length !=0) {
        registerBtn.userInteractionEnabled =NO;
        [self performSelector:@selector(reuseBtn) withObject:nil afterDelay:10.0f];
        NSArray *postArr =@[accountText.text, pwdText.text, pwdConfirmText.text, verifyText.text];
        NSArray *postKeyArr =@[@"account", @"password", @"password_confirm", @"verify"];
        _type =2;
        [manager asiFormDataRequestWithUrlStr:RegisterUrl AndPostValue:postArr PostKey:postKeyArr];
    } else {
        [Common showNetWorokingAlertWithMessage:@"请填写完整信息"];
    }
}

- (void)waitingResend {
    [self.verifyBtn setTitle:[NSString stringWithFormat:@"重新发送(%d)", self.waitCount] forState:UIControlStateNormal];
    
    self.waitCount--;
    
    if (self.waitCount ==0) {
        self.verifyBtn.userInteractionEnabled =YES;
        [self.verifyBtn setTitle:@"发送验证" forState:UIControlStateNormal];
        [self.timer invalidate];
        self.waitCount =60;
    }
}
- (void)reuseBtn {
    registerBtn.userInteractionEnabled =YES;
}

- (void)verifyBtnPressed:(id)sender {
    
    if (accountText.text.length !=0) {
        _type =1;
        NSArray *postArr =@[accountText.text];
        NSArray *postKeyArr =@[@"telephone"];
        self.timer =[NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(waitingResend) userInfo:nil repeats:YES];
        [[NSRunLoop  currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        verifyBtn.userInteractionEnabled =NO;
        [manager asiFormDataRequestWithUrlStr:VerifyUrl AndPostValue:postArr PostKey:postKeyArr];
        [self.timer fire];
    } else {
        [Common showNetWorokingAlertWithMessage:@"请填写完整信息"];
    }
}

- (void)requestSuccWithData:(NSDictionary *)data {
    if (_type ==2) {
        _type =3;
        NSArray *postArr =@[account, password];
        NSArray *postKeyArr =@[@"account", @"password"];
        [manager asiFormDataRequestWithUrlStr:LoginUrl AndPostValue:postArr PostKey:postKeyArr];
        
    } else if (_type ==3){
        [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"IsLogined"];
        NSString *userKey =[data objectForKey:@"user_key"];
        [RKModels saveKey:userKey];
        [Common cancelAllRequestOfAllQueue];
        [self.navigationController popToRootViewControllerAnimated:YES];
        [Common showNetWorokingAlertWithMessageWithSucc:@"您已经成功注册并登陆"];
    }
}

- (void)requestFailedWithData:(NSString *)msgStr {
    [Common showNetWorokingAlertWithMessage:msgStr];
    registerBtn.userInteractionEnabled =YES;
}

#pragma mark - UIKeyboardViewController delegate methods

- (void)alttextFieldDidEndEditing:(UITextField *)textField {
    
}

-(void)alttextFieldDidBeginEditing:(UITextField *)textField {
    
}
@end
