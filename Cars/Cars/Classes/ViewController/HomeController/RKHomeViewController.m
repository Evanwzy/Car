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
#import "RKDriveViewController.h"
#import "RKShopViewController.h"
#import "RKPeopleViewController.h"



@interface RKHomeViewController ()
@property (strong, nonatomic) UIView *flashView;
@end

@implementation RKHomeViewController

@synthesize newsBtn, companyBtn, driveBtn, shopBtn, peopleBtn, infoImageView;

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
    [infoImageView release];
    [_infoLbl release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setNewsBtn:nil];
    [self setCompanyBtn:nil];
    [self setDriveBtn:nil];
    [self setShopBtn:nil];
    [self setPeopleBtn:nil];
    [self setInfoImageView:nil];
    [self setInfoLbl:nil];
    [super viewDidUnload];
}

#pragma mark - settingUI
- (void)setupUI {
    self.flashView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.flashView.userInteractionEnabled =NO;
    self.flashView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.flashView];
    [self.flashView setAlpha:0];
    
    self.infoLbl.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"alpha_bg.png"]];
    self.infoLbl.text =@"";
    
    backBtn.hidden =YES;
    topBg.hidden =YES;
    [self.view sendSubviewToBack:bgImageView];
    
    infoImageView.image =[UIImage imageNamed:[RKModels pathForImageWithFileName:@"news"]];
    
    [newsBtn addTarget:self action:@selector(newsBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [companyBtn addTarget:self action:@selector(companyBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [driveBtn addTarget:self action:@selector(driveBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [shopBtn addTarget:self action:@selector(driveBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [peopleBtn addTarget:self action:@selector(peopleBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view bringSubviewToFront:newsBtn];
    [self.view bringSubviewToFront:companyBtn];
    [self.view bringSubviewToFront:driveBtn];
    [self.view bringSubviewToFront:shopBtn];
    [self.view bringSubviewToFront:peopleBtn];
    [self.view bringSubviewToFront:self.flashView];
    
    SMRotaryWheel *wheel = [[SMRotaryWheel alloc] initWithFrame:CGRectMake(0, 0, 350, 350)
                                                    andDelegate:self
                                                   withSections:5];
    
    if (IS_IPHONE_5) {
        wheel.center = CGPointMake(320, 390);
    } else {
        wheel.center = CGPointMake(320, 300);
    }
    [self.view addSubview:wheel];
    
    newsBtn.hidden =NO;
    companyBtn.hidden =YES;
    driveBtn.hidden =YES;
    shopBtn.hidden =YES;
    peopleBtn.hidden =YES;
}

#pragma mark - screenShot
- (void)screenShot {
    [self.flashView setAlpha:0.5f];
    [UIView beginAnimations:@"flash screen" context:nil];
	[UIView setAnimationDuration:0.5f];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[self.flashView setAlpha:0.0f];
	[UIView commitAnimations];
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

- (void)driveBtnPressed:(id)sender {
    RKDriveViewController *dvCtr =[[RKDriveViewController alloc]initWithNibName:[RKModels fullNameOfNibWithFileName:@"RKDriveViewController"] bundle:nil];
    [self.navigationController pushViewController:dvCtr animated:YES];
    [dvCtr release];
}

- (void)shopBtnPressed:(id)sender {
    RKShopViewController *dvCtr =[[RKShopViewController alloc]initWithNibName:[RKModels fullNameOfNibWithFileName:@"RKShopViewController"] bundle:nil];
    [self.navigationController pushViewController:dvCtr animated:YES];
    [dvCtr release];
}

- (void)peopleBtnPressed:(id)sender {
    RKPeopleViewController *pvCtr =[[RKPeopleViewController alloc]initWithNibName:[RKModels fullNameOfNibWithFileName:@"RKPeopleViewController"] bundle:nil];
    [self.navigationController pushViewController:pvCtr animated:YES];
    [pvCtr release];
}


#pragma mark - wheel Delegate
-(void)wheelDidChangeValue:(NSString *)newValue {
    [self screenShot];
    switch ([newValue intValue]) {
        case newsType:
            newsBtn.hidden =NO;
            companyBtn.hidden =YES;
            driveBtn.hidden =YES;
            shopBtn.hidden =YES;
            peopleBtn.hidden =YES;
            infoImageView.image =[UIImage imageNamed:[RKModels pathForImageWithFileName:@"news"]];
            break;
        case companyType:
            newsBtn.hidden =YES;
            companyBtn.hidden =NO;
            driveBtn.hidden =YES;
            shopBtn.hidden =YES;
            peopleBtn.hidden =YES;
            infoImageView.image =[UIImage imageNamed:[RKModels pathForImageWithFileName:@"company"]];
            break;
        case driveType:
            newsBtn.hidden =YES;
            companyBtn.hidden =YES;
            driveBtn.hidden =NO;
            shopBtn.hidden =YES;
            peopleBtn.hidden =YES;
            infoImageView.image =[UIImage imageNamed:[RKModels pathForImageWithFileName:@"drive"]];
            break;
        case shopType:
            newsBtn.hidden =YES;
            companyBtn.hidden =YES;
            driveBtn.hidden =YES;
            shopBtn.hidden =NO;
            peopleBtn.hidden =YES;
            infoImageView.image =[UIImage imageNamed:[RKModels pathForImageWithFileName:@"shop"]];
            break;
        case peopleType:
            newsBtn.hidden =YES;
            companyBtn.hidden =YES;
            driveBtn.hidden =YES;
            shopBtn.hidden =YES;
            peopleBtn.hidden =NO;
            infoImageView.image =[UIImage imageNamed:[RKModels pathForImageWithFileName:@"people"]];
            break;
            
        default:
            break;
    }
}

@end
