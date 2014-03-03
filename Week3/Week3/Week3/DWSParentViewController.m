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

@property (nonatomic, assign) CGFloat slip;
@property (nonatomic, assign) CGFloat translation;
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
       // CGRect frictionFrame = _initialViewFrame;
        newFrame.origin.y += [panGestureRecognizer translationInView:self.view].y;

        NSLog(@"y is: %f", newFrame.origin.y);

        if (newFrame.origin.y < -1.0) {
           // NSLog(@"Friction zone!");

//            //friction range
//            CGFloat const frictionMin = 0.0;
//            CGFloat const frictionMax = -100.0;
//            //pan range
//            CGFloat const panStart = self.view.frame.origin.y;
//            //[panGestureRecognizer locationOfTouch:panGestureRecognizer.hash inView:self.view].y;
//            CGFloat const panEnd = [panGestureRecognizer translationInView:self.view].y;
//            
            
            //friction range
            CGFloat const panStart = 0.0;
            CGFloat const panEnd = 250.0;
            //pan range
            CGFloat const frictionMin = self.view.frame.origin.y;
            //[panGestureRecognizer locationOfTouch:panGestureRecognizer.hash inView:self.view].y;
            CGFloat const frictionMax = [panGestureRecognizer translationInView:self.view].y;
//
//            _translation = 0.0;
//            _slip = 0.0;
            
            _translation = [panGestureRecognizer translationInView:self.view].y;
            
            _slip = frictionMin + (_translation - panStart)/(panEnd - panStart)*(frictionMax - frictionMin);

            newFrame.origin.y += _slip;
        //    NSLog(@"slip is: %f", _slip);

            [self.feedController.view setFrame:newFrame];

        }

       if ([panGestureRecognizer translationInView:self.view].y >= 0) {
            _frameDown = YES;
            [self.feedController.view setFrame:newFrame];

        }
        else {
            _frameDown = NO;
            [self.feedController.view setFrame:newFrame];

        }
        
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
