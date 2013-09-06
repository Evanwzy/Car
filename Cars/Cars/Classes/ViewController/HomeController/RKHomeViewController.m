//
//  RKHomeViewController.m
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKHomeViewController.h"
#import "RKNewsViewController.h"
#import "RKInfoViewController.h"

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
    
    [newsBtn addTarget:self action:@selector(newsBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [companyBtn addTarget:self action:@selector(companyBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - button action
- (void)newsBtnPressed:(id)sender {
    RKNewsViewController *nvCtr =[[RKNewsViewController alloc]initWithNibName:[RKModels fullNameOfNibWithFileName:@"RKNewsViewController"] bundle:nil];
    [self.navigationController pushViewController:nvCtr animated:YES];
    [nvCtr release];
}

- (void)companyBtnPressed:(id)sender {
    RKInfoViewController *ivCtr =[[RKInfoViewController alloc]initWithNibName:[RKModels fullNameOfNibWithFileName:@"RKInfoViewController"] bundle:nil];
    [self.navigationController pushViewController:ivCtr animated:YES];
    [ivCtr release];
}

@end
