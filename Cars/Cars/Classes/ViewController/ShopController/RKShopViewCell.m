//
//  RKShopViewCell.m
//  Cars
//
//  Created by Asee on 9/9/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RKShopViewCell.h"

@implementation RKShopViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_imageV release];
    [super dealloc];
}
@end
