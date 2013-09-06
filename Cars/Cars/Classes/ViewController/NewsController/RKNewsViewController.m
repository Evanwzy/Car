//
//  RKNewsViewController.m
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKNewsViewController.h"
#import "RKNewsListCell.h"
#import "RKNewsDetailViewController.h"

@interface RKNewsViewController ()

@end

@implementation RKNewsViewController

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
    [self setupUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - settingUI
- (void)setupUI {
    backBtn.hidden =NO;
    
    _tableView.backgroundColor =[UIColor clearColor];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    
    NSArray *strArr =[NSArray arrayWithObjects:
                      @"或2016年投放 现代新一代劳恩斯新消息",
                      @"美轮美奂!法拉利古董车亮相原石滩",
                      @"金碧辉煌 DMC打造法拉利F12中东版",
                      @"法拉利全新旗舰超跑F150 总功率达600kW",
                      @"劳斯莱斯幻影系列II日内瓦车展首发",
                      nil];
    UIImage *img11 =[UIImage imageNamed:@"11.jpg"];
    UIImage *img12 =[UIImage imageNamed:@"12.jpg"];
    UIImage *img21 =[UIImage imageNamed:@"21.jpg"];
    UIImage *img22 =[UIImage imageNamed:@"22.jpg"];
    UIImage *img31 =[UIImage imageNamed:@"31.jpg"];
    UIImage *img32 =[UIImage imageNamed:@"32.jpg"];
    UIImage *img41 =[UIImage imageNamed:@"41.jpg"];
    UIImage *img42 =[UIImage imageNamed:@"42.jpg"];
    UIImage *img51 =[UIImage imageNamed:@"51.jpg"];
    UIImage *img52 =[UIImage imageNamed:@"52.jpg"];
    
    NSArray *arr1 =[NSArray arrayWithObjects:img11, img12, nil];
    NSArray *arr2 =[NSArray arrayWithObjects:img21, img22, nil];
    NSArray *arr3 =[NSArray arrayWithObjects:img31, img32, nil];
    NSArray *arr4 =[NSArray arrayWithObjects:img41, img42, nil];
    NSArray *arr5 =[NSArray arrayWithObjects:img51, img52, nil];
    
    NSArray *imageArr =[NSArray arrayWithObjects:arr1, arr2, arr3, arr4, arr5, nil];
    
    self.strArray =strArr;
    self.imgArray =imageArr;
    
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
    RKNewsDetailViewController *nvCtr =[[RKNewsDetailViewController alloc]initWithNibName:[RKModels fullNameOfNibWithFileName:@"RKNewsDetailViewController"] bundle:nil];
    [self.navigationController pushViewController:nvCtr animated:YES];
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    RKNewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil) {
        
        NSArray *xib=[[NSBundle mainBundle] loadNibNamed:@"RKNewsListCell" owner:self options:nil];
        
        cell =(RKNewsListCell *)[xib objectAtIndex:0];
        
        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    NSArray *tempArr =[self.imgArray objectAtIndex:indexPath.row];
    
    [cell.msgImgView setImage:[tempArr objectAtIndex:0]];
    cell.msgText.text =[self.strArray objectAtIndex:indexPath.row];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.highlighted =NO;
    
    return cell;
}
@end
