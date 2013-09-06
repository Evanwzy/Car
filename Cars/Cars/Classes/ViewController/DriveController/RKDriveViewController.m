//
//  RKDriveViewController.m
//  Cars
//
//  Created by Asee on 9/5/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKDriveViewController.h"

@interface RKDriveViewController ()

@end

@implementation RKDriveViewController

@synthesize carBtn, sirBtn, yearBtn, dateBtn;

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
    [carBtn release];
    [sirBtn release];
    [yearBtn release];
    [dateBtn release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setCarBtn:nil];
    [self setSirBtn:nil];
    [self setYearBtn:nil];
    [self setDateBtn:nil];
    [super viewDidUnload];
}

#pragma mark - settingUI
- (void)setupUI {
    [carBtn addTarget:self action:@selector(carBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [sirBtn addTarget:self action:@selector(sirBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [yearBtn addTarget:self action:@selector(yearBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [dateBtn addTarget:self action:@selector(dateBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -button action
- (void)carBtnPressed:(UIButton *)sender {
    NSArray * arr = [[NSArray alloc] initWithObjects:@"法拉利458 Italia", @"兰博基尼",  nil];
    if(dropDown == nil) {
        carBtn.selected =YES;
        CGFloat f = 120;
        dropDown = [[NIDropDown alloc]showDropDown:sender :200*[arr count] :arr];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self relBtn:sender];
    }
    
    if(dropDown2 != nil) {
        [dropDown hideDropDown:sirBtn];
        [self relBtn:sirBtn];
    }
    if(dropDown3 != nil) {
        [dropDown3 hideDropDown:yearBtn];
        [self relBtn:yearBtn];
    }
    if(dropDown4 != nil) {
        [dropDown3 hideDropDown:dateBtn];
        [self relBtn:dateBtn];
    }
}

- (void)sirBtnPressed:(UIButton *)sender {
    NSArray * arr = [[NSArray alloc] initWithObjects:@"先生", @"小姐",  @"夫人", @"爵士", @"博士", @"女士", @"教授", nil];
    if(dropDown2 == nil) {
        sirBtn.selected =YES;
        CGFloat f = 120;
        dropDown2 = [[NIDropDown alloc]showDropDown:sender :200*[arr count] :arr];
        dropDown2.delegate = self;
    }
    else {
        [dropDown2 hideDropDown:sender];
        [self relBtn:sender];
    }
    
    if(dropDown != nil) {
        [dropDown hideDropDown:carBtn];
        [self relBtn:carBtn];
    }
    if(dropDown3 != nil) {
        [dropDown3 hideDropDown:yearBtn];
        [self relBtn:yearBtn];
    }
    if(dropDown4 != nil) {
        [dropDown3 hideDropDown:dateBtn];
        [self relBtn:dateBtn];
    }
}

- (void)yearBtnPressed:(UIButton *)sender {
    NSArray * arr = [[NSArray alloc] initWithObjects:@"2年以下", @"2-5年",@"5年以上",  nil];
    if(dropDown3 == nil) {
        yearBtn.selected =YES;
        CGFloat f = 120;
        dropDown3 = [[NIDropDown alloc]showDropDown:sender :200*[arr count] :arr];
        dropDown3.delegate = self;
    }
    else {
        [dropDown3 hideDropDown:sender];
        [self relBtn:sender];
    }
    
    if(dropDown != nil) {
        [dropDown hideDropDown:carBtn];
        [self relBtn:carBtn];
    }
    if(dropDown2 != nil) {
        [dropDown2 hideDropDown:sirBtn];
        [self relBtn:sirBtn ];
    }
    if(dropDown4 != nil) {
        [dropDown3 hideDropDown:dateBtn];
        [self relBtn:dateBtn];
    }
}

- (void)dateBtnPressed:(UIButton *)sender {
    NSArray * arr = [[NSArray alloc] initWithObjects:@"3天以内", @"一周以内", @"两周以内", nil];
    if(dropDown4 == nil) {
        dateBtn.selected =YES;
        CGFloat f = 120;
        dropDown4 = [[NIDropDown alloc]showDropDown:sender :20*[arr count] :arr];
        dropDown4.delegate = self;
    }
    else {
        [dropDown4 hideDropDown:sender];
        [self relBtn:sender];
    }
    
    if(dropDown2 != nil) {
        [dropDown hideDropDown:sirBtn];
        [self relBtn:sirBtn];
    }
    if(dropDown3 != nil) {
        [dropDown3 hideDropDown:yearBtn];
        [self relBtn:yearBtn];
    }
    if(dropDown4 != nil) {
        [dropDown3 hideDropDown:dateBtn];
        [self relBtn:dateBtn];
    }
}

#pragma mark - NIDrop Button Delegate
- (void) niDropDownDelegateMethod: (NIDropDown *) sender :(NSString *)text :(int)indexPath{
    
    if([sender isEqual:dropDown]) {
        [carBtn setTitle:text forState:UIControlStateNormal];
        [self rel:sender];
    }else if([sender isEqual:dropDown2]) {
        [sirBtn setTitle:text forState:UIControlStateNormal];
        [self rel:sender];
    }else if([sender isEqual:dropDown3]) {
        [yearBtn setTitle:text forState:UIControlStateNormal];
        [self rel:sender];
    }else if([sender isEqual:dropDown4]) {
        [dateBtn setTitle:text forState:UIControlStateNormal];
        [self rel:sender];
    }
}

-(void)rel :(NIDropDown *)sender{
    if([sender isEqual:dropDown]) {
        carBtn.selected =NO;
        dropDown = nil;
    }else if([sender isEqual:dropDown2]) {
        sirBtn.selected =NO;
        dropDown2 = nil;
    }else if([sender isEqual:dropDown3]) {
        yearBtn.selected =NO;
        dropDown3 = nil;
    }else if([sender isEqual:dropDown3]) {
        dateBtn.selected =NO;
        dropDown4 = nil;
    }
    
}

-(void)relBtn :(id)sender{
    if([sender isEqual:carBtn]) {
        carBtn.selected =NO;
        dropDown = nil;
    }else if([sender isEqual:sirBtn]) {
        sirBtn.selected =NO;
        dropDown2 = nil;
    }else if([sender isEqual:yearBtn]) {
        yearBtn.selected =NO;
        dropDown3 = nil;
    }else if([sender isEqual:dateBtn]) {
        dateBtn.selected =NO;
        dropDown4 = nil;
    }
    
}
@end
