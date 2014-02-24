//
//  StoryViewController.m
//  Week2
//
//  Created by Daniel Warner Smith on 2/19/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "StoryViewController.h"
#import "UIView+FitToSubViews.h"


@interface StoryViewController ()
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *actorLabel;
@property (nonatomic, strong) UILabel *timestamp;
@property (nonatomic, strong) UILabel *status;
@property (nonatomic, strong) UIImageView *photo;
@property (nonatomic, strong) UIView *card;
@property (nonatomic, strong) UIScrollView *storyArea;
@property (nonatomic, strong) UIView *ufi;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UILabel *likeCount;
@property (nonatomic, strong) UIView *topRule;
@property (nonatomic, strong) UIView *bottomRule;

@end

@implementation StoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
    }
    return self;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    //Set nav bar button items
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onMessagePress:)];
    
   
    
    //self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:self action:@selector(onMessagePress:)];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.navigationItem.titleView = titleLabel;
    titleLabel.text = @"Story";
    [titleLabel sizeToFit];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    
    self.storyArea = [[UIScrollView alloc] initWithFrame:self.view.bounds];
 
    [self.view addSubview:self.storyArea];

    self.card = [[UIView alloc] initWithFrame:CGRectZero];
    self.card.layer.shadowRadius = 1;
    self.card.layer.shadowOpacity = 0.2;
    self.card.layer.shadowOffset = CGSizeMake(0, 1);
    self.card.clipsToBounds = NO;
    self.card.layer.cornerRadius = 2;

    [self.storyArea addSubview:self.card];
    self.storyArea.clipsToBounds = NO;

    
    self.userImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.userImage.image = self.storyInfo.userImage;
    [self.card addSubview:self.userImage];
    
    self.actorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.actorLabel.text = self.storyInfo.actor;
    [self.actorLabel setFont:[UIFont fontWithName:@"HelveticaNeue-bold" size:14]];
    [self.card addSubview:self.actorLabel];
    
    self.timestamp = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.timestamp setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
    [self.timestamp setTextColor:[UIColor colorWithRed:(0.702) green:(0.722) blue:(0.753) alpha:(1)]];
    self.timestamp.text = self.storyInfo.timeStamp;
    [self.card addSubview:self.timestamp];
    
    self.status = [[UILabel alloc] initWithFrame:CGRectZero];
    self.status.numberOfLines = 0;
    [self.status setFont:[UIFont fontWithName:@"HelveticaNeue" size:14]];
    self.status.text = self.storyInfo.status;
    [self.card addSubview:self.status];
    
    self.photo = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.photo.image = self.storyInfo.photo;
    self.photo.layer.shadowColor = [UIColor blackColor].CGColor;
    self.photo.layer.shadowRadius = 3;
    self.photo.layer.shadowOpacity = 0.8;
    self.photo.layer.shadowOffset = CGSizeMake(0, 2);
    self.photo.contentMode = UIViewContentModeScaleAspectFit;
    [self.storyArea addSubview:self.photo];
    
    self.ufi = [[UIView alloc] initWithFrame:CGRectZero];
    [self.card addSubview:self.ufi];
    
    self.topRule = [[UIView alloc] initWithFrame:CGRectZero];
    [self.ufi addSubview:self.topRule];
    self.bottomRule = [[UIView alloc] initWithFrame:CGRectZero];
    [self.ufi addSubview:self.bottomRule];
    
    UIButton *like = [[UIButton alloc] initWithFrame:CGRectZero];
    [like setTitle:@"Like" forState:UIControlStateNormal];
    [like setTitleColor:[UIColor colorWithRed:(0.608) green:(0.62) blue:(0.639) alpha:(1)] forState:UIControlStateNormal];
    [like setTitleColor:[UIColor colorWithRed:(0.345) green:(0.565) blue:(1) alpha:(1)] forState:UIControlStateSelected];
    [like.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-bold" size:12]];
    [like setImage:[UIImage imageNamed:@"like_null"] forState:UIControlStateNormal];
    [like setImage:[UIImage imageNamed:@"like_active"] forState:UIControlStateSelected];
    self.likeButton = like;
    [self.ufi addSubview:self.likeButton];
    [self.likeButton addTarget:self action:@selector(likeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *comment = [[UIButton alloc] initWithFrame:CGRectZero];
    [comment setTitle:@"Comment" forState:UIControlStateNormal];
    [comment setTitleColor:[UIColor colorWithRed:(0.608) green:(0.62) blue:(0.639) alpha:(1)] forState:UIControlStateNormal];
    [comment setTitleColor:[UIColor colorWithRed:(0.345) green:(0.565) blue:(1) alpha:(1)] forState:UIControlStateSelected];
    [comment.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-bold" size:12]];
    [comment setImage:[UIImage imageNamed:@"comment_null"] forState:UIControlStateNormal];
    [comment setImage:[UIImage imageNamed:@"comment_active"] forState:UIControlStateSelected];
    self.commentButton = comment;
    [self.ufi addSubview:self.commentButton];
    
    UIButton *share = [[UIButton alloc] initWithFrame:CGRectZero];
    [share setTitle:@"Share" forState:UIControlStateNormal];
    [share setTitleColor:[UIColor colorWithRed:(0.608) green:(0.62) blue:(0.639) alpha:(1)] forState:UIControlStateNormal];
    [comment setTitleColor:[UIColor colorWithRed:(0.345) green:(0.565) blue:(1) alpha:(1)] forState:UIControlStateSelected];
    [share.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-bold" size:12]];
    [share setImage:[UIImage imageNamed:@"comment_null"] forState:UIControlStateNormal];
    [share setImage:[UIImage imageNamed:@"comment_active"] forState:UIControlStateSelected];
    self.shareButton = share;
    [self.ufi addSubview:self.shareButton];
    
    self.likeCount = [[UILabel alloc] initWithFrame:CGRectZero];
    self.likeCount.text = @"100 people like this";
    [self.likeCount setFont:[UIFont fontWithName:@"HelveticaNeue" size:14]];
    [self.card addSubview:self.likeCount];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
   // _storyArea.frame = CGRectMake(0, 100, self.view.bounds, self.view.bounds);
    _card.frame = CGRectMake(10, 10, 300, 412);
    _card.backgroundColor = [UIColor whiteColor];
    
    _userImage.frame = CGRectMake(10, 10, 34, 34);
    _userImage.backgroundColor = [UIColor blackColor];
    
    [_actorLabel sizeToFit];
    _actorLabel.frame = CGRectMake(CGRectGetMaxX(_userImage.frame) + 8, 10, 230, _actorLabel.frame.size.height);
    //_actorLabel.backgroundColor = [UIColor greenColor];

    [_timestamp sizeToFit];
    _timestamp.frame = CGRectMake(_actorLabel.frame.origin.x, 30, _timestamp.frame.size.width, _timestamp.frame.size.height);
    
    CGSize statusConstraint = CGSizeMake(280, CGFLOAT_MAX);
    CGSize statusSize = [_status sizeThatFits:statusConstraint];
    _status.frame = CGRectMake(CGRectGetMinX(_userImage.frame), 60, statusSize.width, statusSize.height);
    //_status.backgroundColor = [UIColor redColor];

    [_photo sizeToFit];
    _photo.frame = CGRectMake((self.storyArea.bounds.size.width - 312)/2, CGRectGetMaxY(_status.frame) + 20, 312, 209);
    
    _ufi.frame = CGRectMake(0, CGRectGetMaxY(_photo.frame) + 6, _card.frame.size.width, 41);
    _ufi.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    
    _bottomRule.frame = CGRectMake(0, 40, _card.frame.size.width, 1);
    _bottomRule.backgroundColor = [UIColor colorWithRed:0.941 green:0.941 blue:0.941 alpha:1];
    _topRule.frame = CGRectMake(0, 0, _card.frame.size.width, 1);
    _topRule.backgroundColor = [UIColor colorWithRed:0.941 green:0.941 blue:0.941 alpha:1];

    [_likeButton sizeToFit];
    _likeButton.frame = CGRectMake(12, 11, _likeButton.frame.size.width + 20, _likeButton.frame.size.height);
    [_likeButton setTitleEdgeInsets:UIEdgeInsetsMake(3, 8, 0, 0)];
    

    [_commentButton sizeToFit];
    _commentButton.frame = CGRectMake(CGRectGetMaxX(_likeButton.frame) + 24, _likeButton.frame.origin.y, _commentButton.frame.size.width + 20, _commentButton.frame.size.height);
    [_commentButton setTitleEdgeInsets:UIEdgeInsetsMake(3, 8, 0, 0)];
    
    [_shareButton sizeToFit];
    _shareButton.frame = CGRectMake(CGRectGetMaxX(_commentButton.frame) + 24, _likeButton.frame.origin.y, _shareButton.frame.size.width + 20, _shareButton.frame.size.height);
    [_shareButton setTitleEdgeInsets:UIEdgeInsetsMake(3, 8, 0, 0)];
    
    CGSize contentSize = CGSizeMake(_storyArea.bounds.size.width, CGRectGetMaxY(_card.frame)+ 200);
    _storyArea.contentSize = contentSize;
    
    [_likeCount sizeToFit];
    _likeCount.frame = CGRectMake(CGRectGetMinX(_userImage.frame), CGRectGetMaxY(_ufi.frame) + 12, _likeCount.frame.size.width, _likeCount.frame.size.height);

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onMessagePress:(id)sender {
    
}

- (void)onTap: (id)sender {
}

- (void)likeButtonPressed:(UIButton *)sender {
    if (self.likeButton.selected == NO) {
        self.likeButton.selected = YES;
    }
    else self.likeButton.selected = NO;
}

@end
