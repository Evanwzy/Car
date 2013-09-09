//
//  RKShopViewController.m
//  Cars
//
//  Created by Asee on 9/6/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKShopViewController.h"

@interface RKShopViewController ()

@end

@implementation RKShopViewController

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
    titleLbl.text =@"车神优选";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
