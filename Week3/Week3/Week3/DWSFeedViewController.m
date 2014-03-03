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
    self.coverImage.image = [UIImage imageNamed:@"cover"];
    self.coverImage.contentMode = UIViewContentModeScaleAspectFit;

    [self.coverView addSubview:self.coverImage];
    
    self.feedScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.feedImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll"]];
    [self.feedScrollView addSubview:self.feedImage];
    [self.coverView addSubview:self.feedScrollView];
    
    [self.view addSubview:self.coverView];


}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    _coverView.frame = self.view.frame;
    _coverView.backgroundColor = [UIColor greenColor];

    _coverImage.frame = _coverView.bounds;
    //_coverImage.backgroundColor = [UIColor redColor];
    
   // [_feedImage sizeToFit];
    _feedImage.frame = CGRectMake(0, 0, 931, _feedImage.frame.size.height);
    
    [_feedScrollView sizeToFit];
    _feedScrollView.frame = CGRectMake(0,
                                       CGRectGetMaxY(self.view.frame) - 280,
                                       self.view.frame.size.width,
                                       _feedImage.frame.size.height);
    [_feedScrollView setContentSize:CGSizeMake(_feedImage.frame.size.width - 30, _feedImage.frame.size.height)];
    [_feedScrollView setContentInset:UIEdgeInsetsMake(0, -30, 0, 0)];
   // _feedScrollView.backgroundColor = [UIColor redColor];
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
