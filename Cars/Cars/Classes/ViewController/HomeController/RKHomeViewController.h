//
//  RKHomeViewController.h
//  Cars
//
//  Created by Asee on 9/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

typedef enum{
    newsType =1,
    companyType,
    driveType,
    shopType,
    peopleType
}homeType;

#import "EvanViewController.h"
#import "RKModels.h"
#import "SMRotaryWheel.h"
 
@interface RKHomeViewController : EvanViewController<SMRotaryProtocol> {
    UIButton *newsBtn;
    UIButton *companyBtn;
    UIButton *driveBtn;
    UIButton *shopBtn;
    UIButton *peopleBtn;
    UIImageView *infoImageView;
    UILabel *infoLbl;
}


@property (retain, nonatomic) IBOutlet UIButton *newsBtn;
@property (retain, nonatomic) IBOutlet UIButton *companyBtn;
@property (retain, nonatomic) IBOutlet UIButton *driveBtn;
@property (retain, nonatomic) IBOutlet UIButton *shopBtn;
@property (retain, nonatomic) IBOutlet UIButton *peopleBtn;
@property (retain, nonatomic) IBOutlet UIImageView *infoImageView;
@property (retain, nonatomic) IBOutlet UILabel *infoLbl;

@end
