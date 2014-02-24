//
//  Movie.h
//  Tomatoes
//
//  Created by Daniel Warner Smith on 2/20/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) int runtimeMinutes;
@property (nonatomic, strong) NSDate *releaseDate;
@property (nonatomic, strong) NSString *actors;
@property (nonatomic, strong) NSString *posterUrl;

@end
