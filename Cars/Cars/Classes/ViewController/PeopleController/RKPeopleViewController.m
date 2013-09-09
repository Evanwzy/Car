//
//  RKPeopleViewController.m
//  Cars
//
//  Created by Asee on 9/6/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKPeopleViewController.h"
#import "RKRegisterViewController.h"

@interface RKPeopleViewController ()

@end

@implementation RKPeopleViewController

@synthesize loginBtn, registerBtn;

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


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [keyBoardController release];
    [loginBtn release];
    [registerBtn release];
    [_accountText release];
    [_pwdText release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLoginBtn:nil];
    [self setRegisterBtn:nil];
    [self setAccountText:nil];
    [self setPwdText:nil];
    [super viewDidUnload];
}

#pragma mark -settingUI
- (void)setupUI {
    [self.view sendSubviewToBack:bgImageView];
    titleLbl.text =@"个人中心";
    
    [registerBtn addTarget:self action:@selector(registerBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn addTarget:self action:@selector(loginBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - button action
- (void)registerBtnPressed:(id)sender {
    RKRegisterViewController *rvCtr =[[RKRegisterViewController alloc]initWithNibName:[RKModels fullNameOfNibWithFileName:@"RKRegisterViewController"] bundle:nil];
    [self.navigationController pushViewController:rvCtr animated:YES];
    [rvCtr release];
}

- (void)loginBtnPressed:(id)sender {
    if (_accountText.text.length !=0 && _pwdText.text.length !=0) {
        NSArray *postArr =@[_accountText.text, _pwdText.text];
        NSArray *postKeyArr =@[@"account", @"password"];
        
        [manager asiFormDataRequestWithUrlStr:LoginUrl AndPostValue:postArr PostKey:postKeyArr];
    } else {
        [Common showNetWorokingAlertWithMessage:@"请填写完整信息"];
    }
}

-(void)requestSuccWithData:(NSDictionary *)data {
    NSString *userKey =[data objectForKey:@"user_key"];
    [RKModels saveKey:userKey];
    [Common cancelAllRequestOfAllQueue];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)requestFailedWithData:(NSString *)msgStr {
    NSLog(@"%@", msgStr);
}

#pragma mark - UIKeyboardViewController delegate methods



- (void)alttextFieldDidEndEditing:(UITextField *)textField {
}

-(void)alttextFieldDidBeginEditing:(UITextField *)textField {
}
@end
