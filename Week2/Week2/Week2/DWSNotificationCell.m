//
//  DWSNotificationCell.m
//  Week2
//
//  Created by Daniel Warner Smith on 2/19/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSNotificationCell.h"
#import "DWSNotification.h"
#import "UIView+FitToSubViews.h"

@interface DWSNotificationCell ()
@property UIView *textArea;
@end

@implementation DWSNotificationCell

//Init the cell elements
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 80, 296, 1)];
        
        lineView.backgroundColor = [UIColor colorWithRed:(0.949) green:(0.949) blue:(0.949) alpha:(1)];
        [self.contentView addSubview:lineView];
        
        self.textArea = [[UIView alloc]initWithFrame:CGRectZero];
        
        self.notificationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.textArea addSubview:self.notificationLabel];
        self.notificationLabel.numberOfLines = 3;
        self.notificationLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];

        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.textArea addSubview:self.dateLabel];
        self.dateLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        self.dateLabel.textColor = [UIColor colorWithRed:(0.702) green:(0.722) blue:(0.753) alpha:(1)];
        
        
        self.userImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.userImage];
        
        self.notifBadgeImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.textArea addSubview:self.notifBadgeImage];
        
        
        [self.contentView addSubview:self.textArea];
        
    }
    return self;
}

//Layout all the cell subviews
- (void)layoutSubviews {
    [super layoutSubviews];
    [_userImage setFrame:CGRectMake(12, 6, 68, 68)];

    [_notificationLabel sizeToFit];
    [_notificationLabel setFrame:CGRectMake(0, 0, 220, _notificationLabel.bounds.size.height)];
    
    [_dateLabel sizeToFit];
    [_dateLabel setFrame:CGRectMake(_notificationLabel.frame.origin.x +_notifBadgeImage.frame.size.width + 6,
                                    _notificationLabel.frame.size.height + 4,
                                    _notificationLabel.frame.size.width,
                                    _notifBadgeImage.bounds.size.height)];
    
    [_notifBadgeImage setFrame:CGRectMake(_notificationLabel.frame.origin.x, _notificationLabel.frame.size.height + 4, 16, 16)];
    
    [_textArea sizeToFitSubviews];
    CGRect containerFrame = CGRectMake(88,
                                       (self.contentView.frame.size.height - _textArea.frame.size.height) / 2 - 1,
                                       // self.contentView.frame.size.height / 2 - textArea.frame.size.height / 2
                                       _textArea.frame.size.width,
                                       _textArea.frame.size.height);
    [_textArea setFrame:containerFrame];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
