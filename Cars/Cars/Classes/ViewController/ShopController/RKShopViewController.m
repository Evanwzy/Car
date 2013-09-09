//
//  RKShopViewController.m
//  Cars
//
//  Created by Asee on 9/6/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKShopViewController.h"
#import "RKShopViewCell.h"
#import "RKShopDetailViewController.h"
#import "RKModels.h"

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
    _imgArray =[[NSArray alloc]init];
    titleLbl.text =@"车神优选";
    [self.view sendSubviewToBack:bgImageView];
    
    _tableView.backgroundColor =[UIColor clearColor];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    
    UIImage *img1 =[UIImage imageNamed:@"shoping_01.png"];
    UIImage *img2 =[UIImage imageNamed:@"shoping_02.png"];
    UIImage *img3 =[UIImage imageNamed:@"shoping_03.png"];
    
    
    NSArray *imageArr =[NSArray arrayWithObjects:img1, img2, img3, nil];
    
    self.imgArray =imageArr;
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

#pragma mark - tableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [[NSUserDefaults standardUserDefaults]setInteger:indexPath.row forKey:@"index"];
    RKShopDetailViewController *sdvCtr =[[RKShopDetailViewController alloc]initWithNibName:[RKModels fullNameOfNibWithFileName:@"RKShopDetailViewController"] bundle:nil];
    [self.navigationController pushViewController:sdvCtr animated:YES];
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 242.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    RKShopViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil) {
        
        NSArray *xib=[[NSBundle mainBundle] loadNibNamed:@"RKShopViewCell" owner:self options:nil];
        
        cell =(RKShopViewCell *)[xib objectAtIndex:0];
        
        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    cell.imageV.image =[self.imgArray objectAtIndex:indexPath.row];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.highlighted =NO;
    
    return cell;
}
@end
