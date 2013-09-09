//
//  RKShopViewController.h
//  Cars
//
//  Created by Asee on 9/6/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "EvanViewController.h"
#import "Common.h"

@interface RKShopViewController : EvanViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSArray *imgArray;
@end
