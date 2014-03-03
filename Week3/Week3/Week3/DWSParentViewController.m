//
//  DWSParentViewController.m
//  Week3
//
//  Created by Daniel Warner Smith on 2/25/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSParentViewController.h"
#import "DWSFeedViewController.h"
#import "DWSMenuViewController.h"

@interface DWSParentViewController ()
@property DWSFeedViewController *feedController;
@property DWSMenuViewController *menuController;
- (void)onPan:(UIPanGestureRecognizer *)panGestureRecognizer;

@property (nonatomic, assign) CGRect initialViewFrame;
@property (nonatomic, assign) BOOL frameDown;

@end

@implementation DWSParentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.feedController = [[DWSFeedViewController alloc] init];
        self.menuController = [[DWSMenuViewController alloc] init];
        //add .view to the viewcontroller to get add it's view to the subview
        [self.view addSubview:self.menuController.view];
        [self.view addSubview:self.feedController.view];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
	[self.feedController.view addGestureRecognizer:panGestureRecognizer];
    self.frameDown = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onPan:(UIPanGestureRecognizer *)panGestureRecognizer {

    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        _initialViewFrame = self.feedController.view.frame;
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGRect newFrame = _initialViewFrame;
        newFrame.origin.y += [panGestureRecognizer translationInView:self.view].y;
        if ([panGestureRecognizer translationInView:self.view].y > 0) {
            _frameDown = YES;
        }
        else {
            _frameDown = NO;
        }
        [self.feedController.view setFrame:newFrame];
        
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded || panGestureRecognizer.state == UIGestureRecognizerStateCancelled) {
        CGRect lastFrame = _initialViewFrame;
          NSLog(@"pan ended");
        if (_frameDown == YES) {
           //NSLog(@"Moved down");
            lastFrame.origin.y = 500;

            [UIView animateWithDuration:1
                                  delay:0
                 usingSpringWithDamping:1
                  initialSpringVelocity:12
                                options:UIViewAnimationOptionAllowUserInteraction animations:^{
                [self.feedController.view setFrame:lastFrame];
            } completion:nil];

        }
        else {
            //NSLog(@"Moved up");
            lastFrame.origin.y = 0;
            [UIView animateWithDuration:1
                                  delay:0
                 usingSpringWithDamping:1
                  initialSpringVelocity:12
                                options:UIViewAnimationOptionAllowUserInteraction animations:^{
                [self.feedController.view setFrame:lastFrame];
            } completion:nil];
        }
    }
}

@end
