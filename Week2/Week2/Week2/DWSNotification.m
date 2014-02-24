//
//  DWSNotification.m
//  Week2
//
//  Created by Daniel Warner Smith on 2/21/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSNotification.h"



@implementation DWSNotification


// This method creates a new notif object with values from a dictionary
- (id)initWithDictionary:(NSDictionary *)dictionary {
    // creates a new DWSNotification object
    self = [super init];
    //condition checks to make sure self isn't nil
    if (self) {
        //Set object properties from values in the dictionary
        self.actor = dictionary[@"name"];
        self.notifMessage = dictionary[@"message"];
        self.timeStamp = dictionary[@"time"];
        self.userImage = dictionary[@"userImage"];
        self.notifBadge = dictionary[@"badgeImage"];
        self.status = dictionary[@"status"];
        self.photo = dictionary[@"photo"];
    }
    // Return the notification object
    return self;
}


#pragma mark - Class methods

// Create an array of all the notifications
// Class method. Independent of different instances of this class
+ (NSArray *)notifsWithArray:(NSArray *)array {
    //Create a pointer and initialize the array
    NSMutableArray *notifs = [[NSMutableArray alloc] init];
    
    // start a for loop to turn initialize notification objects and add them to the array of notifs for every dictionary in the array
    for (NSDictionary *dictionary in array) {
        // Create a pointer and initialize a notification object with the values from the current dictionary in the array by calling
        // initWithDictionary on init
        DWSNotification *notif = [[DWSNotification alloc] initWithDictionary:dictionary];
        // add the notification object into the notifs array
        [notifs addObject:notif];
    }
    
    // Return the notifs array when the loop is done
    return notifs;
}


//This method needs to be called to get started
+ (NSArray *)fakeNotifs {
    NSArray *dictionary =
    @[
      @{ @"name" : @"Jet Brody",
         @"message" : @"Yo dawg you got a comment on your stuff and it's really really cool stuff .",
         @"status" : @"Hey buddy just checkin in to see what's up. Hope it's all good. Peace dawg.",
         @"time" : @"12:00pm",
         @"userImage" : [UIImage imageNamed:@"collin"],
         @"badgeImage" : [UIImage imageNamed:@"icon-comment-16px"],
         @"photo" : [UIImage imageNamed:@"SLJ.jpg"]},
      @{ @"name" : @"Tim Thousand",
         @"status" : @"Apps are the future! says some guy at Apple.",
         @"message" : @"posted in iOs for Designers",
         @"time" : @"1:00pm",
         @"userImage" : [UIImage imageNamed:@"hunter.jpg"],
         @"badgeImage" : [UIImage imageNamed:@"icon-group-apple-16px"],
         @"photo" : [UIImage imageNamed:@"apps.png"]},
      @{ @"name" : @"Robyn Morris",
         @"status" : @"Apple releases giant squirrel.",
         @"message" : @"likes your post",
         @"time" : @"12:20pm",
         @"userImage" : [UIImage imageNamed:@"robyn.jpg"],
         @"badgeImage" : [UIImage imageNamed:@"icon-like-16px"],
         @"photo" : [UIImage imageNamed:@"apps2.png"]},
      @{ @"name" : @"Kate Stern",
         @"status" : @"Some sort of status.",
         @"message" : @"sent you a message",
         @"time" : @"10:00am",
         @"userImage" : [UIImage imageNamed:@"kate.jpg"],
         @"badgeImage" : [UIImage imageNamed:@"icon-messenger-16px"],
         @"photo" : [UIImage imageNamed:@"apps.png"]},
      @{ @"name" : @"Austin Bales",
         @"status" : @"This is a status.",
         @"message" : @"posted in Product Design",
         @"time" : @"9:32am",
         @"userImage" : [UIImage imageNamed:@"austin.jpg"],
         @"badgeImage" : [UIImage imageNamed:@"icon-group-horns-16px"],
         @"photo" : [UIImage imageNamed:@"apps.png"]},
      @{ @"name" : @"Russ Mashmeyer",
         @"status" : @"Put something here.",
         @"message" : @"likes your comment",
         @"time" : @"8:15am",
         @"userImage" : [UIImage imageNamed:@"russ.jpg"],
         @"badgeImage" : [UIImage imageNamed:@"icon-like-16px"],
         @"photo" : [UIImage imageNamed:@"apps.png"]}
      ];
    // Return the method notifsWithArray to kick off the process of creating an array of all the notifications in the dictionary
    return [DWSNotification notifsWithArray:dictionary];
}


- (NSAttributedString *)prettyString {
    NSDictionary *normalAttributes = @{
        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14]
    };
    NSDictionary *boldAttributes = @{
        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:14]
    };
    
    NSString *str = [NSString stringWithFormat:@"%@ %@", self.actor, self.notifMessage];
    NSMutableAttributedString *mAttrStr = [[NSMutableAttributedString alloc] initWithString:str attributes:normalAttributes];
    
    NSRange nameRange = NSMakeRange(0, self.actor.length);
    [mAttrStr addAttributes:boldAttributes range:nameRange];
    
    NSArray *keywords = @[@"comment", @"message"];
    for (NSString *keyword in keywords) {
        NSRange kwRange = [str rangeOfString:keyword];
        if (kwRange.location != NSNotFound) {
            [mAttrStr addAttributes:boldAttributes range:kwRange];
        }
    }
    
    return mAttrStr;
}

@end
