//
//  DWSNotificationCell.m
//  Week2
//
//  Created by Daniel Warner Smith on 2/19/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSNotificationCell.h"

@interface DWSNotificationCell ()

@end

@implementation DWSNotificationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 15)];
        [self.contentView addSubview:self.userNameLabel];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 200, 15)];
        [self.contentView addSubview:self.dateLabel];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 200, 15)];
        [self.contentView addSubview:self.messageLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
