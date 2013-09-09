//
//  RKShopDetailViewController.m
//  Cars
//
//  Created by Asee on 9/9/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKShopDetailViewController.h"

@interface RKShopDetailViewController ()

@end

@implementation RKShopDetailViewController

@synthesize sv, imageV;

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
    
    [self.view sendSubviewToBack:bgImageView];
    titleLbl.text =@"商品详情";
    self.imageV =[[UIImageView alloc]init];
    // Do any additional setup after loading the view from its nib.
    int index =[[[NSUserDefaults standardUserDefaults] valueForKey:@"index"]intValue ];
    switch (index) {
        case 0:
            imageV.image =[UIImage imageNamed:@"shop01.png"];
            break;
        case 1:
            imageV.image =[UIImage imageNamed:@"shop02.png"];
            break;
        case 2:
            imageV.image =[UIImage imageNamed:@"shop03.png"];
            break;
            
        default:
            break;
    }
    imageV.frame =CGRectMake(0.0f, 0.0f, 320.0f, 624.0f);
    [sv addSubview:imageV];
    [sv setContentSize:CGSizeMake(320.0f, 624.0f)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [imageV release];
    [sv release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setImageV:nil];
    [self setSv:nil];
    [super viewDidUnload];
}
@end
