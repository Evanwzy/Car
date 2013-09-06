//
//  RKNewsViewController.h
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "EvanViewController.h"
#import "RKModels.h"

@interface RKNewsViewController : EvanViewController <UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) NSArray *strArray;
@property (retain, nonatomic) NSArray *imgArray;

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@end
