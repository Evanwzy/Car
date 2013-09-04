//
//  RKHomeViewController.m
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKHomeViewController.h"

@interface RKHomeViewController ()

@end

@implementation RKHomeViewController

@synthesize newsBtn, companyBtn, driveBtn, shopBtn, peopleBtn;

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [newsBtn release];
    [companyBtn release];
    [driveBtn release];
    [shopBtn release];
    [peopleBtn release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setNewsBtn:nil];
    [self setCompanyBtn:nil];
    [self setDriveBtn:nil];
    [self setShopBtn:nil];
    [self setPeopleBtn:nil];
    [super viewDidUnload];
}

#pragma mark - settingUI
- (void)setupUI {
    backBtn.hidden =YES;
}
@end
