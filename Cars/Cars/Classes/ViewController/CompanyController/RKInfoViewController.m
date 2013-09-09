//
//  RKInfoViewController.m
//  Cars
//
//  Created by Evan on 13-8-14.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RKInfoViewController.h"

@interface RKInfoViewController ()

@end

@implementation RKInfoViewController
@synthesize sv;

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
    
    titleLbl.text =@"公司简介";
    // Do any additional setup after loading the view from its nib.
    [self.view sendSubviewToBack:bgImageView];
    UIImageView *logo =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png"]];
    [logo setFrame:CGRectMake(102.5f, 20.0f, 115.0f, 115.0f)];
    
    UITextView *text =[[UITextView alloc]init];
    text.text =@"车神集团，中国汽车综合服务运营商，行业第一品牌。集团金融总部设在中国高速发展的经济特区深圳，办公在全球第八高度京基100大厦28楼，毗邻12家世界500强企业。车神规划下设俱乐部、租车平台、维修中心、名车广场等全国连锁子公司。业务模块涵盖汽车前端、中端、后端市场以及相关服务。尊崇备至的车神VIP服务为客户带来超乎想象的用车体验。车神秉承“实干、聚焦、革新、共赢”的品牌理念，成为让员工、客户和社会各界尊敬的行业品牌，共同促进中国汽车行业的发展和进步。\n\n企业文化：理念：实干、聚焦、革新、共赢\n\n使命：让客户花最少的钱，开最好的车\n\n愿景：以豪车打造最高端的资源人脉平台\n神圣使命：用智慧为社会盘活两万亿的闲置资产\n\n目标：持续成为全中国最大的汽车综合服务运营商\n\n价值观：跨界思维、胸怀天下，海纳川穹、心容皓渺\n\n地址：深圳市罗湖区蔡屋围京基100大厦2803\n\n固定电话：22201000\n\n传真：\n\n企业QQ号码：4008004008";
    text.font =[UIFont systemFontOfSize:16.0f];
    CGSize constraintSize;
    constraintSize.width = 300;
    constraintSize.height = MAXFLOAT;
    CGSize sizeFrame =[text.text sizeWithFont:text.font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    text.backgroundColor =[UIColor clearColor];
    text.textColor =[UIColor lightGrayColor];
    [text setEditable:NO];
    text.frame = CGRectMake(15,140,sizeFrame.width,sizeFrame.height+50);
    
    [sv setContentSize:CGSizeMake(300.0f, 140 + sizeFrame.height+50)];
    
    [sv addSubview:text];
    [sv addSubview:logo];
    [text release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    [sv release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setSv:nil];
    [super viewDidUnload];
}
@end
