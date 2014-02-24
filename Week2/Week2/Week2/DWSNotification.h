//
//  DWSNotification.h
//  Week2
//
//  Created by Daniel Warner Smith on 2/21/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWSNotification : NSObject

@property (nonatomic, strong) UIImage *userImage;
@property (nonatomic, strong) NSString *actor;
@property (nonatomic, strong) NSString *notifMessage;
@property (nonatomic, strong) NSString *timeStamp;
@property (nonatomic, strong) UIImage *notifBadge;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) UIImage *photo;

+ (NSArray *)fakeNotifs;
- (NSAttributedString *)prettyString;

@end
