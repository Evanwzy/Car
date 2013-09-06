//
//  RKNewsDetailViewController.h
//  Cars
//
//  Created by Evan on 13-8-13.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "EvanViewController.h"

@interface RKNewsDetailViewController : EvanViewController

@property (retain, nonatomic) NSArray *newsArr;
@property (retain, nonatomic) NSArray *strArr;
@property (retain, nonatomic)NSArray *imgArray;
@property int index;

@property (retain, nonatomic) IBOutlet UIScrollView *newsSV;
@property (retain, nonatomic) IBOutlet UILabel *newsTitle;
@property (retain, nonatomic)IBOutlet UITextView *detailText;




@end
