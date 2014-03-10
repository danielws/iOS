//
//  DWSNewsstandViewController.m
//  Week 4
//
//  Created by Daniel Warner Smith on 3/6/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSNewsstandViewController.h"
#import "DWSParentViewController.h"

@interface DWSNewsstandViewController ()
@property (nonatomic, strong) UIImageView *feedView;
@property (nonatomic, strong) UIImageView *facebookFeedView;
@property (nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) UIImageView *dropZoneView;
@property (nonatomic, strong) UIButton *doneButton;

@property (nonatomic, strong) NSDictionary *viewsDictionary;
@property (nonatomic, strong) NSArray *constraintsArray;

@property (nonatomic, assign) CGRect initialFrame;
@property (nonatomic, assign) CGRect inFrame;
@property (nonatomic, assign) CGRect outFrame;

@property (nonatomic, assign) int threshold;
@property (nonatomic, assign) int padding;

@property (nonatomic, strong) NSLayoutConstraint *xConstraint;
@property (nonatomic, strong) NSLayoutConstraint *yConstraint;
@property (nonatomic, strong) NSLayoutConstraint *cardHeight;
@property (nonatomic, strong) NSLayoutConstraint *cardWidth;

- (void)wiggleIt:(UIView *)wiggleView : (BOOL)enableWiggle;
- (void)onPan:(UIPanGestureRecognizer *)panGestureRecognizer;
- (void)onTap:(UITapGestureRecognizer *)tapGestureRecognizer;
@end

@implementation DWSNewsstandViewController

- (id)init
{
    self = [super init];
    if (self) {
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Inits
    self.feedView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.feedView.userInteractionEnabled = YES;
    self.facebookFeedView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.facebookFeedView.userInteractionEnabled = YES;
    self.backgroundView = [[UIImageView alloc] init];
    self.dropZoneView = [[UIImageView alloc] init];
    self.dropZoneView.alpha = 0;
    
    self.doneButton = [[UIButton alloc]initWithFrame:CGRectZero];
    [self.doneButton addTarget:self.parentViewController
                        action:@selector(onDoneButtonTap:)
              forControlEvents:UIControlEventTouchUpInside];

    
    // Set padding
    self.padding = -100;
    
//    // Views dictionary
//    self.viewsDictionary = [[NSDictionary alloc] init];
//    self.viewsDictionary = NSDictionaryOfVariableBindings(_feedView, _facebookFeedView);
//    self.constraintsArray = [[NSArray alloc] init];
//    self.constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"[_feedView]--100-[_facebookFeedView]"
//                                                                    options:0
//                                                                    metrics:nil
//                                                                      views:self.viewsDictionary];
    // Set threshold
    self.threshold = 350;
    

    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                                          action:@selector(onPan:)];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                          action:@selector(onTap:)];
    tapGestureRecognizer.numberOfTapsRequired = 2;
    
    // Layout constraints
    self.facebookFeedView.translatesAutoresizingMaskIntoConstraints = NO;
//    self.feedView.translatesAutoresizingMaskIntoConstraints = NO;


	self.view.backgroundColor = [UIColor blackColor];
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:self.facebookFeedView
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeLeft
                                                                  multiplier:1
                                                                    constant:10];
    
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:self.facebookFeedView
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1
                                                                    constant:80];

    
    NSLayoutConstraint *cardWidth = [NSLayoutConstraint constraintWithItem:self.facebookFeedView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:0
                                                                  multiplier:1
                                                                    constant:131];
    
    NSLayoutConstraint *cardHeight = [NSLayoutConstraint constraintWithItem:self.facebookFeedView
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:0
                                                                multiplier:1
                                                                  constant:231];
    
    // Assignments
    self.xConstraint = xConstraint;
    self.cardHeight = cardHeight;
    self.cardWidth = cardWidth;
    
    // Adds
    [self.feedView addGestureRecognizer:panGestureRecognizer];
    [self.feedView addGestureRecognizer:tapGestureRecognizer];
    
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.dropZoneView];
    [self.view addSubview:self.facebookFeedView];
    [self.view addSubview:self.feedView];
    [self.view addSubview:self.doneButton];

    [self.view addConstraints:@[xConstraint, yConstraint, cardWidth, cardHeight]];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self wiggleIt:_facebookFeedView :YES];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _outFrame = CGRectMake(100, 330, 131, 231);
    _inFrame = CGRectMake(100, 80, 131, 231);
    
    _feedView.frame = _outFrame;
    _feedView.image = [UIImage imageNamed:@"headlines_card"];
    _feedView.backgroundColor = [UIColor redColor];
    
    _facebookFeedView.image = [UIImage imageNamed:@"facebook_card"];
    _facebookFeedView.backgroundColor = [UIColor blueColor];
    
    _backgroundView.frame = self.view.frame;
    _backgroundView.backgroundColor = [UIColor greenColor];

    _backgroundView.image = [UIImage imageNamed:@"edit_sections_bg"];
    _backgroundView.contentMode = UIViewContentModeScaleAspectFit;
    
    _dropZoneView.image = [UIImage imageNamed:@"drop_box"];
    _dropZoneView.frame = self.inFrame;
    
    _doneButton.frame = CGRectMake(230, 5, 80, 44);
    _doneButton.backgroundColor = [UIColor clearColor];
    
}


- (void)wiggleIt:(UIView *)wiggleView :(BOOL)enableWiggle {
    BOOL wiggleSwitch = enableWiggle;
    if (wiggleSwitch == NO) {
        UIView *rotateView = wiggleView;
        [UIView animateWithDuration:.75
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction animations:^{
                                rotateView.transform = CGAffineTransformMakeRotation(0);
                            } completion:nil];

    }
    else {
        UIView *rotateView = wiggleView;
        int rotation = 120;
        [UIView animateWithDuration:.75
                              delay:0
                            options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction animations:^{
                                rotateView.transform = CGAffineTransformMakeRotation(M_PI / rotation);
                                rotateView.transform = CGAffineTransformMakeRotation(M_PI / rotation * -1);
                            } completion:nil];
    }
    
 
}

- (void)onPan:(UIPanGestureRecognizer *)panGestureRecognizer {
    // Grab in the initial start point of the frame on frame start
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        _initialFrame = self.feedView.frame;
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:12 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            _initialFrame.size.height = _initialFrame.size.height * 1.2;
            _initialFrame.size.width = _initialFrame.size.width * 1.2;
        } completion:nil];

        
    }
    // Set the new frame to the _initialFrame. Then add the translation. Then set view's frame.
    else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {

        
        CGRect newFrame = _initialFrame;
        
        newFrame.origin.y += [panGestureRecognizer translationInView:self.view].y;
        newFrame.origin.x += [panGestureRecognizer translationInView:self.view].x;

        [_feedView setFrame:newFrame];
        if (_feedView.frame.origin.y < self.threshold) {
            [self.view layoutIfNeeded];
            [UIView animateWithDuration:.25 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                self.xConstraint.constant = -40;
                self.dropZoneView.alpha = 1;
                [self.view layoutIfNeeded]; // Called on parent view
            } completion:^(BOOL finished) {
                nil;
            }];
        }
        
        if (_feedView.frame.origin.y < self.threshold) {
            [self.view layoutIfNeeded];
            [UIView animateWithDuration:.25 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                self.xConstraint.constant = -40;
                self.dropZoneView.alpha = 1;
                [self.view layoutIfNeeded]; // Called on parent view
            } completion:^(BOOL finished) {
                nil;
            }];
        }
        
        else {
            [self.view layoutIfNeeded];
            [UIView animateWithDuration:.25 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                self.xConstraint.constant = 10;
                self.dropZoneView.alpha = 0;

                [self.view layoutIfNeeded]; // Called on parent view
            } completion:^(BOOL finished) {
                nil;
            }];
        }
        
    }
    // Determine the in or out position based on y origin
    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded ||
               panGestureRecognizer.state == UIGestureRecognizerStateCancelled) {
        
        if (_feedView.frame.origin.y < 200) {
            [self.view layoutIfNeeded];
            [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:15 options:0 animations:^{
                _feedView.frame = _inFrame;
                [self.view layoutIfNeeded];
                self.xConstraint.constant = -40;
                
            } completion:^(BOOL finished) {
                nil;
            }];
            [UIView animateWithDuration:.25 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                self.dropZoneView.alpha = 0;
                
                [self.view layoutIfNeeded]; // Called on parent view
            } completion:^(BOOL finished) {
                nil;
            }];
            [self wiggleIt:_feedView :YES];

        }
        
        else {
            [self.view layoutIfNeeded];
            [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:15 options:0 animations:^{
                _feedView.frame = _outFrame;
                [self.view layoutIfNeeded];
                self.xConstraint.constant = 10;

            } completion:^(BOOL finished) {
                nil;
            }];
             
            [UIView animateWithDuration:.25 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                self.dropZoneView.alpha = 0;
                
                [self.view layoutIfNeeded]; // Called on parent view
            } completion:^(BOOL finished) {
                nil;
            }];
            [self wiggleIt:_feedView :NO];
        }
    }
}

-(void)onTap:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSLog(@"double tap");
    
    _initialFrame = self.feedView.frame;
    [self.view layoutIfNeeded];
    
    if (_feedView.frame.origin.y > 200) {
        [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:12 options:0 animations:^{
            _initialFrame = _inFrame;
            self.xConstraint.constant = -40;
            [self.view layoutIfNeeded];
            [_feedView setFrame:_initialFrame];
        } completion:nil];
       [self wiggleIt:_feedView :YES];
    }
    else {
        [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:12 options:0 animations:^{
            _initialFrame = _outFrame;
            self.xConstraint.constant = 10;
            [self.view layoutIfNeeded];
            [_feedView setFrame:_initialFrame];
        } completion:nil];
        [self wiggleIt:_feedView :NO];
    }
   
}

@end
