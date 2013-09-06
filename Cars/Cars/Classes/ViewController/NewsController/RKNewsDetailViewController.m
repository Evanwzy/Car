//
//  RKNewsDetailViewController.m
//  Cars
//
//  Created by Evan on 13-8-13.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RKNewsDetailViewController.h"

@interface RKNewsDetailViewController ()

@end

@implementation RKNewsDetailViewController

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
    
    NSArray *newsArray =[NSArray arrayWithObjects:
                   @"据悉，现代全新一代劳恩斯目前内部代号为RK，新车在外观方面或将借鉴之前发布的HCD-14概念车的设计元素，整车前脸造型将更加前卫，此外轿跑风格的尾部设计是新车的另一大亮点。\n动力方面，据最新消息，现代全新一代劳恩斯或将搭载的是2.0升涡轮增压发动机和3.3升V6自然吸气发动机。传动方面，与之匹配的是或是一台8速手自一体变速箱。",
                   @"在即将开幕的圆石滩车展Pebble Beach上，众多古董车即将争相斗艳。而其中一对Ferrari将会在Pebble Beach Concours d'Elegance进行拍卖。\n根据外媒介绍，这两台法拉利古董车可谓是故事多多。第一台Ferrari是1967年的275 GTB/4 NART Spider，这款车在当时只限量生产了十辆，而这就是其中之一。\n而另外一辆准备拍卖的Ferrari则是一辆黄色的1965年275 GTB Coupe，不过这辆双门跑车已经被改装成了一辆NART Spider，这种将275 GTB Coupe原本的车顶给削去，打造成NART Spider的复制车大约有一百多台，原因当然是275 GTB/4 NART Spider实在是太稀有了。\n而这也是有史以来第一次，一辆真正的275 GTB/4 NART Spider在拍卖会中对上自己的复制车，这次拍卖会的结果也会让我们明白究竟在汽车收藏家的眼中，这两辆都算是经典的车款在价值上有着什么样的差别",
                   @"鉴于中东富豪们的特殊癖好，著名超跑改装品牌DMC为这些特殊的客户推出了法拉利F12 SPIA，金碧辉煌的涂装满足了中东富豪们的特别口味。\n当然，浮夸的金色涂装并不是重点，DMC为法拉利F12 BERLINETTA特别设计了碳纤维宽体套件，此外，符合空气动力学设计的前唇、引擎盖、车顶扰流、更宽的侧裙、类似于599XX的后扩散器都为这部F12增色不少，从车头贯穿至车尾的黑色线条在视觉上给人以更加动感的姿态。除了外观上的变化，为了让V12引擎奏响的旋律更加悦耳动听，DMC换装了钛合金运动排气，同时重新调校了ECU，使引擎功率提升至766马力，最高时速达到了354公里/小时。",
                   @"法拉利即将发布全新一代旗舰车型法拉利F150（曾称F70），既然是性能价格双料旗舰，这款车自然不会在任何数据上输给对手。近日，外媒通过多种途径获得了这款车最新的性能数据。\nV12引擎+高性能电动机=597kW最大功率、1100kg体重、至少80万英镑以上售价，这就是跃马带来的新一代旗舰车型——F150。外媒估计，最早在明年春天，这款红色闪电就会来到我们面前。\n说起性能，F150将搭载F12 Berlinetta 6.3L V12引擎的升级版，另有一台小型电动机和锂离子电池组辅助提供动力支持，一起组成这台混动超跑的动力源。虽然眼下详细参数尚不明朗，但外媒预测这款升级版V12汽油引擎可能拥有将近560kW的最大功率输出；而电动机还将额外提供约75kW功率以及279Nm的高扭矩。\nF150采用了当今公路量产车中最为先进的底盘架构，四种类型碳纤维复合材料的运用在确保满足整车性能所需强度的同时兼顾了碰撞安全要求。设计者们会根据底盘不同部分受力大小的具体情况来为其匹配不同形式的碳纤维材质——具体来说，F150的抗扭强度相比Enzo提升了27个百分点。",
                   @"幻影系列II的设计尤其引人注目的是其全新的前脸设计，包括保险杠和矩形车灯的新设计也许已隐约折射出深层次的更新。劳斯莱斯汽车首次将全LED大灯引进汽车的标准配置。\n随动转向系统使大灯光束可根据汽车的行驶方向来分配照明区域，转弯时为前方路面提供更佳光照。自适应大灯可根据不同的行驶速度，自如调整投射到路面的光照幅度。\n幻影系列II推出了新型驾驶辅助功能和极具现代风格的用户界面，多媒体控制系统也经过重新设计。新卫星导航系统功能全面升级，其中包括可显示地势的3D 舆图与导游功能，同时也进一步强化了爱好点搜索与复合路线规划的功能。幻影拥有更大的8.8英寸中心控制显示屏可播放视频直播、音频内容以及卫星导航舆图和驾驶员信息。通过8个可编辑的书签，驾驶员只需指尖轻触即可访问各个主要功能。车前、车后及俯视视角的摄像头相结合，进一步加强了幻影的轻松驾驭性。例如倒车时，倒车路径猜测的地面图像会自动展示于屏幕上。\n新增加的8速自动变速箱和后差速器进一步提升了劳斯莱斯汽车原有的卓越动力，与V12直喷发动机成为完美互补。混合路况下油耗可降低10%，二氧化碳排放量也从388克/公里下降到347克/公里。",
                   nil];
    
    self.newsArr =newsArray;
    
    self.strArr =[NSArray arrayWithObjects:
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
    
    self.imgArray =imageArr;
    
    
    self.index =[[[NSUserDefaults standardUserDefaults] objectForKey:@"index"] intValue];
    
    NSArray *ia =[self.imgArray objectAtIndex:self.index];
    //setTitle
    self.newsTitle.text =[self.strArr objectAtIndex:self.index];
    
    //setImage
    UIImageView *image1 =[[UIImageView alloc]initWithFrame:CGRectMake(10.0f, 60.0f, 300.0f, 150.0f)];
    UIImageView *image2 =[[UIImageView alloc]initWithFrame:CGRectMake(10.0f, 250.0f, 300.0f, 150.0f)];
    [image1 setImage:[ia objectAtIndex:0]];
    [image2 setImage:[ia objectAtIndex:1]];
    
    //setTextField
    UITextView *tempText =[[UITextView alloc]init];
    
    tempText.text=[self.newsArr objectAtIndex:self.index];
    
    self.detailText.text =tempText.text;
    
    CGSize constraintSize;
    constraintSize.width = 300;
    constraintSize.height = MAXFLOAT;
    CGSize sizeFrame =[self.detailText.text sizeWithFont:self.detailText.font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    self.detailText.frame = CGRectMake(10,420,sizeFrame.width,sizeFrame.height*3/2);
    
    [self.newsSV addSubview:image1];
    [self.newsSV addSubview:image2];
    [self.newsSV addSubview:self.detailText];
    
    [image1 release];
    [image2 release];
    
    [self.newsSV setContentSize:CGSizeMake(320.0f, 420.0f+sizeFrame.height*3/2)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDetailText:nil];
    [self setNewsSV:nil];
    [self setNewsTitle:nil];
    [super viewDidUnload];
}
@end
