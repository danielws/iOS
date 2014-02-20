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

//Init the cell elements
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.userNameLabel];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.dateLabel];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.messageLabel];
    }
    return self;
}

//Layout all the cell subviews
- (void)layoutSubviews {
    [_userNameLabel sizeToFit];
    [_userNameLabel setBackgroundColor:[UIColor greenColor]];
    //[_userNameLabel.font ];
    [_userNameLabel setFrame:CGRectMake(50, 0, _userNameLabel.bounds.size.width, _userNameLabel.bounds.size.height)];
    
    [_messageLabel sizeToFit];
    [_messageLabel setFrame:CGRectMake(50, 30, _messageLabel.bounds.size.width, _messageLabel.bounds.size.height)];
    
    [_dateLabel sizeToFit];
    [_dateLabel setFrame:CGRectMake(50, 50, _dateLabel.bounds.size.width, _dateLabel.bounds.size.height)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
