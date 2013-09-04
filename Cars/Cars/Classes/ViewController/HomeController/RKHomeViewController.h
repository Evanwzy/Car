//
//  RKHomeViewController.h
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "EvanViewController.h"
 
@interface RKHomeViewController : EvanViewController {
    UIButton *newsBtn;
    UIButton *companyBtn;
    UIButton *driveBtn;
    UIButton *shopBtn;
    UIButton *peopleBtn;
}


@property (retain, nonatomic) IBOutlet UIButton *newsBtn;
@property (retain, nonatomic) IBOutlet UIButton *companyBtn;
@property (retain, nonatomic) IBOutlet UIButton *driveBtn;
@property (retain, nonatomic) IBOutlet UIButton *shopBtn;
@property (retain, nonatomic) IBOutlet UIButton *peopleBtn;

@end
