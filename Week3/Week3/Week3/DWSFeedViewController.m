//
//  DWSFeedViewController.m
//  Week3
//
//  Created by Daniel Warner Smith on 2/25/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSFeedViewController.h"

@interface DWSFeedViewController ()

@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) UIImageView *coverImage;
@property (nonatomic, strong) UIScrollView *feedScrollView;
@property (nonatomic, strong) UIImageView *feedImage;
@end

@implementation DWSFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}
 
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.coverView = [[UIView alloc] initWithFrame:CGRectZero];

    self.coverImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.coverImage addSubview:self.coverView];
    
    self.feedScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    [self.coverView addSubview:self.feedScrollView];
    
    [self.view addSubview:self.coverView];


}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _coverView.frame = CGRectMake(0, 0, 320, 400); 
    _coverView.backgroundColor = [UIColor greenColor];
    
    _coverImage.frame = CGRectMake(0, 0, 320, 320);
    _coverImage.backgroundColor = [UIColor redColor];
    
    _feedScrollView.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame) - 300, 320, 300);
    [_feedScrollView setContentSize:CGSizeMake(1000, 300)];
    _feedScrollView.backgroundColor = [UIColor redColor];
    _feedScrollView.showsHorizontalScrollIndicator = YES;
    _feedScrollView.bounces = YES;
    _feedScrollView.scrollEnabled = YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
