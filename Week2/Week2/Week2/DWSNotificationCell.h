//
//  DWSNotificationCell.h
//  Week2
//
//  Created by Daniel Warner Smith on 2/19/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWSNotificationCell : UITableViewCell

@property (nonatomic, strong) UIImage *userImage;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIImage *notifBadgeImage;
@property (nonatomic, strong) UILabel *dateLabel;

@end
