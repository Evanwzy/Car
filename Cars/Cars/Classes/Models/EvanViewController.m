//
//  EvanViewController.m
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "EvanViewController.h"

@interface EvanViewController ()

@end

@implementation EvanViewController

@synthesize backBtn;

@synthesize titleLbl;

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
}

- (void)dealloc
{
    [backBtn release];
    [super dealloc];
}

- (void)setLayOut {
    self.navigationController.navigationBarHidden =YES;
    
    //set back button
    self.backBtn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backBtn setFrame:CGRectMake(0.0f, 0.0f, 44.0f, 44.0f)];
    [backBtn addTarget:self action:@selector(backBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
    
}

#pragma mark - button action
- (void)backBtnPressed:(id)sender {
    UIButton *button=sender;
    if (button.tag !=0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    [button release];

}

@end
