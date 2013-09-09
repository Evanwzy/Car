//
//  EvanViewController.m
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "EvanViewController.h"

#import "RKModels.h"

@interface EvanViewController ()

@end

@implementation EvanViewController

@synthesize backBtn;

@synthesize titleLbl;

@synthesize manager;

@synthesize topBg, bottomBg, bgImageView;

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
	// Do any additional setup after loading the view.
    manager =[RKNetWorkingManager sharedManager];
    manager.delegate =self;
    
    [self setLayOut];
}

- (void)didReceiveMemoryWarning
{                   
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidUnload {
    [super viewDidUnload];
    self.backBtn =nil;
    self.topBg =nil;
    self.bgImageView =nil;
    self.bgImageView =nil;
}

- (void)dealloc
{
    [topBg release];
    [bgImageView release];
    [backBtn release];
    [super dealloc];
}

- (void)setLayOut {
    self.navigationController.navigationBarHidden =YES;
    
    //set back button
    self.backBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:CGRectMake(7.0f, 10.0f, 46.0f, 26.0f)];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    backBtn.titleLabel.textColor =[UIColor lightGrayColor];
    backBtn.titleLabel.font =[UIFont systemFontOfSize:13.0f];
    [backBtn addTarget:self action:@selector(backBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //setimage
    [backBtn setBackgroundImage:[UIImage imageNamed:[RKModels pathForImageWithFileName:@"backBtn"]] forState:UIControlStateNormal];
    
    self.topBg =[[UIImageView alloc]initWithImage:[UIImage imageNamed:[RKModels pathForImageWithFileName:@"topBarBg"]]];
    topBg.frame =CGRectMake(0.0f, 0.0f, 320.0f, 44.0f);
    self.titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f) ];
    titleLbl.backgroundColor =[UIColor clearColor];
    titleLbl.textColor =[UIColor lightGrayColor];
    titleLbl.font =[UIFont boldSystemFontOfSize:18.0f];
    titleLbl.textAlignment =UITextAlignmentCenter;
    
    if (IS_IPHONE_5) {
        bgImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 568.0f)];
    } else {
        bgImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    }
    bgImageView.image =[UIImage imageNamed:[RKModels pathForImageWithFileName:@"background"]];
    
    
    [self.view addSubview:bgImageView];
    [self.view addSubview:topBg];
    [self.view addSubview:titleLbl];
    [self.view addSubview:backBtn];
    
}

#pragma mark - button action
- (void)backBtnPressed:(UIButton *)sender {
    [Common cancelAllRequestOfAllQueue];
    if (sender.tag !=0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"POPTOROOTCONTROLLER" object:nil];
        
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"POPCONTROLLER" object:nil];
    }
}

@end
